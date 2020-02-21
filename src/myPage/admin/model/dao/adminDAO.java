package myPage.admin.model.dao;

import static common.JDBCTemplate.close;

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
										rset.getString("GENDER").charAt(0),
										rset.getString("USER_NAME"),
										rset.getString("PHONE"),
										rset.getString("DELETED").charAt(0));
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
										rset.getString("GENDER").charAt(0),
										rset.getString("USER_NAME"),
										rset.getString("PHONE"),
										rset.getString("DELETED").charAt(0));
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

	
}
