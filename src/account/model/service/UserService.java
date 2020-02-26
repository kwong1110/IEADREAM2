package account.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import account.model.dao.UserPreferDAO;
import account.model.dao.UserInfoDAO;
import account.model.vo.UserPrefer;
import account.model.vo.UserInfo;
import account.model.vo.UserPhoto;


public class UserService {
	
	public int insertUserInfo(UserInfo ui) {
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		int result = uiDAO.insertUserInfo(conn, ui);
		int result2 = uiDAO.insertInterest(conn, ui);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int updateUserInfo(UserInfo ui) {
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		int result = uiDAO.updateUserInfo(conn, ui);

		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int insertPhoto(UserPhoto p) {
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		int r = uiDAO.deletePhoto(conn, p);
		int result = uiDAO.insertPhoto(conn, p);
		
		if(r > 0 && result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int deletePhoto(UserPhoto p) {
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		int result = uiDAO.deletePhoto(conn, p);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	
	public int insertUserInterest(UserInfo ui) {
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		int r = uiDAO.deleteInterest(conn, ui);
		int rs = uiDAO.insertInterest(conn, ui);
		int result = 1;
		
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int deleteUserInterest(UserInfo ui) {
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		int result = uiDAO.deleteInterest(conn, ui);

		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int insertUserPrefer(UserPrefer up) {
		Connection conn = getConnection();
		UserPreferDAO upDAO = new UserPreferDAO();
		int result = upDAO.insertUserPrefer(conn, up);
        
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int updateUserPrefer(UserPrefer up) {
		Connection conn = getConnection();
		UserPreferDAO upDAO = new UserPreferDAO();
		int result = upDAO.updateUserPrefer(conn, up);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
}