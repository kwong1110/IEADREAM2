package myPage.user.model.dao;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import myPage.user.model.vo.Match;


public class userDAO {
private Properties prop = new Properties();
	
	public userDAO() {
		String fileName = userDAO.class.getResource("/sql/myPage/user.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getHhListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		
		int result = 0;
		
		String query = prop.getProperty("getHhListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return result;
	}

	public ArrayList<Match> selectHhList(Connection conn, int currentPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Match> list = null;
		int posts = 10;
		
		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;
		
		String query = prop.getProperty("selectHhList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Match>();
			
			while(rset.next()) {
				Match r = new Match(rset.getInt("user_no"),
										   rset.getInt("target_no"),
										   rset.getString("match_status"),
										   rset.getDate("match_date"),
										   rset.getString("match_delete").charAt(0));
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int paymentMemGrade(Connection conn, String userNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("paymentMemGrade");
		// UPDATE ACCOUNT SET GRADE=2 WHERE USER_NO=?
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
