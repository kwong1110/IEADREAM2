package coupleStory.bestCouple.model.service;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.util.ArrayList;

import coupleStory.bestCouple.model.dao.bestCoupleDAO;
import coupleStory.bestCouple.model.vo.BestCouple;

public class bestCoupleService {
	
	public int getListCount() {
		Connection conn = getConnection();
		
		int result = new bestCoupleDAO().getListCount(conn);
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<BestCouple> selectBcList(int currentPage) {
		Connection conn = getConnection();
		bestCoupleDAO bcDAO = new bestCoupleDAO();
		
		ArrayList<BestCouple> bcList = bcDAO.selectBcList(conn, currentPage);
		
		return bcList;
	}

}
