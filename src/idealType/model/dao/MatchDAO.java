package idealType.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import account.model.dao.UserInfoDAO;
import account.model.vo.UserInfo;
import idealType.model.vo.Match;

public class MatchDAO {
	
	private Properties prop = new Properties();
	
	public MatchDAO() {
		String fileName = MatchDAO.class.getResource("/sql/idealType/idealType-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int insertMatch(Connection conn, Match m) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertMatch");
		int result= 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, m.getUserNo());
			pstmt.setInt(2, m.getTargetNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}
	public int updateMatch(Connection conn, Match m) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateMatch");
		int result= 0;
		
		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, m.getStatus());
			pstmt.setInt(2, m.getUserNo());
			pstmt.setInt(3, m.getTargetNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}	
	
	public Match[] selectMatchList(Connection conn, int userNo) {
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		String query = prop.getProperty("selectMatchList");
		
		ArrayList<Match> list = new ArrayList<Match>();
		try {
			  pstmt = conn.prepareStatement(query);
			  pstmt.setInt(1, userNo);
			  rs = pstmt.executeQuery();
			  while(rs.next()) {
				Match m = new Match();
					m.setUserNo(rs.getInt("USER_NO"));
					m.setUserNo(rs.getInt("TARGET_NO"));
					m.setStatus(rs.getString("STATUS"));
					m.setMatchDate(rs.getDate("DATE"));
					m.setSync(rs.getDouble("SYNC"));
			  }
		  } catch (SQLException e) { 
			  e.printStackTrace(); 
		  } finally {
			close(rs);
			close(pstmt);
		  }
		Match[] result = new Match[list.size()];
			int size=0;
		  	for(Match temp : list){
		    result[size++] = temp;
		  }
		return result;
	}


}
