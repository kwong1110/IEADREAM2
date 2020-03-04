package account.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import account.model.dao.UserPreferDAO;
import account.model.dao.UserInfoDAO;
import account.model.vo.UserPrefer;
import board.model.vo.Photo;
import account.model.vo.Account;
import account.model.vo.UserInfo;
import account.model.vo.UserPhoto;


public class UserService {
	
	public Account selectAccount(int userNo) {
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		Account result = uiDAO.selectAccount(conn, userNo);
		
		return result;
	}
	
	public UserInfo selectUserInfo(int userNo) {
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		UserInfo result = uiDAO.selectUserInfo(conn, userNo);
		
		Date b = uiDAO.selectAccount(conn, userNo).getBirth();
		Calendar birth = Calendar.getInstance();
	    birth.setTime(b);
		
		Calendar current = Calendar.getInstance();
		int currentYear  = current.get(Calendar.YEAR);
		int currentMonth = current.get(Calendar.MONTH) + 1;
		int currentDay   = current.get(Calendar.DAY_OF_MONTH);
		
		int birthYear  = birth.get(Calendar.YEAR);
		int birthMonth = birth.get(Calendar.MONTH) + 1;
		int birthDay   = birth.get(Calendar.DAY_OF_MONTH);
		
		int age = currentYear - birthYear;
		if (birthMonth * 100 + birthDay > currentMonth * 100 + currentDay) { age--;}

		result.setAge(age);
		
		return result;
	}
	
	public int insertUserInfo(UserInfo ui) {
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		int result = uiDAO.insertUserInfo(conn, ui);
		int result2 = uiDAO.insertInterest(conn, ui);
		
		if(result > 0 && result2 > 0) {
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
	
	public ArrayList<UserPhoto> selectUserPhotoList(int userNo) {
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		ArrayList<UserPhoto> result = uiDAO.selectUserPhoto(conn, userNo);
		return result;
	}
	
	public UserPhoto selectUserPhoto(int userNo) {
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		ArrayList<UserPhoto> plist = uiDAO.selectUserPhoto(conn, userNo);
		for (int i =0; i < plist.size(); i++) {
			if (plist.get(i).getFileLevel() == 0) {return plist.get(i);}
		}
		
		return null;
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
	
	public String[] selectInterest(int userNo) {
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		String[] result = uiDAO.selectInterest(conn, userNo);
		return result;
	}
	
	public int insertUserInterest(UserInfo ui) {
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		uiDAO.deleteInterest(conn, ui);
		int result = uiDAO.insertInterest(conn, ui);
		
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
	
	public UserPrefer selectUserPrefer(int userNo) {
		Connection conn = getConnection();
		UserPreferDAO uiDAO = new UserPreferDAO();
		UserPrefer result = uiDAO.selectUserPrefer(conn, userNo);
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