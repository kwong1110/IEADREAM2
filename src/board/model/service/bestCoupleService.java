package board.model.service;

import static common.JDBCTemplate.*;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.bestCoupleDAO;
import board.model.vo.BestCouple;
import board.model.vo.Board;
import board.model.vo.Photo;

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

	public int insertPhoto(Board b, BestCouple bc, ArrayList<Photo> photoList) {
		Connection conn = getConnection();
		
		bestCoupleDAO bcDAO = new bestCoupleDAO();
		
		int result1 = bcDAO.insertbcBoard(conn, b);
		int result2 = bcDAO.insertbcBestCouple(conn, bc);
		int result3 = bcDAO.insertbcPhoto(conn, photoList);
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1;
	}

}	
