package ui.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import ui.model.dao.UserInfoDAO;
import ui.model.vo.UserInfo;

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

		if(result) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int insertUserInterest(UserInfo ui) {
		Connection conn = getConnection();
		UserPreferDAO uiDAO = new UserInfoDAO();

		int r[] = new int[ui.Interest.size()];
		int result = true;

		for (i=0; i<ui.Interest.size();i++){
			UserInterest ut[i] = new UserInterest();
			ut[i].setUserNo(ui.getUserNO());
			ut[i].setInterest(ui.Interest[i]);

			r[i] = uiDAO.insertInterst(conn, ut[i]);
			if(r[i] <= 0){ result = -1; }
		}
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int deleteUserInterest(UserInfo ui) [
		Connection conn = getConnection();
		UserInfoDAO uiDAO=new UserInfoDAO();
		int result = uiDAO.deleteUserInterest(conn, ui);

		if(result) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	]

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