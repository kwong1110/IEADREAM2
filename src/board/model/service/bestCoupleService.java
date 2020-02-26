package board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

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
	
	public Board selectBoard(int pNo) {
		Connection conn = getConnection();
		bestCoupleDAO bcDAO = new bestCoupleDAO();
		
		int result = bcDAO.updateCount(conn, pNo);
		
		Board b = null;
		if(result > 0) {
			b = bcDAO.selectBoard(conn, pNo);
			
			if(b != null) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return b;
	}

	public BestCouple selectBestCouple(int pNo) {
		Connection conn = getConnection();
		bestCoupleDAO bcDAO = new bestCoupleDAO();
		
		BestCouple bc = bcDAO.selectBestCouple(conn, pNo);
		
		return bc;
	}

	public ArrayList<Photo> selectPhoto(int pNo) {
		Connection conn = getConnection();
		bestCoupleDAO bcDAO = new bestCoupleDAO();
		
		ArrayList<Photo> pList = bcDAO.selectPhoto(conn, pNo);
		
		return pList;
	}

	public int updatePhoto(Board b, BestCouple bc) {
		Connection conn = getConnection();
		
		bestCoupleDAO bcDAO = new bestCoupleDAO();
		
		int result1 = bcDAO.updatePtBoard(conn, b);
		int result2 = bcDAO.updatePtBestCouple(conn, bc);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1;
	}

	public int updatePhoto(Board b, BestCouple bc, ArrayList<Photo> file) {
		Connection conn = getConnection();
		
		bestCoupleDAO bcDAO = new bestCoupleDAO();
		
		int result1 = bcDAO.updatePtBoard(conn, b);
		int result2 = bcDAO.updatePtBestCouple(conn, bc);
		int result3 = 0;
		
		if(file.get(0).getPhotoNo() == 0) {
			result3 = bcDAO.insertNewPhoto(conn, file);
		} else {
			result3 = bcDAO.updatePhoto(conn, file);
		}
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1;
	}

	public int updatePhoto(Board b, BestCouple bc, ArrayList<Photo> changeFile, ArrayList<Photo> newInsertFile) {
		Connection conn = getConnection();
		
		bestCoupleDAO bcDAO = new bestCoupleDAO();
		
		int result1 = bcDAO.updatePtBoard(conn, b);
		int result2 = bcDAO.updatePtBestCouple(conn, bc);
		int result3 = bcDAO.updatePhoto(conn, changeFile);
		int result4 = bcDAO.insertNewPhoto(conn, newInsertFile);
		
		if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1;
	}

	public int deleteBoard(int pNo) {
		Connection conn = getConnection();
		bestCoupleDAO bcDAO = new bestCoupleDAO();
		
		int result = bcDAO.deleteBoard(conn, pNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}


}	
