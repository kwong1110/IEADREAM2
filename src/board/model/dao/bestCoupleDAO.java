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

import board.model.vo.BestCouple;
import board.model.vo.Board;
import board.model.vo.Photo;

public class bestCoupleDAO {
	private Properties prop = new Properties();
	
	public bestCoupleDAO() {
		String fileName = bestCoupleDAO.class.getResource("/sql/coupleStory/bestCouple-query.properties").getPath();
		
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
		//getListCount=SELECT COUNT(*) FROM COUPLE_BEST
		
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

	public ArrayList<Board> selectbcList(Connection conn, int currentPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> bcList = null;
		
		int posts = 3;
		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;
		
		String query = prop.getProperty("selectbcList");
		//SELECT * FROM BCLIST WHERE RNUM BETWEEN ? AND ?
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			bcList = new ArrayList<Board>();
			
			while(rset.next()) {
				Board bc = new Board(rset.getInt("POST_NO"),
									rset.getInt("USER_NO"),
									rset.getString("TITLE"),
									rset.getDate("CREATE_DATE"),
									rset.getInt("HIT"));
				bcList.add(bc);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	
		return bcList;
	}

	public ArrayList<Photo> selectpList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		
		ArrayList<Photo> pList = null;
		
		String query = prop.getProperty("selectpList");
		//SELECT * FROM PHOTO WHERE DELETED='N' AND FILE_LEVEL=0
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			pList = new ArrayList<Photo>();
			
			while(rset.next()) {
				pList.add(new Photo(rset.getInt("PHOTO_NO"),
									rset.getInt("POST_NO"),
									rset.getString("ORIGIN_NAME"),
									rset.getString("CHANGE_NAME"),
									rset.getString("FILE_PATH"),
									rset.getInt("FILE_LEVEL"),
									rset.getString("DELETED")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return pList;
	}

	public int insertbcBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertbcBoard");
		//INSERT INTO BOARD VALUES(SEQ_POSTNO.NEXTVAL, ?, 1, ?, ?, SYSDATE, DEFAULT, DEFAULT);
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, b.getUserNo());
			pstmt.setString(2, b.getTitle());
			pstmt.setString(3, b.getContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertbcBestCouple(Connection conn, BestCouple bc) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertbcBestCouple");
		//INSERT INTO BEST_COUPLE VALUES(SEQ_POSTNO.CURRVAL, ?, ?, ?, ?)
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bc.getmName());
			pstmt.setString(2, bc.getfName());
			pstmt.setInt(3, bc.getDtPeriod());
			pstmt.setString(4, bc.getFvDate());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertbcPhoto(Connection conn, ArrayList<Photo> photoList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertbcPhoto");
		//INSERT INTO PHOTO VALUES(SEQ_PHOTONO.NEXTVAL, SEQ_POSTNO.CURRVAL, ?, ?, ?, ?, DEFAULT)
		
		try {
			for(int i = 0; i < photoList.size(); i++) {
				Photo p = photoList.get(i);
				
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, p.getOriginName());
				pstmt.setString(2, p.getChangeName());
				pstmt.setString(3, p.getFilePath());
				pstmt.setInt(4, p.getFileLevel());
				
				result += pstmt.executeUpdate();
			}
				
		} catch (SQLException e) {
				e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
