package idealType.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Arrays;

import account.model.dao.UserInfoDAO;
import account.model.service.AccountService;
import account.model.vo.UserInfo;
import account.model.vo.UserPrefer;
import idealType.model.dao.IdealTypeDAO;
import idealType.model.dao.MatchDAO;
import idealType.model.vo.Match;


public class MatchService {
	
	public int insertMatch(Match m) {
		Connection conn = getConnection();
		MatchDAO mDAO = new MatchDAO();
		int result = mDAO.insertMatch(conn, m);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int updateMatch(Match m) {
		Connection conn = getConnection();
		MatchDAO mDAO = new MatchDAO();
		int result = mDAO.updateMatch(conn, m);

		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public ArrayList<Match> findMatch(int userNo) {
		Connection conn = getConnection();
		ArrayList<Match> list = new ArrayList<Match>();
		
		
		String gender = getGender(new AccountService().selectAccount(userNo));
		
		
		
		return list;
	}
	
	public double getSync(UserInfo ui, UserPrefer up, UserInfo ti, UserPrefer tp) {
		double syncPoint = 0;
		int maxPoint = up.getHeightPri() + up.getShapePri() + up.getStylePri() + up.getAgePri() + up.getRegionPri() 
						+ up.getReligionPri() + up.getScholarPri() + up.getJobPri() + up.getDrinkPri() + up.getSmokePri() + up.getInterestPri();
		
		if (ti.getHeight() == up.getHeight()) 	{syncPoint += up.getHeightPri();}
		else {double v = Math.abs((ti.getHeight() - up.getHeight())/5); syncPoint += (1-v)*up.getHeightPri();}
		if (ti.getShape().equals(up.getShape())) 	{syncPoint += up.getShapePri();}
		if (ti.getStyle().equals(up.getStyle())) 	{syncPoint += up.getStylePri();}
		
		int d = ti.getAge() - ui.getAge();
		int ad = 0;
		if (ad > 3) {ad = 2;}
		else if (ad > 0) {ad = 1;}
		else if (ad == 0) {ad = 0;}
		else if (ad > -3) {ad = -1;}
		else {ad = -2;}
		if (ad == up.getAge()) {syncPoint += up.getAgePri();}
		else {double v = Math.abs((ti.getAge() - up.getAge())/2); syncPoint += (1-v)*up.getAgePri();}
		if (ti.getRegion() == ui.getRegion()) 	{syncPoint += up.getRegionPri();}
		else if(up.getRegionPri() == 1 && ti.getRegion()%10 == ui.getRegion()%10){syncPoint += 0.5*up.getRegionPri();}
		
		if (ti.getReligion().equals(up.getReligion())) {syncPoint += up.getReligionPri();}
		if (ti.getScholar() >= up.getScholar()) {syncPoint += up.getScholarPri();}
		else {double v = Math.abs((ti.getScholar() - up.getScholar())/2); syncPoint += (1-v)*up.getScholarPri();}
		if (ti.getJob().equals( up.getJob())) 	{syncPoint += up.getJobPri();}
		if (ti.getDrink() == up.getDrink()) 	{syncPoint += up.getDrinkPri();}
		else {double v = Math.abs((ti.getDrink() - up.getDrink())); syncPoint += (1-v)*up.getDrinkPri();}
		if (ti.getSmoke() == up.getSmoke()) 	{syncPoint += up.getSmokePri();}
		
		for (int i = 0; i < ui.getInterest().length; i++){
			if (Arrays.asList(ti.getInterest()).contains(ui.getInterest()[i])) {syncPoint += up.getInterestPri();}
		}
		
		return syncPoint/maxPoint;
	}
	

}