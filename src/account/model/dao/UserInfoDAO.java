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

public class UserInfoDAO {

	private Properties prop = new Properties();
	
	public UserInfoDAO() {
		String fileName = AccountDAO.class.getResource("/sql/account/account-query.properties").getPath();
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
	public int updateUserInfo(Connection conn, UserInfo ui) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateUserInfo");
		int result= 0;
		
		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, ui.getThumb());
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
			pstmt.setInt(12, up.getUserNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertInterest(Connection conn, UserInterest ut) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertInterest");
		int result= 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, ut.getUserNo());
			pstmt.setString(2, ut.getInterest());
			
			result = pstmt.executeUpdate();
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
			pstmt.setInt(1, ui.getUserNo()));
			pstmt.setString(2, ui.getInterest());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	

	
}
