package coupleStory.bestCouple.model.service;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.util.ArrayList;

import coupleStory.bestCouple.model.dao.bestCoupleDAO;
import coupleStory.bestCouple.model.vo.BestCouple;
import photo.model.vo.Photo;

public class bestCoupleService {
	
	public int getListCount() {
		Connection conn = getConnection();
		
		int result = new bestCoupleDAO().getListCount(conn);
		
		close(conn);
		
		return result;
	}

	public ArrayList<BestCouple> selectbcList(int currentPage) {
		Connection conn = getConnection();
		bestCoupleDAO bcDAO = new bestCoupleDAO();
		ArrayList<BestCouple> bcList = null;
		
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
