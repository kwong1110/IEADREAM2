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
		int result = aDAO.idCheck(conn, userId, userId);
		
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
	public Account searchid(Account account) {
		Connection conn = getConnection();
		System.out.println(account);

		
		AccountDAO aDAO = new AccountDAO();
		Account findId = aDAO.searchid(account, conn);
		close(conn);
		
		System.out.println(findId);
		
		return findId;
	}

	// 비밀번호  찾기 Service
	public String searchPwd(Account account) {
		Connection conn = getConnection();
		System.out.println(account);
		
		
		AccountDAO aDAO = new AccountDAO();
		String findPwd = aDAO.searchPwd(account, conn); 
		close(conn);
		
		
		return findPwd;
		
	}
	
}

	
