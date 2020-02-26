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
		int result = uiDAO.insertPhoto(conn, p);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int deletePhoto(UserInfo ui) {
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		int result = uiDAO.deletePhoto(conn, ui.getUserNo());
		
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
		
		int[] rs = uiDAO.insertInterest(conn, ui.getUserNo(), ui.getInterest());
		int result = 1;
		
		for (int i=0;i<rs.length;i++){
			if(rs[i] <= 0){result = 0;} 
		}
		
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
		int result = uiDAO.deleteInterest(conn, ui.getUserNo());

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