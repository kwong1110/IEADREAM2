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

public class PartyReviewDAO {
	private Properties prop = new Properties();
	
	public PartyReviewDAO() {
		String fileName = PartyReviewDAO.class.getResource("/sql/loveParty/partyReview-query.properties").getPath();
		
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
	// 리스트 뷰
		public ArrayList<Board> selectList(Connection conn, int currentPage) {
			PreparedStatement pstmt = null;
			ArrayList<Board> list = null;
			ResultSet rset = null;
			int posts = 10;
			
			int startRow = (currentPage -1)*posts + 1;
			int endRow = startRow + posts -1;
			
			String query = prop.getProperty("selectList");
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				list = new ArrayList<Board>();
				rset = pstmt.executeQuery();
				while(rset.next()) {
					 list.add(new Board(rset.getInt("BOARD_NO"),
							 rset.getInt("POST_NO"), 
			 				rset.getString("ID"), 
			 				rset.getString("title"), 
						  	rset.getDate("CREATE_DATE"),
						  	rset.getInt("hit")));
					 	System.out.println(list);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return list;
		}

	
	public ArrayList<Board> selectImage(Connection conn, int postNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectImage");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			
			rs = pstmt.executeQuery();
			list = new ArrayList<Board>();
			
			while(rs.next()) {
				Board board = new Board();
				board.setPostNo(rs.getInt("postNo"));
				board.setPartyNo(rs.getInt("partyNo"));
				board.setUserName(rs.getString("userName"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setCreateDate(rs.getDate("createDate"));
				board.setHit(rs.getInt("hit"));
				prl.setPartyPhoto(rs.getString("partyPhoto"));
				prl.setDeleted(rs.getString("deleted").charAt(0));
			list.add(prl);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	
}
