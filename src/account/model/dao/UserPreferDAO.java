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
import account.model.vo.UserPrefer;



public class UserPreferDAO {

	private Properties prop = new Properties();

	public UserPreferDAO() {
		String fileName = AccountDAO.class.getResource("/sql/account/account-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}
	public int updateUserPrefer(Connection conn, UserPrefer up) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateUserPrefer");
		int result= 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(2, up.getHeight());
			pstmt.setString(4, up.getShape());
			pstmt.setString(6, up.getStyle());
			pstmt.setInt(8, up.getRegion());
			pstmt.setString(10, up.getReligion());
			pstmt.setInt(12, up.getScholar());
			pstmt.setString(14, up.getJob());
			pstmt.setInt(16, up.getDrink());
			pstmt.setInt(18, up.getSmoke());
			
			pstmt.setInt(3, up.getHeightPRI());
			pstmt.setInt(5, up.getShapePRI());
			pstmt.setInt(7, up.getStylePRI());
			pstmt.setInt(9, up.getRegionPRI());
			pstmt.setInt(11, up.getReligionPRI());
			pstmt.setInt(13, up.getScholarPRI());
			pstmt.setInt(15, up.getJobPRI());
			pstmt.setInt(17, up.getDrinkPRI());
			pstmt.setInt(19, up.getSmokePRI());
			pstmt.setInt(20, up.getInterestPRI());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
}
