package myPage.admin.model.dao;

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

import account.model.vo.Account;
import board.model.vo.Board;

public class adminDAO {
	private Properties prop = new Properties();
	
	public adminDAO() {
		String fileName = adminDAO.class.getResource("/sql/myPage/admin.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		
		int result = 0;
		
		String query = prop.getProperty("getListCount");
		
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
	
	public int getSearchListCount(Connection conn, String memGrade, String sCategory, String sWord) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = 0;
		
		String query = "";
		switch(sCategory) {
		case "USER_NAME": query = prop.getProperty("searchNameListCount"); break;
		case "USER_NO": query = prop.getProperty("searchNoListCount"); break;
		case "ID": query = prop.getProperty("searchIDListCount"); break;
		}
		
		if(memGrade.equals("0,1,2")) {
			switch(sCategory) {
			case "USER_NAME": query = prop.getProperty("allSearchNameListCount"); break;
			case "USER_NO": query = prop.getProperty("allSearchNoListCount"); break;
			case "ID": query = prop.getProperty("allSearchIDListCount"); break;
			}
		}
		
		try {
			pstmt = conn.prepareStatement(query);
			
			if(memGrade.equals("0,1,2")) {
				pstmt.setString(1, "%" + sWord + "%");					
			}else {
				pstmt.setString(1, memGrade);
				pstmt.setString(2, "%" + sWord + "%");
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

	public ArrayList<Account> selectMmList(Connection conn, int currentPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Account> list = null;
		
		int posts = 10;		// 한 페이지에 보여질 게시글 개수 
		
		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;
		
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Account>();
			
			while(rset.next()) {
				Account a = new Account(rset.getInt("USER_NO"),
										rset.getInt("GRADE"),
										rset.getString("ID"),
										rset.getString("GENDER"),
										rset.getString("USER_NAME"),
										rset.getString("PHONE"),
										rset.getString("DELETED"));
				list.add(a);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Account> searchMmList(Connection conn, int currentPage, String memGrade, String sCategory, String sWord) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Account> search = null;
		
		//System.out.println("adminDAO sWord 변수 확인 : " + sWord);
		
		int posts = 10;		// 한 페이지에 보여질 게시글 개수 
		
		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;
		
		String query = "";
		switch(sCategory) {
		case "USER_NAME": query = prop.getProperty("searchNameList"); break;
		case "USER_NO": query = prop.getProperty("searchNoList"); break;
		case "ID": query = prop.getProperty("searchIDList"); break;
		}
		
		if(memGrade.equals("0,1,2")) {
			switch(sCategory) {
			case "USER_NAME": query = prop.getProperty("allSearchNameList"); break;
			case "USER_NO": query = prop.getProperty("allSearchNoList"); break;
			case "ID": query = prop.getProperty("allSearchIDList"); break;
			}
		}
		
		try {
			pstmt = conn.prepareStatement(query);
			
			if(!memGrade.equals("0,1,2")) {
				pstmt.setString(1, memGrade);
				pstmt.setString(2, "%" + sWord + "%");					
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
			}else {
				pstmt.setString(1, "%" + sWord + "%");					
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
			
			rset = pstmt.executeQuery();
			search = new ArrayList<Account>();
			
			while(rset.next()) {
				Account a = new Account(rset.getInt("USER_NO"),
										rset.getInt("GRADE"),
										rset.getString("ID"),
										rset.getString("GENDER"),
										rset.getString("USER_NAME"),
										rset.getString("PHONE"),
										rset.getString("DELETED"));
				search.add(a);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return search;
	}

	public int updateGrade(Connection conn, String checkCategory, String[] userNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateGrade");
		
		try {
			for(int i = 0; i < userNo.length; i++) {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, checkCategory);
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

	public int deleteMem(Connection conn, String[] userNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMem");
		
		try {
			for(int i = 0; i < userNo.length; i++) {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, userNo[i]);
				
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

	public int getBListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		
		int result = 0;
		
		String query = prop.getProperty("getBListCount");
		
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

	public int getSearchBListCount(Connection conn, String bCategory, String sCategory, String sWord) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = 0;
		
		String query = "";
		switch(sCategory) {
		case "B_NAME": query = prop.getProperty("searchBNameListCount"); break;
		case "B_DATE": query = prop.getProperty("searchBDateListCount"); break;
		case "ID": query = prop.getProperty("searchBIDListCount"); break;
		}
		
		if(bCategory.equals("1,2,3,4,5,6")) {
			switch(sCategory) {
			case "B_NAME": query = prop.getProperty("allSearchBNameListCount"); break;
			case "B_DATE": query = prop.getProperty("allSearchBDateListCount"); break;
			case "ID": query = prop.getProperty("allSearchIDListCount"); break;
			}
		}
		
		try {
			pstmt = conn.prepareStatement(query);
			
			if(bCategory.equals("1,2,3,4,5,6")) {
				pstmt.setString(1, "%" + sWord + "%");					
			}else {
				pstmt.setString(1, bCategory);
				pstmt.setString(2, "%" + sWord + "%");
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

	public ArrayList<Board> selectBList(Connection conn, int currentPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		int posts = 10;		// 한 페이지에 보여질 게시글 개수 
		
		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;
		
		String query = prop.getProperty("selectBList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Board>();
			
			while(rset.next()) {
				Board b = new Board();
				b.setPostNo(rset.getInt("POST_NO"));
				b.setUserId(rset.getString("ID"));
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

	public ArrayList<Board> searchBList(Connection conn, int currentPage, String bCategory, String sCategory,
			String sWord) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> search = null;
		
		//System.out.println("adminDAO sWord 변수 확인 : " + sWord);
		
		int posts = 10;		// 한 페이지에 보여질 게시글 개수 
		
		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;
		
		String query = "";
		switch(sCategory) {
		case "B_NAME": query = prop.getProperty("searchBNameList"); break;
		case "B_DATE": query = prop.getProperty("searchBDateList"); break;
		case "ID": query = prop.getProperty("searchBIDList"); break;
		}
		
		if(bCategory.equals("1,2,3,4,5,6")) {
			switch(sCategory) {
			case "B_NAME": query = prop.getProperty("allSearchBNameList"); break;
			case "B_DATE": query = prop.getProperty("allSearchBDateList"); break;
			case "ID": query = prop.getProperty("allSearchBIDList"); break;
			}
		}
		
		try {
			pstmt = conn.prepareStatement(query);
			
			if(!bCategory.equals("1,2,3,4,5,6")) {
				pstmt.setString(1, bCategory);
				pstmt.setString(2, "%" + sWord + "%");					
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
			}else {
				pstmt.setString(1, "%" + sWord + "%");					
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
			
			rset = pstmt.executeQuery();
			search = new ArrayList<Board>();
			
			while(rset.next()) {
				Board b = new Board();

				b.setPostNo(rset.getInt("POST_NO"));
				b.setUserId(rset.getString("ID"));
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

	public int deleteBo(Connection conn, String[] bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteBo");
		
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
}
