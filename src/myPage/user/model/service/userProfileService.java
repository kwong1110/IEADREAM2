package myPage.user.model.service;

import java.sql.Connection;

import static common.JDBCTemplate.*;

import account.model.vo.Account;
import account.model.vo.UserInfo;
import account.model.vo.UserPrefer;
import myPage.user.model.dao.userProfileDAO;

public class userProfileService {

	public Account selectProfile(String loginUser) {
		Connection conn = getConnection();
		userProfileDAO dao = new userProfileDAO();
		Account account = dao.selectProfile(conn, loginUser);
		
		close(conn);
		return account;
	}

	public int updateProfile(Account account) {
		Connection conn = getConnection();
		userProfileDAO dao = new userProfileDAO();
		int result = dao.updateProfile(conn, account);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteProfile(Account account) {
		Connection conn = getConnection();
		userProfileDAO dao = new userProfileDAO();
		
		int result = dao.deleteProfile(conn, account);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public UserInfo updateUserInfo(int userNo) {
		Connection conn = getConnection();
		userProfileDAO dao = new userProfileDAO();
		
		UserInfo ui = dao.updateUserInfo(conn, userNo);
		
		close(conn);
		return ui;
		
	}

	public int updateInfo(UserInfo ui) {
		Connection conn = getConnection();
		userProfileDAO dao = new userProfileDAO();
		
		int result = dao.updateInfo(conn, ui); //user_info 테이블에 업데이트
		int result2 = dao.updateInter(conn, ui); //interest 테이블에 업데이트
		
		if(result > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public UserPrefer updateIdealInfo(int userNo) {
		Connection conn = getConnection();
		userProfileDAO dao = new userProfileDAO();
		
	}
	
}
