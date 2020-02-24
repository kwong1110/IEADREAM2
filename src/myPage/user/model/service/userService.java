package myPage.user.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import account.model.dao.AccountDAO;
import account.model.vo.Account;
import myPage.user.model.dao.userDAO;
import myPage.user.model.vo.Recommend;

public class userService {

	public int hhListCount() {
		Connection conn = getConnection();
		
		int result = new userDAO().getHhListCount(conn);
		close(conn);
		return result;
	}

	public ArrayList<Recommend> selectHhList(int currentPage) {
		Connection conn = getConnection();
		ArrayList<Recommend> list = new userDAO().selectHhList(conn, currentPage);
		close(conn);
		
		return list;
	}

	public Account selectMyProfile(String loginId) {
		Connection conn = getConnection();
		AccountDAO dao = new AccountDAO();
		Account account = dao.selectMyProfile(conn, loginId);
		
		close(conn);
		return account;
	}

	public int updateAccount(Account account) {
		Connection conn = getConnection();
		AccountDAO dao = new AccountDAO();
		int result = dao.updateAccount(conn, account);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteAccount(String id) {
		Connection conn = getConnection();
		AccountDAO dao = new AccountDAO();
		int result = dao.deleteAccount(conn, id);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
