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

import board.model.vo.Board;
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

	public int getHhListCount(Connection conn, String userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = 0;
		
		String query = prop.getProperty("getHhListCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userNo);
			pstmt.setString(2, userNo);
			
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

	public ArrayList<Match> selectHhList(Connection conn, int currentPage, String userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Match> list = null;
		int posts = 5;
		
		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;
		
		String query = prop.getProperty("selectHhList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userNo);
			pstmt.setString(2, userNo);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Match>();
			
			while(rset.next()) {
				Match r = new Match(rset.getInt("user_no"),
								    rset.getInt("target_no"),
									rset.getString("status"),
									rset.getDate("match_date"),
									rset.getString("deleted").charAt(0));
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

	public int getmWListCount(Connection conn, String userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = 0;
		
		String query = prop.getProperty("getmWListCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userNo);
			
			
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

	public int getSearchmWListCount(Connection conn, String bCategory, String sCategory, String sWord, String userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = 0;
		
		String query = "";
		switch(sCategory) {
		case "B_NAME": query = prop.getProperty("mWsearchBNameListCount"); break;
		case "B_DATE": query = prop.getProperty("mWsearchBDateListCount"); break;
		}
		
		if(bCategory.equals("2,4,5")) {
			switch(sCategory) {
			case "B_NAME": query = prop.getProperty("mWallSearchBNameListCount"); break;
			case "B_DATE": query = prop.getProperty("mWallSearchBDateListCount"); break;
			}
		}
		
		try {
			pstmt = conn.prepareStatement(query);
			
			if(bCategory.equals("2,4,5")) {
				pstmt.setString(1, "%" + sWord + "%");
				pstmt.setString(2, userNo);
			}else {
				pstmt.setString(1, bCategory);
				pstmt.setString(2, "%" + sWord + "%");
				pstmt.setString(3, userNo);
			}
			
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

	public ArrayList<Board> selectmWList(Connection conn, int currentPage, String userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		int posts = 10;
		
		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;
		
		String query = prop.getProperty("selectmWList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Board>();
			
			while(rset.next()) {
				Board b = new Board();
				b.setPostNo(rset.getInt("POST_NO"));
				b.setHit(rset.getInt("HIT"));
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setTitle(rset.getString("TITLE"));
				b.setCreateDate(rset.getDate("CREATE_DATE"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Board> searchmWList(Connection conn, int currentPage, String bCategory, String sCategory,
			String sWord, String userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> search = null;
		
		//System.out.println("adminDAO sWord 변수 확인 : " + sWord);
		
		int posts = 10;		// 한 페이지에 보여질 게시글 개수 
		
		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;
		
		String query = "";
		switch(sCategory) {
		case "B_NAME": query = prop.getProperty("mWsearchBNameList"); break;
		case "B_DATE": query = prop.getProperty("mWsearchBDateList"); break;
		}
		
		if(bCategory.equals("2,4,5")) {
			switch(sCategory) {
			case "B_NAME": query = prop.getProperty("mWallSearchBNameList"); break;
			case "B_DATE": query = prop.getProperty("mWallSearchBDateList"); break;
			}
		}
		
		try {
			pstmt = conn.prepareStatement(query);
			
			if(!bCategory.equals("2,4,5")) {
				pstmt.setString(1, userNo);
				pstmt.setString(2, bCategory);
				pstmt.setString(3, "%" + sWord + "%");					
				pstmt.setInt(4, startRow);
				pstmt.setInt(5, endRow);
			}else {
				pstmt.setString(1, userNo);
				pstmt.setString(2, "%" + sWord + "%");					
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
			}
			
			rset = pstmt.executeQuery();
			search = new ArrayList<Board>();
			
			while(rset.next()) {
				Board b = new Board();

				b.setPostNo(rset.getInt("POST_NO"));
				b.setHit(rset.getInt("HIT"));
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setTitle(rset.getString("TITLE"));
				b.setCreateDate(rset.getDate("CREATE_DATE"));
				
				search.add(b);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return search;
	}

	public int deleteMyBo(Connection conn, String[] bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMyBo");
		
		try {
			for(int i = 0; i < bNo.length; i++) {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, bNo[i]);
				
				result = pstmt.executeUpdate();
				
				if(result > 0) {
					commit(conn);
				} else {
					rollback(conn);
					break;
				}
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteHeart(Connection conn, String[] userNo, String[] targetNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteHeart");
		
		try {
			for(int i = 0; i < userNo.length; i++) {
				// targetNo와 userNo가 반대로 였음.
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, targetNo[i]);
				pstmt.setString(2, userNo[i]);
				
				result = pstmt.executeUpdate();
				
				if(result > 0) {
					commit(conn);
				} else {
					rollback(conn);
					break;
				}
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int heartAutoDelete(Connection conn, String[] autoDTarget, String[] autoDUser) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteHeart");
		
		try {
			for(int i = 0; i < autoDTarget.length; i++) {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, autoDUser[i]);
				pstmt.setString(2, autoDTarget[i]);
				
				
				result = pstmt.executeUpdate();
				
				if(result > 0) {
					commit(conn);
				} else {
					rollback(conn);
					break;
				}
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int searchDate(Connection conn, String userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int locationNum = 0;
		
		String query = prop.getProperty("searchDatelocation");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				locationNum = rset.getInt("region");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return locationNum;
	}

	public int heartOk(Connection conn, String okTarget, String okUser) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("heartOk");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, okUser);
			pstmt.setString(2, okTarget);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int heartNo(Connection conn, String okTarget, String okUser) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("heartNo");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, okUser);
			pstmt.setString(2, okTarget);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
