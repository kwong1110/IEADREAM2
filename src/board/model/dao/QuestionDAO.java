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
import board.model.vo.Question;
import board.model.vo.Reply;


public class QuestionDAO {

	private Properties prop = new Properties();
	
	public QuestionDAO() {
		String fileName = QuestionDAO.class.getResource("/sql/questionBoard/question-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// 페이징 - 사용자
	public int getListCount(Connection conn, String userNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result =0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;

	}
	
		public ArrayList<Board> selectQBList(Connection conn, int currentPage, String userNo) {
			  PreparedStatement pstmt = null; 
			  ResultSet rset =null; 
			  ArrayList<Board> list = null; 
			  
			  int posts = 10;
			  int startRow = (currentPage -1) * posts +1;
			  int endRow = startRow + posts -1;
		  
			  String query = prop.getProperty("selectQBList");
		  
		  try {
			  pstmt = conn.prepareStatement(query);
			  pstmt.setInt(1, startRow);
			  pstmt.setInt(2, endRow);
			  pstmt.setString(3, userNo);
			  
			  rset = pstmt.executeQuery();
			  list = new ArrayList<Board>();
				
			  while(rset.next()) {
					 list.add(new Board(rset.getInt("BOARD_NO"),
							 rset.getInt("POST_NO"), 
							 rset.getInt("USER_NO"),
			 				rset.getString("ID"), 
			 				rset.getString("title"), 
						  	rset.getString("content"),
						  	rset.getDate("CREATE_DATE"),
						  	rset.getInt("hit"),
						  	rset.getString("deleted"),
							rset.getString("category")));
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
		
		public ArrayList<Reply> selectQRList(Connection conn,int currentPage, String userNo) {
				PreparedStatement pstmt = null; 
			  ResultSet rset =null; 
			  ArrayList<Reply> reply = null;
			  int posts = 10;
			  int startRow = (currentPage -1) * posts +1;
			  int endRow = startRow + posts -1;
			  String query = prop.getProperty("selectQRList");
		  
		  try {
			  pstmt = conn.prepareStatement(query);
			  pstmt.setString(1, userNo);
			  pstmt.setInt(2, endRow);
			  pstmt.setString(3, userNo);
			  rset = pstmt.executeQuery();
			  reply = new ArrayList<Reply> ();
			  while(rset.next()) {
					reply.add(new Reply(rset.getString("answer_content"),
									rset.getString("answer_checked"),
									rset.getDate("answer_date")));
					System.out.println("dap의 reply "+ reply);
				}
				
			} catch (SQLException e) { 
				 e.printStackTrace(); 
			} finally {
				close(rset);
				close(pstmt);
			}
			 
			  return reply;
		}
		
		// 사용자 디테일 -보드
		public Board selectBoardDetail(Connection conn, int post) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Board board = null;
			
			String query = prop.getProperty("selectQuestion");
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, post);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					board = new Board(rs.getInt("BOARD_NO"), 
											rs.getInt("POST_NO"), 
											rs.getInt("USER_NO"),
											rs.getString("ID"), 
											rs.getString("title"), 
											rs.getString("content"),
											rs.getDate("CREATE_DATE"),
											rs.getInt("hit"), 
											rs.getString("deleted"),
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
		
		//사용자 디테일 - 댓글
		public Reply selectReplyDetail(Connection conn, int post) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Reply reply = null;
			
			String query = prop.getProperty("selectQuestion");
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, post);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					reply = (new Reply(rs.getString("answer_content"),
										rs.getString("answer_checked"),
										rs.getDate("answer_date")));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return reply;
		}
		
		// 사용자 - 문의글 삭제
		public int deleteQuestion(Connection conn, int postNo, String userNo) {
			PreparedStatement pstmt = null;
			int result = 0;
			
			String query = prop.getProperty("deleteQuestion");
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, postNo);
				pstmt.setString(1, userNo);
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}

// 새로 고칠거 	

	
	

	public int insertQuestionB(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		int result1 = 0;
		
		String query = prop.getProperty("insertQuestionB");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, board.getUserNo());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getCategory());
			
			result1 = pstmt.executeUpdate();
			System.out.println("result1 :  " + result1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result1;
	}
	
	public int insertQuestionQ(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		int result2 = 0;
		String query = prop.getProperty("insertQuestionQ");
		try {
			pstmt = conn.prepareStatement(query);
			//pstmt.setInt(1, num);
			pstmt.setInt(1, board.getUserNo());
			
			result2 = pstmt.executeUpdate();
			System.out.println("result2 :  " + result2);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result2;
	}

	public int updateQuestion(Connection conn,  Board board, int category) {
			PreparedStatement pstmt = null;
			int result = 0;
			
			String query = prop.getProperty("updateQuestion");
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, board.getTitle());
				pstmt.setString(2, board.getContent());
				pstmt.setInt(3, category);
				pstmt.setInt(4, board.getPostNo());
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}

/*	public String selectUserId(Connection conn, String postNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String userId = null;
		String query = prop.getProperty("selecUserId");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, postNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userId = rs.getString("user_name");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return userId;
	}  */

	

	public ArrayList<Reply> selectReplyList(Connection conn, int postNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Reply> list = null;
		
		String query = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			
			rs = pstmt.executeQuery();
			list = new ArrayList<Reply>();
			
			if(rs.next()) {
				list.add(new Reply(rs.getString("answerChecked"),
										rs.getString("answerContent"),
										rs.getDate("answerDate")));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	


	//페이징
	public int MgetListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		int result =0;
		
		String query = prop.getProperty("MgetListCount");
		
		try {
			stmt=conn.createStatement();
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

	public ArrayList<Board> selectBList(Connection conn, int currentPage) {
		 PreparedStatement pstmt = null; 
		  ResultSet rset =null; 
		  ArrayList<Board>  list = null; 
		  
		  int posts = 10;
		  int startRow = (currentPage -1) * posts +1;
		  int endRow = startRow + posts -1;
	  
		  String query = prop.getProperty("MselectList");
	  
	  try {
		  pstmt = conn.prepareStatement(query);
		  pstmt.setInt(1, startRow);
		  pstmt.setInt(2, endRow);
		  
		  rset = pstmt.executeQuery();
		  list = new ArrayList<Board> ();
			
			while(rset.next()) {
				 list.add(new Board(rset.getInt("BOARD_NO"),
						 rset.getInt("POST_NO"), 
						 rset.getInt("USER_NO"),
		 				rset.getString("ID"), 
		 				rset.getString("title"), 
					  	rset.getString("content"),
					  	rset.getDate("CREATE_DATE"),
					  	rset.getInt("hit"),
					  	rset.getString("deleted"),
						rset.getString("category")));
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

	public ArrayList<Reply> selectRList(Connection conn) {
		Statement stmt = null; 
		  ResultSet rset =null; 
		  ArrayList<Reply> reply = null;
		  
		  String query = prop.getProperty("MRselectList");
	  
	  try {
		  stmt = conn.createStatement();
		  
		  rset = stmt.executeQuery(query);
		  reply = new ArrayList<Reply> ();
		  while(rset.next()) {
				reply.add(new Reply(rset.getString("answer_content"),
								rset.getString("answer_checked"),
								rset.getDate("answer_date")));
				System.out.println("dap의 reply "+ reply);
			}
			
		} catch (SQLException e) { 
			 e.printStackTrace(); 
		} finally {
			close(rset);
			close(stmt);
		}
		 
		  return reply;
	}
	
	// 디테일 뷰 - 관리자
	public Board selectQuestion(Connection conn, int post) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board board = null;
		
		String query = prop.getProperty("selectQuestion");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, post);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new Board(rs.getInt("BOARD_NO"), 
										rs.getInt("POST_NO"), 
										rs.getInt("USER_NO"),
										rs.getString("ID"), 
										rs.getString("title"), 
										rs.getString("content"),
										rs.getDate("CREATE_DATE"),
										rs.getInt("hit"), 
										rs.getString("deleted"),
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
	// 사용자 디테일 뷰
		public Board userSelectQuestion(Connection conn, int post) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Board board = null;
			
			String query = prop.getProperty("selectQuestion1");
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, post);
				pstmt.setString(2, userNo);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					board = new Board(rs.getInt("BOARD_NO"), 
											rs.getInt("POST_NO"), 
											rs.getInt("USER_NO"),
											rs.getString("ID"), 
											rs.getString("title"), 
											rs.getString("content"),
											rs.getDate("CREATE_DATE"),
											rs.getInt("hit"), 
											rs.getString("deleted"),
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


	public Reply selectRQuestion(Connection conn, int post) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Reply reply = null;
		
		String query = prop.getProperty("selectQuestion");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, post);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				reply = (new Reply(rs.getString("answer_content"),
									rs.getString("answer_checked"),
									rs.getDate("answer_date")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return reply;
	}
	
	// 댓글 
	public int insertReply(Connection conn, Reply r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReply");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, r.getAnswerContent());
			pstmt.setInt(2, r.getPostNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	// 댓글 삭제 - 관리자
	public int MdeleteQuestion(Connection conn, int postNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteReply");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	//수정
	/*public ArrayList<Reply> updateReplyList(Connection conn, int postNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateReply");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, answerContent);
			pstmt.setInt(1, postNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	*/
	

 }

// 지워도 되는데 혹시 몰라서
/*
 * public ArrayList<Question> selectList(Connection conn, int currentPage,
 * String userNo) { PreparedStatement pstmt = null; ResultSet rset =null;
 * ArrayList<Question> list = null;
 * 
 * int posts = 10; int startRow = (currentPage -1) * posts +1; int endRow =
 * startRow + posts -1;
 * 
 * String query = prop.getProperty("selectList");
 * 
 * try { pstmt = conn.prepareStatement(query); pstmt.setString(1, userNo);
 * pstmt.setInt(2, startRow); pstmt.setInt(3, endRow);
 * 
 * rset = pstmt.executeQuery(); list = new ArrayList<Question>();
 * 
 * while(rset.next()) {
 * 
 * list.add(new Question(rset.getInt("POST_NO"), rset.getInt("USER_NO"),
 * rset.getString("category"), rset.getDate("CREATE_DATE"),
 * rset.getString("title"), rset.getString("content"),
 * rset.getString("ANSWER_CHECKED").charAt(0), rset.getString("ANSWER_CONTENT"),
 * rset.getDate("ANSWER_DATE"), rset.getString("deleted").charAt(0)));
 * 
 * 
 * System.out.println(list); }
 * 
 * } catch (SQLException e) { e.printStackTrace(); } finally { close(rset);
 * close(pstmt); }
 * 
 * return list;
 * 
 * }
 */

