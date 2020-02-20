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
	public int updateUserInfo(Connection conn, UserInfo ui) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateUserInfo");
		int result= 0;
		
		try {
			pstmt = conn.prepareStatement(query);
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
	
	
}
