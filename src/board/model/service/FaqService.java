package board.model.service;

import static common.JDBCTemplate.*;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import questionBoard.faq.model.dao.FaqDAO;
import questionBoard.faq.model.vo.Faq;

public class FaqService {

	public ArrayList<Faq> selectList() {
		Connection conn = getConnection();
		
		ArrayList<Faq> list = new FaqDAO().selectList(conn);
		
		close(conn);
		
		return list;
	}

	public int faqInsert(Faq faq, String category) {
		Connection conn = getConnection();
		
		FaqDAO dao = new FaqDAO();
		
		int result = dao.faqInsert(conn, faq, category);
		
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

	public ArrayList<Faq> selectAdminList(int currentPage) {
		Connection conn = getConnection();
		ArrayList<Faq> list = new FaqDAO().selectAdminList(conn, currentPage);
		close(conn);
		return list;
	}

	public Faq selectAdminDetail(String num) {
		Connection conn = getConnection();
		FaqDAO dao = new FaqDAO();
		Faq faq = null;
		
		int number = Integer.parseInt(num);
		faq = dao.selectAdminDetail(conn, number); //dao 에 conn객체와 num매개변수를 넘김
		if(faq != null) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return faq;
	}

	public int updateFaq(Faq faq) {
		Connection conn = getConnection();
		FaqDAO dao = new FaqDAO();
		
		int result = dao.updateFaq(conn, faq);
		
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
