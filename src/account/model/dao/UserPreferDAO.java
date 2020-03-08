package account.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import account.model.vo.UserInfo;
import account.model.vo.UserPrefer;



public class UserPreferDAO {

	private Properties prop = new Properties();

	public UserPreferDAO() {
		String fileName = UserPreferDAO.class.getResource("/sql/account/account-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}
	public UserPrefer selectUserPrefer(Connection conn, int userNo) {
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		UserPrefer up = new UserPrefer();
		String query = prop.getProperty("selectUserPrefer");
		
		try {
			  pstmt = conn.prepareStatement(query);
			  pstmt.setInt(1, userNo);
			  rs = pstmt.executeQuery();
			  	up.setUserNo(userNo);
				up.setHeight(rs.getInt("HEIGHT"));
				up.setHeightPri(rs.getInt("HEIGHT_PRI"));
				up.setShape(rs.getString("SHAPE"));
				up.setShapePri(rs.getInt("SHAPE_PRI"));
				up.setStyle(rs.getString("STYLE"));
				up.setStylePri(rs.getInt("STYLE_PRI"));
				up.setAge(rs.getInt("AGE"));
				up.setAgePri(rs.getInt("AGE_PRI"));
				up.setRegionPri(rs.getInt("REGION_PRI"));
				up.setReligion(rs.getString("RELIGION"));
				up.setReligionPri(rs.getInt("RELIGION_PRI"));
				up.setScholar(rs.getInt("SCHOLAR"));
				up.setScholarPri(rs.getInt("SCHOLAR_PRI"));
				up.setJob(rs.getString("JOB"));
				up.setJobPri(rs.getInt("JOB_PRI"));
				up.setDrink(rs.getInt("DRINK"));
				up.setDrinkPri(rs.getInt("DRINK_PRI"));
				up.setSmoke(rs.getInt("SMOKE"));
				up.setSmokePri(rs.getInt("SMOKE_PRI"));
				up.setInterestPri(rs.getInt("INTERST_PRI"));
		  } catch (SQLException e) { 
			  e.printStackTrace(); 
		  } finally {
			close(rs);
			close(pstmt);
		  }
		return up;
	}
	
	public int insertUserPrefer(Connection conn, UserPrefer up) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertUserPrefer");
		int result= 0;
		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, up.getUserNo());
			pstmt.setInt(2, up.getHeight());
			pstmt.setInt(3, up.getHeightPri());
			pstmt.setString(4, up.getShape());
			pstmt.setInt(5, up.getShapePri());
			pstmt.setString(6, up.getStyle());
			pstmt.setInt(7, up.getStylePri());
			pstmt.setInt(8, up.getAge());
			pstmt.setInt(9, up.getAgePri());
			pstmt.setInt(11, up.getRegionPri());
			pstmt.setString(12, up.getReligion());
			pstmt.setInt(13, up.getReligionPri());
			pstmt.setInt(14, up.getScholar());
			pstmt.setInt(15, up.getScholarPri());
			pstmt.setString(16, up.getJob());
			pstmt.setInt(17, up.getJobPri());
			pstmt.setInt(18, up.getDrink());
			pstmt.setInt(19, up.getDrinkPri());
			pstmt.setInt(20, up.getSmoke());
			pstmt.setInt(21, up.getSmokePri());
			pstmt.setInt(22, up.getInterestPri());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateUserPrefer(Connection conn, UserPrefer up) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateUserPrefer");
		int result= 0;
		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, up.getHeight());
			pstmt.setInt(2, up.getHeightPri());
			pstmt.setString(3, up.getShape());
			pstmt.setInt(4, up.getShapePri());
			pstmt.setString(5, up.getStyle());
			pstmt.setInt(6, up.getStylePri());
			pstmt.setInt(7, up.getAge());
			pstmt.setInt(8, up.getAgePri());
			pstmt.setInt(10, up.getRegionPri());
			pstmt.setString(11, up.getReligion());
			pstmt.setInt(12, up.getReligionPri());
			pstmt.setInt(13, up.getScholar());
			pstmt.setInt(14, up.getScholarPri());
			pstmt.setString(15, up.getJob());
			pstmt.setInt(16, up.getJobPri());
			pstmt.setInt(17, up.getDrink());
			pstmt.setInt(18, up.getDrinkPri());
			pstmt.setInt(19, up.getSmoke());
			pstmt.setInt(20, up.getSmokePri());
			pstmt.setInt(21, up.getInterestPri());

			pstmt.setInt(22, up.getUserNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
}
