package myPage.user.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

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

}
