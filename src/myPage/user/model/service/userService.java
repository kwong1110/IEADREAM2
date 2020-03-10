package myPage.user.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.vo.Board;
import myPage.admin.model.dao.adminDAO;
import myPage.user.model.dao.userDAO;
import myPage.user.model.vo.Match;

public class userService {

	public int hhListCount(String userNo) {
		Connection conn = getConnection();
		
		int result = new userDAO().getHhListCount(conn, userNo);
		close(conn);
		return result;
	}

	public ArrayList<Match> selectHhList(int currentPage, String userNo) {
		Connection conn = getConnection();
		ArrayList<Match> list = new userDAO().selectHhList(conn, currentPage, userNo);
		close(conn);
		
		return list;
	}

	public int paymentMemGrade(String userNo) {
		Connection conn = getConnection();
		
		int result = new userDAO().paymentMemGrade(conn, userNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int getmWListCount(String userNo) {
		Connection conn = getConnection();
		
		int result = new userDAO().getmWListCount(conn, userNo);
		close(conn);
		return result;
	}

	public int getSearchmWListCount(String bCategory, String sCategory, String sWord, String userNo) {
		Connection conn = getConnection();
		
		int result = new userDAO().getSearchmWListCount(conn, bCategory, sCategory, sWord, userNo);
		close(conn);
		return result;
	}

	public ArrayList<Board> selectmWList(int currentPage, String userNo) {
		Connection conn = getConnection();
		ArrayList<Board> list = new userDAO().selectmWList(conn, currentPage, userNo);
		close(conn);
		
		return list;
	}

	public ArrayList<Board> searchmWList(int currentPage, String bCategory, String sCategory, String sWord,
			String userNo) {
		Connection conn = getConnection();
		ArrayList<Board> search = new userDAO().searchmWList(conn, currentPage, bCategory, sCategory, sWord, userNo);
		close(conn);
		
		return search;
	}

	public int deleteMyBo(String[] bNo) {
		Connection conn = getConnection();
		userDAO uDAO = new userDAO();
		int result = uDAO.deleteMyBo(conn, bNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int deleteHeart(String[] userNo, String[] targetNo) {
		Connection conn = getConnection();
		userDAO uDAO = new userDAO();
		int result = uDAO.deleteHeart(conn, userNo, targetNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int heartAutoDelete(String[] autoDTarget, String[] autoDUser) {
		Connection conn = getConnection();
		userDAO uDAO = new userDAO();
		int result = uDAO.heartAutoDelete(conn, autoDTarget, autoDUser);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

}
