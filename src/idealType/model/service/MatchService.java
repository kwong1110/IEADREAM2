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
		
		String targetGender = "F";
		if (getUserGender(userNo).equals("F")) {
			targetGender = "M";
		}
	
		int[] tlist = uiDAO.searchUserNoList(conn, targetGender); // 반대 성별 유저 리스트
		Match[] mlist = new Match[tlist.length];
		
		for (int i=0; i < tlist.length ; i++) {
			mlist[i].setSync(getMatchSync(userNo, tlist[i])); // 임시 매칭 리스트 생성, 싱크율 기준 정렬
		}
		Arrays.sort(mlist);										
		Match[] result = new Match[maxMatch];
		int j = 0;
		for (int i=0 ; i<5 || j < mlist.length; i++) { // 싱크율 옾은 순서대로 대입해서 중복 없고 상대도 나를 마음에 들어할 가능성이 있다면 리턴 배열에 추가
			for (; result[i] != null ; j++) {
				if (checkMatch(mlist[j]) && (getMatchSync(mlist[j].getUserNo(), userNo) > minSync)) {
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
	
	public double getMatchSync(int userNo, int targetNo) { // 취향 적합도 계산
		
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		UserPreferDAO upDAO = new UserPreferDAO();

		UserInfo ui = uiDAO.selectUserInfo(conn, userNo);
		UserPrefer up = upDAO.selectUserPrefer(conn, userNo);
		UserInfo ti = uiDAO.selectUserInfo(conn, targetNo);
		UserPrefer tp = upDAO.selectUserPrefer(conn, targetNo);
		
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

}