package myPage.admin.model.service;

import static common.JDBCTemplate.close;

import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import account.model.vo.Account;
import myPage.admin.model.dao.adminDAO;

public class adminService {

	public int getListCount() {
		Connection conn = getConnection();
		
		int result = new adminDAO().getListCount(conn);
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
		ArrayList<Account> search = new adminDAO().searchMmList(conn, currentPage,memGrade, sCategory, sWord);
		close(conn);
		
		return search;
	}
	

}
