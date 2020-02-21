package account.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import account.model.dao.AccountDAO;
import account.model.vo.Account;

public class AccountService {
	public int updateAccount(Account account) {
		/* DAO와 연결할 connection 객체와 DAO 생성 */
		Connection conn = getConnection();
		AccountDAO aDAO = new AccountDAO();
		
		/* 업데이트할 회원 정보가 담긴 account와 conn객체를 dao에 넘김 */
		int result = aDAO.updateAccount(conn, account);
		
		/* 업데이트 여부(result int값)에 따라서 commit, rollback 수행 */
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		/* commit, rollack을 끝내고 연결 끊기 위해 close 수행 */
		close(conn);
		return result;
	}
	
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
	public Account searchid(Account account) {
		Connection conn = getConnection();
		
		AccountDAO aDAO = new AccountDAO();
		Account findId = aDAO.searchid(account, conn);
		close(conn);
		
		System.out.println(findId);
		
		return findId;
	}
	
}

	
