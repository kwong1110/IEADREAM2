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
import java.util.Arrays;
import java.util.Properties;

import account.model.dao.UserInfoDAO;
import account.model.vo.UserInfo;
import board.model.vo.Board;
import idealType.model.vo.Match;
import idealType.model.vo.Stat;

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
					m.setMatchDate(rs.getDate("MATCH_DATE"));
					m.setSync(rs.getDouble("SYNC"));
					list.add(m);
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

	public Stat[] getUiProp(Connection conn, String item, String gender) {
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		String query = prop.getProperty("getUiCount");
		//SELECT ?, COUNT AS PROP FROM USER_INFO JOIN ACCOUNT USING (USER_NO) GROUP BY ? ORDER BY PROP DESC WHERE GENDER = ?;
		if (item.equals("age")) {
			query = prop.getProperty("getAgeCount");
		}
		ArrayList<Stat> list = new ArrayList<Stat>();
		try {
			  pstmt = conn.prepareStatement(query);
			  pstmt.setString(1, item);
			  pstmt.setString(2, item);
			  pstmt.setString(3, gender);
			  rs = pstmt.executeQuery();
			  int total = rs.getInt("TOTAL");
			  
			  while(rs.next()) {
				  Stat stat = new Stat();
				  stat.setItem(rs.getString(item));
				  stat.setProp(rs.getInt("PROP")/total);
				  list.add(stat);
			  }
			  
		  } catch (SQLException e) { 
			  e.printStackTrace(); 
		  } finally {
			close(rs);
			close(pstmt);
		  }
		Stat[] result = new Stat[list.size()];
		int size=0;
		for(Stat temp : list){
				result[size++] = temp;
	  	}
		return result;	
	}
	
	public Stat[] getUpProp(Connection conn, String item, String gender) {
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		String query = prop.getProperty("getUpCount");
		
		ArrayList<Stat> list = new ArrayList<Stat>();
		try {
			  pstmt = conn.prepareStatement(query);
			  pstmt.setString(1, item);
			  pstmt.setString(2, item);
			  pstmt.setString(3, gender);
			  rs = pstmt.executeQuery();
			  int total = rs.getInt("TOTAL");
			  
			  while(rs.next()) {
				  Stat stat = new Stat();
				  stat.setItem(rs.getString(item));
				  stat.setProp(rs.getInt("PROP")/total);
				  list.add(stat);
			  }
			  
		  } catch (SQLException e) { 
			  e.printStackTrace(); 
		  } finally {
			close(rs);
			close(pstmt);
		  }
		Stat[] result = new Stat[list.size()];
		int size=0;
		for(Stat temp : list){
				result[size++] = temp;
	  	}
		return result;	
	}
	public Stat[] getInterestProp(Connection conn, String gender) {
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		String query = prop.getProperty("getInterestCount");
		
		ArrayList<Stat> list = new ArrayList<Stat>();
		try {
			  pstmt = conn.prepareStatement(query);
			  pstmt.setString(1, gender);
			  rs = pstmt.executeQuery();
			  int total = rs.getInt("TOTAL");
			  
			  while(rs.next()) {
				  Stat stat = new Stat();
				  stat.setItem(rs.getString("INTEREST"));
				  stat.setProp(rs.getInt("PROP")/total);
				  list.add(stat);
			  }
			  
		  } catch (SQLException e) { 
			  e.printStackTrace(); 
		  } finally {
			close(rs);
			close(pstmt);
		  }
		Stat[] result = new Stat[list.size()];
		int size=0;
		for(Stat temp : list){
				result[size++] = temp;
	  	}
		return result;	
	}
	
}
