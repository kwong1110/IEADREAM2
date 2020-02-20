package coupleStory.bestCouple.model.service;

import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import coupleStory.bestCouple.model.dao.bestCoupleDAO;
import coupleStory.bestCouple.model.vo.BestCouple;

public class bestCoupleService {
	
	public ArrayList<BestCouple> selectBcList() {
		Connection conn = getConnection();
		bestCoupleDAO bcDAO = new bestCoupleDAO();
		ArrayList list = null;
		
		list = bcDAO.selectBcList();
		
		return list;
	}
}
