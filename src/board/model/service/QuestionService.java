package board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.QuestionDAO;
import board.model.vo.Board;
import board.model.vo.Reply;

public class QuestionService {

	  public int getListCount(String userNo) { 
		  Connection conn = getConnection();
		  int result = new QuestionDAO().getListCount(conn, userNo);
		  close(conn); 
		  return result; 
	  }
	 
	  // 사용자 디테일 
	  //	- 보드
	  public Board selectBoardDetail(String postNo) {
		  Connection conn = getConnection();
			QuestionDAO dao = new QuestionDAO();
			
			int post = Integer.parseInt(postNo);
			Board b = null;
			b= dao.selectBoardDetail(conn, post);
			if(b != null) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return b;
		}
	  // - 댓글(사용자 디테일)
		public Reply selectReplyDetail(String postNo) {
			Connection conn = getConnection();
			QuestionDAO dao = new QuestionDAO();
			
			int post = Integer.parseInt(postNo);
			Reply r = null;
			r= dao.selectReplyDetail(conn, post);
			if(r != null) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			return r;
		}
		 // 사용자 - 문의글 삭제
		public int deleteQuestion(int postNo, String userNo) {
			Connection conn = getConnection();
			QuestionDAO dao = new QuestionDAO();

			int result = 0;

			result = dao.deleteQuestion(conn, postNo,userNo);
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			return result;
		}
		
	

	public int insertQuestion1(Board board) {
		Connection conn = getConnection();
		QuestionDAO dao = new QuestionDAO();
		int result1 = dao.insertQuestionB(conn,  board);
		

		if(result1 > 0) {
			commit(conn);
		} else{
			rollback(conn);
		}
		return result1;

	}
	
	public int insertQuestion2(Board board) {
		Connection conn = getConnection();
		QuestionDAO dao = new QuestionDAO();
		int result2 = dao.insertQuestionQ(conn, board);

		if(result2 > 0) {
			commit(conn);
		} else{
			rollback(conn);
		}
		return result2;

	}
	// 문의사항 수정
	public int updateQuestion(Board board, int category) {
			Connection conn = getConnection();
			QuestionDAO dao = new QuestionDAO();
			int result = dao.updateQuestion(conn,  board, category);
			if(result>0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			return result;
		}


	// 댓글

	public ArrayList<Reply> insertReply(Reply r) {
		Connection conn = getConnection();
		QuestionDAO dao = new QuestionDAO();// 두번 왔다갔다 할거기 때문에
		
		int result = dao.insertReply(conn, r);
		ArrayList<Reply> list = null;
		if(result>0) {
			commit(conn);
			list = dao.selectReplyList(conn, r.getPostNo());
		}else {
			rollback(conn);
		}
		return list;
	}


	/*public ArrayList<Reply> updateReply(Reply r) {
		Connection conn = getConnection();
		QuestionDAO dao = new QuestionDAO();// 두번 왔다갔다 할거기 때문에
		
		int result = dao.insertReply(conn, r);
		ArrayList<Reply> list = null;
		if(result>0) {
			commit(conn);
			list = dao.updateReplyList(conn, r.getPostNo());
		}else {
			rollback(conn);
		}
		return list;
	}*/
	//  페이징 - user 리스트 뷰
	public ArrayList<Board> selectQBList(int currentPage, String userNo) {
		Connection conn = getConnection();
		QuestionDAO dao = new QuestionDAO();
		
		ArrayList<Board> list = new QuestionDAO().selectQBList(conn, currentPage,userNo); 
		close(conn);
		return list;
	}
	
	public ArrayList<Reply> selectQRList(int currentPage, String userNo) {
		Connection conn = getConnection();
		QuestionDAO dao = new QuestionDAO();
		
		ArrayList<Reply> r = dao.selectQRList(conn,currentPage, userNo);
		System.out.println("r " + r);
		close(conn);
		  return r;
		
	}


	// 페이징 - 관리자 리스트 뷰
	 public int MgetListCount() { 
		  Connection conn = getConnection();
		  int result = new QuestionDAO().MgetListCount(conn);
		  close(conn); 
		  return result; 
	  }

	public ArrayList<Board> selectBList(int currentPage) {
		Connection conn = getConnection();
		QuestionDAO dao = new QuestionDAO();
		
		ArrayList<Board> list = new QuestionDAO().selectBList(conn, currentPage); 
		close(conn);
		  return list; 
	}

	public  ArrayList<Reply> selectRList() {
		Connection conn = getConnection();
		QuestionDAO dao = new QuestionDAO();
		
		ArrayList<Reply> r = dao.selectRList(conn);
		System.out.println("r " + r);
		close(conn);
		  return r;
	}
  
	 // 디테일 뷰 - 관리자
	public Board selectQuestion(String postNo) {
		Connection conn = getConnection();
		QuestionDAO dao = new QuestionDAO();
		
		int post = Integer.parseInt(postNo);
		Board b = null;
		b= dao.selectQuestion(conn, post);
		if(b != null) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return b;

	}
	public Reply selectRQuestion(String postNo) {
		Connection conn = getConnection();
		QuestionDAO dao = new QuestionDAO();
		
		int post = Integer.parseInt(postNo);
		Reply r = null;
		r= dao.selectRQuestion(conn, post);
		if(r != null) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return r;
	}
	
	
	// --
 
	  public ArrayList MselectList(int currentPage) {
		  Connection conn = getConnection();
		  ArrayList list = new QuestionDAO().MselectList(conn, currentPage); 
		  close(conn);
		  return list; 
	  }




	public int MdeleteQuestion(int postNo) {
		Connection conn = getConnection();
		QuestionDAO dao = new QuestionDAO();

		int result = 0;

		result = dao.MdeleteQuestion(conn, postNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}



	






	



/*
	  public ArrayList<Board> selectList(int currentPage, String userNo) {
		  Connection conn = getConnection();
		  ArrayList<Board> list = new QuestionDAO().selectList(conn, currentPage, userNo); 
		  close(conn);
		  return list; 
	  }

*/
	



	/*
	 * public Board selectBList(int currentPage) { Connection conn =
	 * getConnection(); QuestionDAO dao = new QuestionDAO();
	 * 
	 * Board b = null; if(result > 0) { b = dao.selectBoard(conn, bId);
	 * 
	 * if(b!=null) { commit(conn); }else { rollback(conn); }
	 * 
	 * }else { rollback(conn); } close(conn); return b;
	 * 
	 * }
	 */
	}
