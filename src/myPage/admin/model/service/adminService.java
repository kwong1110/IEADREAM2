package myPage.admin.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import account.model.vo.Account;
import board.model.vo.Board;
import myPage.admin.model.dao.adminDAO;

public class adminService {

	public int getListCount() {
		Connection conn = getConnection();
		
		int result = new adminDAO().getListCount(conn);
		close(conn);
		return result;
	}
	
	public int getSearchListCount(String memGrade, String sCategory, String sWord) {
		Connection conn = getConnection();
		
		int result = new adminDAO().getSearchListCount(conn, memGrade, sCategory, sWord);
		close(conn);
		return result;
	}

	public ArrayList<Account> selectMmList(int currentPage) {
		Connection conn = getConnection();
		ArrayList<Account> list = new adminDAO().selectMmList(conn, currentPage);
		close(conn);
		
		return list;
	}

	public ArrayList<Account> searchMmList(int currentPage, String memGrade, String sCategory, String sWord) {
		Connection conn = getConnection();
		ArrayList<Account> search = new adminDAO().searchMmList(conn, currentPage, memGrade, sCategory, sWord);
		close(conn);
		
		return search;
	}

	public int updateGrade(String checkCategory, String[] userNo) {
		Connection conn = getConnection();
		adminDAO aDAO = new adminDAO();
		int result = aDAO.updateGrade(conn, checkCategory, userNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int deleteMem(String[] userNo) {
		Connection conn = getConnection();
		adminDAO aDAO = new adminDAO();
		int result = aDAO.deleteMem(conn, userNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int getBListCount() {
		Connection conn = getConnection();
		
		int result = new adminDAO().getBListCount(conn);
		close(conn);
		return result;
	}

	public int getSearchBListCount(String bCategory, String sCategory, String sWord) {
		Connection conn = getConnection();
		
		int result = new adminDAO().getSearchBListCount(conn, bCategory, sCategory, sWord);
		close(conn);
		return result;
	}

	public ArrayList<Board> selectBList(int currentPage) {
		Connection conn = getConnection();
		ArrayList<Board> list = new adminDAO().selectBList(conn, currentPage);
		close(conn);
		
		return list;
	}

	public ArrayList<Board> searchBList(int currentPage, String bCategory, String sCategory, String sWord) {
		Connection conn = getConnection();
		ArrayList<Board> search = new adminDAO().searchBList(conn, currentPage, bCategory, sCategory, sWord);
		close(conn);
		
		return search;
	}

	

}
