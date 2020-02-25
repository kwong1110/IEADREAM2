package board.model.dao;

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

import board.model.vo.Board;

public class FaqDAO {

	private Properties prop = new Properties();
	
	public FaqDAO() {
		String fileName = FaqDAO.class.getResource("/sql/questionBoard/faq-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Board> selectList(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectFaqList");
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			list = new ArrayList<Board>();
			
			while(rs.next()) {
				Board board = new Board(rs.getInt("post_no"),
							  rs.getString("title"),
							  rs.getString("content"),
							  rs.getString("category"));
				list.add(board);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return list;
	}

	public int faqInsert(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("faqInsert");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getCategory());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return result;
	}

	public ArrayList<Board> selectAdminList(Connection conn, int currentPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Board> list = null;
		
		int posts = 10;
		
		int startRow = (currentPage -1) * posts + 1;
		int endRow = startRow + posts -1;
		
		String query = prop.getProperty("selectAdminList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			list = new ArrayList<Board>();
			
			while(rs.next()) {
				Board board = new Board(
								rs.getString("category"),
								rs.getInt("post_no"),
								rs.getString("title"));
				
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public Board selectAdminDetail(Connection conn, int num) {
		PreparedStatement pstmt = null; //글 번호를 쿼리문에 넣어야 하기 때문에 pstmt 사용
		ResultSet rs = null;
		Board board = null;
		
		String query = prop.getProperty("selectAdminDetail");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new Board(rs.getInt("post_no"),
							  rs.getString("title"),
							  rs.getString("content"),
							  rs.getString("category"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return board;
		
	}

	public int updateFaq(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateFaq");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, board.getCategory());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
			pstmt.setInt(4, board.getPostNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteFaq(Connection conn, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteFaq");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int getListSearchCount(Connection conn, String search) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("getListSearchCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, "%"+search+"%");
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Board> selectSearchAdminList(Connection conn, int currentPage, String search) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Board> list = null;
		
		int posts = 10;
		
		int startRow = (currentPage -1) * posts + 1;
		int endRow = startRow + posts -1;
		
		String query = prop.getProperty("selectSearchAdminList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, "%"+search+"%");
			
			rs = pstmt.executeQuery();
			list = new ArrayList<Board>();
			
			while(rs.next()) {
				Board board = new Board(
						rs.getString("category"),
						rs.getInt("post_no"),
						rs.getString("title"));
				
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

}
