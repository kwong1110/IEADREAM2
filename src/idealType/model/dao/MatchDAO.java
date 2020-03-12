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
			System.out.println("insertMatch"+ m.toString());
			pstmt.setInt(1, m.getUserNo());
			pstmt.setInt(2, m.getTargetNo());
			pstmt.setDouble(3, m.getSync());

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
					m.setTargetNo(rs.getInt("TARGET_NO"));
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
		if (item.equals("AGE")) {
			String query = prop.getProperty("getAgeCount");
		}
		ArrayList<Stat> list = new ArrayList<Stat>();
		try {
			  pstmt = conn.prepareStatement(query);
			  rs = pstmt.executeQuery();
			  
			  while(rs.next()) {
				  Stat stat = new Stat();
				  
				  switch(item) {
				  case "SHAPE": case "STYLE": case "JOB" :
					  stat.setItem(rs.getString(item));break;				  
				  default : stat.setItem("" + rs.getInt(item)); break;
				  }
				  
				  stat.setProp(rs.getInt(2));
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
		String query = "SELECT "+item+", COUNT(USER_NO) FROM USER_PREFER JOIN ACCOUNT USING (USER_NO) WHERE GENDER = "+gender+" GROUP BY "+item+" ORDER BY COUNT(*) DESC";
		
		ArrayList<Stat> list = new ArrayList<Stat>();
		try {
			  pstmt = conn.prepareStatement(query);
			  pstmt.setString(1, item);
			  pstmt.setString(2, gender);
			  pstmt.setString(3, item);
			  rs = pstmt.executeQuery();
			  
			  while(rs.next()) {
				  Stat stat = new Stat();
				  switch(item) {
				  case "SHAPE": case "STYLE": case "JOB" :
					  stat.setItem(rs.getString(item));break;				  
				  default : stat.setItem("" + rs.getInt(item)); break;
				  }
				  stat.setProp(rs.getInt(2));
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
			  
			  while(rs.next()) {
				  Stat stat = new Stat();
				  stat.setItem(rs.getString(1));
				  stat.setProp(rs.getInt(2));
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
	public int getUserInfoCount(Connection conn, String gender) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getUserInfoCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, gender);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	public int getUserPreferCount(Connection conn, String gender) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getUserPreferCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, gender);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
}
