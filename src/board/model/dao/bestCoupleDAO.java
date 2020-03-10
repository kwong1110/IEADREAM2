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
									rset.getString("ID"),
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

	public int updateCount(Connection conn, int pNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		//UPDATE BOARD SET HIT=HIT+1 WHERE POST_NO=?
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Board selectBoard(Connection conn, int pNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String query = prop.getProperty("selectBoard");
		//SELECT POST_NO, TITLE, CONTENT FROM BOARD WHERE POST_NO=?
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(rset.getInt("POST_NO"), rset.getString("TITLE"), rset.getString("CONTENT"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}
	
	public BestCouple selectBestCouple(Connection conn, int pNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		BestCouple bc = null;
		
		String query = prop.getProperty("selectBestCouple");
		//SELECT * FROM BEST_COUPLE WHERE POST_NO=?
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				bc = new BestCouple(rset.getInt("POST_NO"),
									rset.getString("M_NAME"),
									rset.getString("F_NAME"),
									rset.getInt("DATING_PERIOD"),
									rset.getString("FAVORIT_DATE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return bc;
	}

	public ArrayList<Photo> selectPhoto(Connection conn, int pNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Photo> pList = null;
		
		String query = prop.getProperty("selectPhoto");
		//SELECT * FROM PHOTO WHERE POST_NO=? AND DELETED='N'
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pNo);
			
			rset = pstmt.executeQuery();
			
			pList = new ArrayList<Photo>();
			while(rset.next()) {
				Photo p = new Photo();
				p.setPhotoNo(rset.getInt("PHOTO_NO"));
				p.setPostNo(rset.getInt("POST_NO"));
				p.setOriginName(rset.getString("ORIGIN_NAME"));
				p.setChangeName(rset.getString("CHANGE_NAME"));
				p.setFilePath(rset.getString("FILE_PATH"));
				p.setFileLevel(rset.getInt("FILE_LEVEL"));
				p.setDeleted(rset.getString("DELETED"));
				
				pList.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return pList;
	}

	public int updatePtBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatePtBoard");
		//UPDATE BOARD SET TITLE=?, CONTENT=? WHERE POST_NO=?
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getContent());
			pstmt.setInt(3, b.getPostNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updatePtBestCouple(Connection conn, BestCouple bc) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatePtBestCouple");
		//UPDATE BEST_COUPLE SET M_NAME=?, F_NAME=?, DATING_PERIOD=?, FAVORIT_DATE=? WHERE POST_NO=?
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bc.getmName());
			pstmt.setString(2, bc.getfName());
			pstmt.setInt(3, bc.getDtPeriod());
			pstmt.setString(4, bc.getFvDate());
			pstmt.setInt(5, bc.getPostNo());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public int updatePhoto(Connection conn, ArrayList<Photo> changeFile) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatePhoto");
		//UPDATE PHOTO SET ORIGIN_NAME=?, CHANGE_NAME=? WHERE PHOTO_NO=?
		
		for(int i = 0; i < changeFile.size(); i++) {
			Photo p = changeFile.get(i);
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, p.getOriginName());
				pstmt.setString(2, p.getChangeName());
				pstmt.setInt(3, p.getPhotoNo());
				
				result += pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		}
		
		return result;
	}

	public int insertNewPhoto(Connection conn, ArrayList<Photo> newInsertFile) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertNewPhoto");
		//INSERT INTO PHOTO VALUES(SEQ_PHOTONO.NEXTVAL, ?, ?, ?, ?, ?, DEFAULT)
		
		for(int i = 0; i < newInsertFile.size(); i++) {
			Photo p = newInsertFile.get(i);
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, p.getPostNo());
				pstmt.setString(2, p.getOriginName());
				pstmt.setString(3, p.getChangeName());
				pstmt.setString(4, p.getFilePath());
				pstmt.setInt(5, p.getFileLevel());
				
				result += pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
		}
		
		return result;
	}

	public int deleteBoard(Connection conn, int pNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteBoard");
		//UPDATE BOARD SET DELETED='Y' WHERE POST_NO=?
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getSearchListCount(Connection conn, String year, String month) {
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rset = null;
		
		String query = "";
		if(year != null && month.equals("00")) {
			query = prop.getProperty("getSearchYearListCount");
			//SELECT COUNT(*) FROM BCLIST WHERE TO_CHAR(CREATE_DATE, 'YYYY') LIKE ?
		} else {
			query = prop.getProperty("getSearchListCount");
			//SELECT COUNT(*) FROM BCLIST WHERE TO_CHAR(CREATE_DATE, 'YYYY') LIKE ? AND TO_CHAR(CREATE_DATE, 'MM') LIKE ?
		}
		
		try {
			pstmt = conn.prepareStatement(query);
			
			if(year != null && month.equals("00")) {
				pstmt.setString(1, year);
			} else {
				pstmt.setString(1, year);
				pstmt.setString(2, month);
			}
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1); // 검색한 전체 개시글 개수 가져오기
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<Board> searchbcList(Connection conn, int currentPage, String year, String month) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> bcList = null;
		
		int posts = 3;
		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts - 1;
		
		String query = "";
		
		switch(month) {
		case "00":
			query = prop.getProperty("searchbcYearList");
			break; 
		default:
			query = prop.getProperty("searchbcList");
			break;
		}
		
		try {
			pstmt = conn.prepareStatement(query);
			
			if(month.equals("00")) {
				pstmt.setString(1, year);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			} else {
				pstmt.setString(1, year);
				pstmt.setString(2, month);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
			}
			
			rset = pstmt.executeQuery();
			bcList = new ArrayList<Board>();
			
			while(rset.next()) {
				Board bc = new Board(rset.getInt("POST_NO"),
									rset.getString("ID"),
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

	public ArrayList<Photo> searchpList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Photo> pList = null;
		
		String query = prop.getProperty("selectpList");
		
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
		}
		
		return pList;
	}


}
