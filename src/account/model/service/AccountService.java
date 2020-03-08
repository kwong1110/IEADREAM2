package account.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import javax.security.auth.login.AccountException;

import account.model.dao.AccountDAO;
import account.model.vo.Account;

public class AccountService {
	
	public int idCheck(String userId) {
		Connection conn = getConnection();
		
		AccountDAO aDAO = new AccountDAO();
		int result = aDAO.idCheck(conn, userId);
		
		close(conn);
		
		return result;
	}

	public int insertAccount(Account a) {
		Connection conn = getConnection();
		
		AccountDAO aDAO = new AccountDAO();
		int result = aDAO.insertAccount(conn, a);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 로그인용 서비스
	public Account loginAccount(Account account) {
			Connection conn = getConnection();
			
			AccountDAO aDAO = new AccountDAO();
			Account loginUser = aDAO.loginMember(account, conn);
			close(conn);
			
			System.out.println(loginUser);
			return loginUser;
	}


	// 아이디 찾기 Service
	public Account searchId(String userName, String email) {
		Connection conn = getConnection();
		AccountDAO aDAO = new AccountDAO();
		
		Account a = aDAO.searchId(conn, userName, email);
		close(conn);
		
		return a;
	}

	
	// 비밀번호  찾기 Service
	public String searchPwd(Account account) {
		Connection conn = getConnection();
	
		AccountDAO aDAO = new AccountDAO();
		String findPwd = aDAO.searchPwd(conn, account); 
		close(conn);

		return findPwd;
		
	}

	public int emailCheck(String email) {
		Connection conn = getConnection();
		
		AccountDAO aDAO = new AccountDAO();
		int result = aDAO.emailCheck(conn, email);
		
		close(conn);
		
		return result;
	}

	public int adminPwdUpdate(String encPwd, String userId) {
		Connection conn = getConnection();
		
		AccountDAO dao = new AccountDAO();
		
		int result = dao.adminPwdUpdate(conn, encPwd, userId);
		
		if(result > 0) commit(conn);
		else		   rollback(conn);
		
		return result;
	}

}


	
