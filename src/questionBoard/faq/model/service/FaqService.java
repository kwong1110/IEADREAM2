package questionBoard.faq.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.vo.Board;
import questionBoard.faq.model.dao.FaqDAO;
import questionBoard.faq.model.vo.Faq;

public class FaqService {

	public ArrayList<Board> selectList() {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new FaqDAO().selectList(conn);
		
		close(conn);
		
		return list;
	}

	public int faqInsert(Board board, String category) {
		Connection conn = getConnection();
		
		FaqDAO dao = new FaqDAO();
		
		int result = dao.faqInsert(conn, board, category);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public int getListCount() {
		Connection conn = getConnection();
		
		int result = new FaqDAO().getListCount(conn);
		close(conn);
		return result;
	}

	public ArrayList<Board> selectAdminList(int currentPage) {
		Connection conn = getConnection();
		ArrayList<Board> list = new FaqDAO().selectAdminList(conn, currentPage);
		close(conn);
		return list;
	}

	public Board selectAdminDetail(String num) {
		Connection conn = getConnection();
		FaqDAO dao = new FaqDAO();
		Board board = null;
		
		int number = Integer.parseInt(num);
		board = dao.selectAdminDetail(conn, number); //dao 에 conn객체와 num매개변수를 넘김
		if(board != null) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return board;
	}

	public int updateFaq(Board board) {
		Connection conn = getConnection();
		FaqDAO dao = new FaqDAO();
		
		int result = dao.updateFaq(conn, board);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public int deleteFaq(int no) {
		Connection conn = getConnection();
		
		FaqDAO dao = new FaqDAO();
		
		int result = dao.deleteFaq(conn, no);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
