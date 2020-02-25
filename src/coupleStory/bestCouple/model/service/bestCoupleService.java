package coupleStory.bestCouple.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.bestCoupleDAO;
import board.model.vo.Board;
import photo.model.vo.Photo;

public class bestCoupleService {
	
	public int getListCount() {
		Connection conn = getConnection();
		
		int result = new bestCoupleDAO().getListCount(conn);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Board> selectbcList(int currentPage) {
		Connection conn = getConnection();
		bestCoupleDAO bcDAO = new bestCoupleDAO();
		ArrayList<Board> bcList = null;
		
		bcList = bcDAO.selectbcList(conn, currentPage);
		
		return bcList;
	}

	public ArrayList<Photo> selectpList() {
		Connection conn = getConnection();
		bestCoupleDAO bcDAO = new bestCoupleDAO();
		ArrayList<Photo> pList = null;
		
		pList = bcDAO.selectpList(conn);
		
		return pList;
	}
}
