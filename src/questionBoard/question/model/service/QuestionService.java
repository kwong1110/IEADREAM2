package questionBoard.question.model.service;
import static common.JDBCTemplate.*;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import account.model.vo.Account;
import questionBoard.question.model.dao.QuestionDAO;
import questionBoard.question.model.vo.Question;

public class QuestionService {

	
	  public int getListCount(String userNo) { 
		  Connection conn = getConnection();
		  int result = new QuestionDAO().getListCount(conn, userNo);
		  close(conn); 
		  return result; 
	  }
	 

	
	  public ArrayList<Question> selectList(int currentPage, String userNo) {
		  Connection conn = getConnection();
		  ArrayList<Question> list = new QuestionDAO().selectList(conn, currentPage, userNo); 
		  close(conn);
		  return list; 
	  }

	public Question selectQuestion(String postNo) {
		Connection conn = getConnection();
		QuestionDAO dao = new QuestionDAO();
		
		int post = Integer.parseInt(postNo);
		Question q = null;
		q= dao.selectQuestion(conn, post);
		if(q != null) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return q;

	}

	public int deleteQuestion(int postNo) {
		Connection conn = getConnection();
		QuestionDAO dao = new QuestionDAO();

		int result = 0;

		result = dao.deleteQuestion(conn, postNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public int insertQuestion(Question question) {
		Connection conn = getConnection();
		QuestionDAO dao = new QuestionDAO();
		int result = dao.insertQuestion(conn, question);

		if(result > 0) {
			commit(conn);
		} else{
			rollback(conn);
		}
		return result;

	}

	public int updateQuestion(Question question) {
			Connection conn = getConnection();
			QuestionDAO dao = new QuestionDAO();
			int result = dao.updateQuestion(conn, question);
			if(result>0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			return result;
		}



	public String selectUserId(String postNo) {
		Connection conn = getConnection();
		QuestionDAO dao = new QuestionDAO();
		
		String result = dao.selectUserId(conn, postNo);
		if(result != null) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		}



	public ArrayList<Question> insertReply(Question q) {
		Connection conn = getConnection();
		QuestionDAO dao = new QuestionDAO();// 두번 왔다갔다 할거기 때문에
		
		int result = dao.insertReply(conn, q);
		ArrayList<Question> list = null;
		if(result>0) {
			commit(conn);
			list = dao.selectReplyList(conn, q.getPostNo());
		}else {
			rollback(conn);
		}
		return list;
	}
	}
