package board.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import board.model.vo.BestCouple;
import board.model.vo.Board;
import board.model.vo.Photo;

public class WeAreCoupleDAO {
	private Properties prop = new Properties();
	
	public WeAreCoupleDAO() {
		String fileName = WeAreCoupleDAO.class.getResource("/sql/coupleStory/weAreCouple-query.properties").getPath();
		
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

	public int insertBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, b.getUserNo());
			System.out.println("insertDAO : " + b.getUserNo());
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

	public int insertPhoto(Connection conn, ArrayList<Photo> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPhoto");
		
		try {
			for(int i = 0; i< fileList.size(); i++) {
				Photo p = fileList.get(i);
				
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1,p.getOriginName());
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
	
	//best couple 항목 추가

	public int insertBcPhoto(Connection conn, BestCouple bc) {
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
	//조회수
	public int updateCount(Connection conn, String postNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, postNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public Board selectBoard(Connection conn, String postNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board board = null;
		
		
		String query = prop.getProperty("selectBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, postNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new Board(	rs.getInt("board_no"),
									rs.getInt("post_no"),
									 rs.getInt("user_no"), 
									  rs.getString("ID"), 
									  rs.getString("title"), 
									  rs.getString("CONTENT"),
									  rs.getDate("create_Date"), 
									  rs.getInt("HIT"), 
									  rs.getString("deleted"));
					
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return board;
	}

	public ArrayList<Photo> selectPhoto(Connection conn, String postNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Photo> list = null;
		
		String query = prop.getProperty("selectPhoto");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, postNo);
			
			rs = pstmt.executeQuery();
			list = new ArrayList<Photo>();
			
			//사진이 여러개일 수 있으므로 while
			while(rs.next()) {
				Photo p = new Photo();
				p.setPhotoNo(rs.getInt("photo_no"));
				p.setOriginName(rs.getString("origin_name"));
				p.setChangeName(rs.getString("change_name"));
				p.setFilePath(rs.getString("file_path"));
				
				list.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}
	
	public BestCouple selectCouple(Connection conn, String postNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BestCouple bc = null;
		
		
		String query = prop.getProperty("selectCouple");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, postNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bc = new BestCouple(rs.getInt("POST_NO"),
						rs.getString("M_NAME"),
						rs.getString("F_NAME"),
						rs.getInt("DATING_PERIOD"),
						rs.getString("FAVORIT_DATE"));
					
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return bc;
	}

	public int deletePhoto(Connection conn, String postNo) {
		PreparedStatement pstmt = null;
		int result= 0;
		
		String query = prop.getProperty("deletePhoto");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, postNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteBoard(Connection conn, String postNo) {
		PreparedStatement pstmt = null;
		int result1= 0;
		
		String query = prop.getProperty("deleteBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, postNo);
			
			result1 = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result1;
	}



	public int updatePhoto(Connection conn, Board b, int post) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateBoard");
		// UPDATE BOARD SET BTITLE=?, BCONTENT=? WHERE POST_NO=?
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getContent());
			pstmt.setInt(3,post);
			System.out.println("post : " +post);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateBestCouple(Connection conn, BestCouple bc, int post) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateBestCouple");
		//UPDATE BEST_COUPLE SET M_NAME=?, F_NAME=?, DATING_PERIOD=?, FAVORIT_DATE=? WHERE POST_NO=?
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bc.getmName());
			pstmt.setString(2, bc.getfName());
			pstmt.setInt(3, bc.getDtPeriod());
			pstmt.setString(4, bc.getFvDate());
			pstmt.setInt(5, post);
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertNewAttachment(Connection conn, ArrayList<Photo> newInsertFile, int post) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertNewPhoto");
		// insertNewAttachment=INSERT INTO ATTACHMENT VALUES(SEQ_FID.NEXTVAL, ?, ?, ?, ?, SYSDATE, ?, DEFAULT, DEFAULT)
		
		try {
			for(int i = 0; i < newInsertFile.size(); i++) {
				Photo p = newInsertFile.get(i);
				
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, post);
				//pstmt.setInt(1, p.getPostNo());
				pstmt.setString(2, p.getOriginName());
				pstmt.setString(3, p.getChangeName());
				pstmt.setString(4, p.getFilePath());
				pstmt.setInt(5, p.getFileLevel());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateAttachment(Connection conn, ArrayList<Photo> changeFile) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateAttachment");
		// updateAttachment=UPDATE ATTACHMENT SET ORIGIN_NAME=?, CHANGE_NAME=?, UPLOAD_DATE=SYSDATE WHERE FID=?
		
		try {
			for(int i = 0; i < changeFile.size(); i++) {
				Photo a = changeFile.get(i);
				
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, a.getOriginName());
				pstmt.setString(2, a.getChangeName());
				pstmt.setInt(3, a.getPhotoNo());
				
				result += pstmt.executeUpdate();
			}
		} catch(SQLException e) {
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

	public ArrayList<Board> selectSearchList(Connection conn, int currentPage, String search) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Board> list = null;
		
		int posts = 10;
		
		int startRow = (currentPage -1) * posts + 1;
		int endRow = startRow + posts -1;
		String query = prop.getProperty("selectSearchList");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, "%"+search+"%");
			
			rs = pstmt.executeQuery();
		

			while(rs.next()) {
				 list.add(new Board(
						 rs.getInt("BOARD_NO"),
						 rs.getInt("POST_NO"), 
						 rs.getInt("USER_NO"),
						 rs.getString("ID"), 
						 rs.getString("title"),
						 rs.getString("CONTENT"),
						 rs.getDate("hit"),
						 rs.getString("DELETED"),
						 rs.getString("category")));
					System.out.println(list);
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
