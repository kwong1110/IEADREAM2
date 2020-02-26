package myPage.user.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import account.model.vo.Account;
import account.model.vo.UserInfo;

public class userProfileDAO {
	
	private Properties prop = new Properties();
	
	public userProfileDAO() {
		String fileName = userProfileDAO.class.getResource("/sql/myPage/userProfile-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Account selectProfile(Connection conn, String loginUser) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Account account = null;
		
		String query = prop.getProperty("selectProfile");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginUser);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				account = new Account(rs.getInt("user_no"),
									  rs.getInt("grade"),
									  rs.getString("id"),
									  rs.getString("password"),
									  rs.getString("gender"),
									  rs.getString("user_name"),
									  rs.getString("phone"),
									  rs.getString("email"),
									  rs.getDate("birth"),
									  rs.getString("deleted"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return account;
	}

	public int updateProfile(Connection conn, Account account) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateProfile");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, account.getUserName());
			pstmt.setString(2, account.getPassword());
			pstmt.setString(3, account.getEmail());
			pstmt.setString(4, account.getPhone());
			pstmt.setString(5, account.getId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteProfile(Connection conn, Account account) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("deleteProfile");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, account.getId());
			pstmt.setString(2, account.getPassword());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public UserInfo updateUserInfo(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		UserInfo ui = null;
		
		String query = prop.getProperty("updateUserInfo");
		String query2 = prop.getProperty("updateUserInfoInterest");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);
			rs = pstmt.executeQuery();
			
			pstmt2 = conn.prepareStatement(query2);
			pstmt.setInt(1, userNo);
			rs2 = pstmt.executeQuery();
			
			// 관심분야 String배열에 담기
			String[] sArr = new String[20]; 
			while(rs2.next()) {
				for(int i = 0; i < sArr.length; i++) {
					sArr[i] = rs2.getString("interest");
				}
			}
			// 회원 이상형 정보 객체에 String배열을 포함한 모든 정보 담아 return
			if(rs.next()) {
				ui = new UserInfo(rs.getInt("user_no"),
								  rs.getString("thumb"),
								  rs.getString("hello"),
								  rs.getInt("height"),
								  rs.getString("shape"),
								  rs.getString("style"),
								  rs.getInt("region"),
								  rs.getString("rreligion"),
								  rs.getInt("scholar"),
								  rs.getString("job"),
								  rs.getInt("drink"),
								  rs.getInt("smoke"),
								  sArr
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs2);
			close(rs);
			close(pstmt2);
			close(pstmt);
		}
		return ui;
		
	}

	public int updateInfo(Connection conn, UserInfo ui) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("updateInfo");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, ui.getUserNo());
			pstmt.setString(2, ui.getThumb());
			pstmt.setString(3, ui.getHello());
			pstmt.setInt(4, ui.getHeight());
			pstmt.setString(5, ui.getShape());
			pstmt.setString(6, ui.getStyle());
			pstmt.setInt(7, ui.getRegion());
			pstmt.setString(8, ui.getReligion());
			pstmt.setInt(9,ui.getScholar());
			pstmt.setString(10, ui.getJob());
			pstmt.setInt(11, ui.getDrink());
			pstmt.setInt(12, ui.getSmoke());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateInter(Connection conn, UserInfo ui) {
		PreparedStatement pstmt0 = null;
		PreparedStatement pstmt = null;
		int result = 0;

		String query0 = prop.getProperty("deleteInter"); //기존 interest 지우기
		String query = prop.getProperty("updateInter"); //새로 들어온 interest 올리기
		
		try {
			pstmt = conn.prepareStatement(query0);
			pstmt.executeQuery();
			
			pstmt = conn.prepareStatement(query);
			for(int i = 0; i < ui.getInterest().length; i++) {
				pstmt.setInt(1, ui.getUserNo());
				pstmt.setString(2, ui.getInterest()[i]);
				pstmt.addBatch();
				pstmt.clearParameters(); //int 배열 반환값은 어떻게 함?
			}
			pstmt.executeBatch();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(pstmt0);
		}
		return result;
	}

}
