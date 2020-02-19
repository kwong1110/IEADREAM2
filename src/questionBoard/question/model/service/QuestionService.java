package questionBoard.question.model.service;
import static common.JDBCTemplate.*;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import questionBoard.question.model.dao.QuestionDAO;
import questionBoard.question.model.vo.Question;

public class QuestionService {

	/*
	 * public int getListCount() { Connection conn = getConnection(); int result =
	 * new QuestionDAO().getListCount(conn); close(conn); return result; }
	 */

	/*
	  public ArrayList<Question> selectList(int currentPage) { Connection conn =
	  getConnection(); ArrayList<Question> list = new
	  QuestionDAO().selectList(conn, currentPage); close(conn); return list; }
	  
	  페이징 지움
	 */
	public ArrayList<Question> selectList() {
		Connection conn = getConnection();
		ArrayList<Question> list = new QuestionDAO().selectList(conn);
		close(conn);
		return list;
	}

/*	public int insertQuestion(Question question, String category) {
		Connection conn = getConnection();
		QuestionDAO dao = new QuestionDAO();
		int result = dao.insertQuestion(conn, question, category);
		
		if(result > 0) {
			commit(conn);
		} else{
			rollback(conn);
		}
		return result;
	}
*/
/*	public int updateQuestion(Question question, String category) {
		Connection conn = getConnection();
		QuestionDAO dao = new QuestionDAO();
		int result = dao.updateQuestion(conn, question, category);
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}
*/
	public Question selectQuestion(int postNo) {
		Connection conn = getConnection();
		QuestionDAO dao = new QuestionDAO();

		Question q = null;
		q= dao.selectQuestion(conn, postNo);
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
	}
