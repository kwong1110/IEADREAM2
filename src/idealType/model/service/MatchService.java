package idealType.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;

import account.model.dao.UserInfoDAO;
import account.model.dao.UserPreferDAO;
import account.model.service.AccountService;
import account.model.vo.Account;
import account.model.vo.UserInfo;
import account.model.vo.UserPrefer;
import idealType.model.dao.MatchDAO;
import idealType.model.vo.Match;


public class MatchService {
	
	public Match[] getMatchList(int userNo) {
		Connection conn = getConnection();
		MatchDAO mDAO = new MatchDAO();
		Match[] result = mDAO.selectMatchList(conn, userNo);
		return result;
	}

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
	
	public Match[] findMatch(int userNo) {
		double minSync = 0.5;
		int maxMatch = 5;
		
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		UserPreferDAO upDAO = new UserPreferDAO();
		
		UserInfo ui = uiDAO.selectUserInfo(conn, userNo);
		UserPrefer up = upDAO.selectUserPrefer(conn, userNo);
		
		String targetGender = "F";
		if (getUserGender(userNo).equals("F")) {
			targetGender = "M";
		}
	
		int[] tlist = uiDAO.searchUserNoList(conn, targetGender); // 반대 성별 유저 리스트
		Match[] mlist = new Match[tlist.length];
		
		for (int i=0; i < tlist.length ; i++) {
			UserInfo ti = uiDAO.selectUserInfo(conn, tlist[i]);
			UserPrefer tp = upDAO.selectUserPrefer(conn, tlist[i]);
			mlist[i].setSync(getMatchSync(ui, up, ti, tp)); // 임시 매칭 리스트 생성, 싱크율 기준 정렬
			mlist[i].setRsync(getMatchSync(ti, tp, ui, up)); // 상대방이 나를 볼 때의 싱크
		}
		Arrays.sort(mlist);								//싱크로율순 정렬		
		Match[] result = new Match[maxMatch];
		
		int j = 0;
		for (int i=0 ; i<5 || j < mlist.length; i++) { 
			for (; result[i] != null ; j++) {
				if (checkMatch(mlist[j]) && (mlist[i].getRsync() > minSync)) { // 중복 검사, 상대의 싱크율 검사 후 리턴
					result[i] = mlist[j];}
			}
		}
		return result;
	}
	
	public String getUserGender(int userNo) { // 성별 확인
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		Account ac = uiDAO.selectAccount(conn, userNo);
		String gender = ac.getGender();
		return gender;
	}
	
	public boolean checkMatch(Match m) { //중복 확인
		Connection conn = getConnection();
		MatchDAO mDAO = new MatchDAO();
		Match[] mlist = mDAO.selectMatchList(conn, m.getUserNo());
		boolean result = true;
		for (int i=0; i < mlist.length ;i++) {
			if (mlist[i].getTargetNo() == m.getTargetNo()){
				result = false;
			}
		}
		return result;
	}
	
	public double getMatchSync(UserInfo ui, UserPrefer up, UserInfo ti, UserPrefer tp) { // 취향 적합도 계산
		double syncPoint = 0;
		int maxPoint = up.getHeightPri() + up.getShapePri() + up.getStylePri() + up.getAgePri() + up.getRegionPri() 
						+ up.getReligionPri() + up.getScholarPri() + up.getJobPri() + up.getDrinkPri() + up.getSmokePri() + up.getInterestPri();
		
		if (ti.getHeight() == up.getHeight()) 	{syncPoint += up.getHeightPri();}
		else {double v = Math.abs((ti.getHeight() - up.getHeight())/5); syncPoint += (1-v)*up.getHeightPri();}
		if (ti.getShape().equals(up.getShape())) 	{syncPoint += up.getShapePri();}
		if (ti.getStyle().equals(up.getStyle())) 	{syncPoint += up.getStylePri();}
		
		int d = ti.getAge() - ui.getAge();
		int ad = 0;
		if (d > 3) {ad = 2;}
		else if (d > 0) {ad = 1;}
		else if (d == 0) {ad = 0;}
		else if (d > -3) {ad = -1;}
		else {ad = -2;}
		if (ad == up.getAge()) {syncPoint += up.getAgePri();}
		else {double v = Math.abs((ti.getAge() - up.getAge())/2); syncPoint += (1-v)*up.getAgePri();}
		if (ti.getRegion() == ui.getRegion()) {syncPoint += up.getRegionPri();}
			else if(ti.getRegion()%10 == ui.getRegion()%10){syncPoint += 0.5*up.getRegionPri();}
			else {syncPoint -= 0.5*maxPoint;} // 도 단위애서 거주 지역이 다른 경우
		
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
	
	public int get
	

}