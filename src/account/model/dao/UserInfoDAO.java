package account.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import account.model.vo.UserInfo;
import account.model.vo.UserPhoto;

public class UserInfoDAO {

	private Properties prop = new Properties();
	
	public UserInfoDAO() {
		String fileName = UserInfoDAO.class.getResource("/sql/account/account-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int insertUserInfo(Connection conn, UserInfo ui) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertUserInfo");
		int result= 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, ui.getUserNo());
			pstmt.setString(2, ui.getHello());
			pstmt.setInt(3, ui.getHeight());
			pstmt.setString(4, ui.getShape());
			pstmt.setString(5, ui.getStyle());
			pstmt.setInt(6, ui.getRegion());
			pstmt.setString(7, ui.getReligion());
			pstmt.setInt(8,ui.getScholar());
			pstmt.setString(9, ui.getJob());
			pstmt.setInt(10, ui.getDrink());
			pstmt.setInt(11, ui.getSmoke());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}
	public int updateUserInfo(Connection conn, UserInfo ui) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateUserInfo");
		int result= 0;
		
		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, ui.getHello());
			pstmt.setInt(2, ui.getHeight());
			pstmt.setString(3, ui.getShape());
			pstmt.setString(4, ui.getStyle());
			pstmt.setInt(5, ui.getRegion());
			pstmt.setString(6, ui.getReligion());
			pstmt.setInt(7,ui.getScholar());
			pstmt.setString(8, ui.getJob());
			pstmt.setInt(9, ui.getDrink());
			pstmt.setInt(10, ui.getSmoke());
			pstmt.setInt(11, ui.getUserNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertInterest(Connection conn, UserInfo ui) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertInterest");
		int result = 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			for(int i = 0; i < ui.getInterest().length; i++) {
				pstmt.setInt(1, ui.getUserNo());
				pstmt.setString(2, ui.getInterest()[i]);
				pstmt.addBatch();
				pstmt.clearParameters();
			}
			pstmt.executeBatch();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteInterest(Connection conn, UserInfo ui) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteInterest");
		int result= 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, ui.getUserNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int insertPhoto(Connection conn, UserPhoto p) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertPhoto");
		int result= 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,p.getUserNo());
			pstmt.setString(2, p.getOriginName());
			pstmt.setString(3, p.getChangeName());
			pstmt.setString(4, p.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int deletePhoto(Connection conn, UserPhoto p) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deletePhoto");
		int result= 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, p.getUserNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
