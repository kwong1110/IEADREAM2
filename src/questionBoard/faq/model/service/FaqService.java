package src.questionBoard.faq.model.service;

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

}
