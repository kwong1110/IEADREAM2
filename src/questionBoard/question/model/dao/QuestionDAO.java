package questionBoard.question.model.dao;

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

import questionBoard.question.model.vo.Question;


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
	/*	Statement stmt = null;
		ResultSet rs = null;
		int result =0;
		
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
		return result; */
	}

	
	  public ArrayList<Question> selectList(Connection conn, int currentPage, String userNo) {
		  PreparedStatement pstmt = null; 
		  ResultSet rset =null; 
		  ArrayList<Question> list = null; 
		  
		  int posts = 10;
		  int startRow = (currentPage -1) * posts +1;
		  int endRow = startRow + posts -1;
	  
		  String query = prop.getProperty("selectList");
	  
	  try {
		  pstmt = conn.prepareStatement(query);
		  pstmt.setString(1, userNo);
		  pstmt.setInt(2, startRow);
		  pstmt.setInt(3, endRow);
		  
		  rset = pstmt.executeQuery();
		  list = new ArrayList<Question>();
			
			while(rset.next()) {
				
			 list.add(new Question(rset.getInt("POST_NO"), 
					 				rset.getInt("USER_NO"),
					 				rset.getString("category"), 
					 				rset.getDate("CREATE_DATE"),
					 				rset.getString("title"), 
								  	rset.getString("content"),
									rset.getString("ANSWER_CHECKED").charAt(0), 
									rset.getString("ANSWER_CONTENT"),
									rset.getDate("ANSWER_DATE"), 
									rset.getString("deleted").charAt(0)));
									
			 
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
	 
	  
	  
	
	public Question selectQuestion(Connection conn, int post) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Question question = null;
		
		String query = prop.getProperty("selectQuestion");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, post);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				question = new Question(rs.getInt("POST_NO"), 
										rs.getInt("USER_NO"),
										rs.getString("category"), 
										rs.getDate("CREATE_DATE"),
										rs.getString("title"), 
										rs.getString("content"),
										rs.getString("ANSWER_CHECKED").charAt(0), 
										rs.getString("ANSWER_CONTENT"),
										rs.getDate("ANSWER_DATE"), 
										rs.getString("deleted").charAt(0));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return question;
	}

	public int deleteQuestion(Connection conn, int postNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteQuestion");
		
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

	public int insertQuestion(Connection conn, Question question) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertQuestion");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, question.getUserNo());
			pstmt.setString(2, question.getCategory());
			pstmt.setString(3, question.getTitle());
			pstmt.setString(4, question.getContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateQuestion(Connection conn, Question question) {
			PreparedStatement pstmt = null;
			int result = 0;
			
			String query = prop.getProperty("updateQuestion");
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, question.getTitle());
				pstmt.setString(2, question.getContent());
				pstmt.setString(3, question.getCategory());
				pstmt.setInt(4, question.getPostNo());
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}

	public String selectUserId(Connection conn, String postNo) {
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
	}

	public int insertReply(Connection conn, Question q) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReply");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, q.getAnswerContent());
			pstmt.setInt(2, q.getPostNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Question> selectReplyList(Connection conn, int postNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Question> list = null;
		
		String query = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			
			rs = pstmt.executeQuery();
			list = new ArrayList<Question>();
			
			if(rs.next()) {
				list.add(new Question(rs.getString("answerChecked").charAt(0),
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

	
	  public ArrayList<Question> MselectList(Connection conn, int currentPage) {
		  PreparedStatement pstmt = null; 
		  ResultSet rset =null; 
		  ArrayList<Question> list = null; 
		  
		  int posts = 10;
		  int startRow = (currentPage -1) * posts +1;
		  int endRow = startRow + posts -1;
	  
		  String query = prop.getProperty("MselectList");
	  
	  try {
		  pstmt = conn.prepareStatement(query);
		  pstmt.setInt(1, startRow);
		  pstmt.setInt(2, endRow);
		  
		  rset = pstmt.executeQuery();
		  list = new ArrayList<Question>();
			
			while(rset.next()) {
				
			 list.add(new Question(rset.getInt("POST_NO"), 
					 				rset.getInt("USER_NO"),
					 				rset.getString("category"), 
					 				rset.getDate("CREATE_DATE"),
					 				rset.getString("title"), 
								  	rset.getString("content"),
									rset.getString("ANSWER_CHECKED").charAt(0), 
									rset.getString("ANSWER_CONTENT"),
									rset.getDate("ANSWER_DATE"), 
									rset.getString("deleted").charAt(0)));
									
			 
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

	public int MdeleteQuestion(Connection conn, int postNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("MdeleteQuestion");
		
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
	
	
}
