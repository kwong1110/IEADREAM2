package idealType.model.service;

import static common.JDBCTemplate.*;

import java.lang.reflect.Array;
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
import idealType.model.vo.Stat;


public class MatchService {
	
	public Match[] getMatchList(int userNo) {
		Connection conn = getConnection();
		MatchDAO mDAO = new MatchDAO();
		Match[] result = mDAO.selectMatchList(conn, userNo);
		return result;
	}
	
	public Match[] getUncheckedMatchList(int userNo) {
		Connection conn = getConnection();
		MatchDAO mDAO = new MatchDAO();
		Match[] mlist = mDAO.selectMatchList(conn, userNo);
		
		ArrayList<Match> ulist = new ArrayList<Match>();
		for (int i=0; i<mlist.length; i++) {
			if (mlist[i].getStatus().equals("D") || mlist[i].getStatus().equals("C")){
				ulist.add(mlist[i]);
			}
		}
		Match[] result = new Match[ulist.size()];
		for (int i=0; i<ulist.size() ;i++) {
			mlist[i] = ulist.get(i);
		}
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
	
	public Match[] searchMatchList(int userNo) {
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
		for (int i=0 ; i< maxMatch || j < mlist.length; i++) { 
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
	public Stat[][] getUiStat(int userNo) {
		Connection conn = getConnection();
		MatchDAO mDAO = new MatchDAO();
		
		UserInfoDAO uiDAO = new UserInfoDAO();
		Account ac = uiDAO.selectAccount(conn, userNo);
		String gender = ac.getGender();
		
		Stat[] height = mDAO.getUiProp(conn, "HEIGHT", gender);
		Stat[] shape = mDAO.getUiProp(conn, "SHAPE", gender);
		Stat[] style = mDAO.getUiProp(conn, "STYLE", gender);
		Stat[] age = mDAO.getUiProp(conn, "AGE", gender);
		
		Stat[] religion = mDAO.getUiProp(conn, "RELIGION", gender);
		Stat[] drink = mDAO.getUiProp(conn, "DRINK", gender);
		Stat[] smoke = mDAO.getUiProp(conn, "SMOKE", gender);
		Stat[] job = mDAO.getUiProp(conn, "JOB", gender);
		Stat[] scholar = mDAO.getUiProp(conn, "SCHOLAR", gender);
		Stat[] region = mDAO.getUiProp(conn, "REGION", gender);
		
		Stat[] interest = mDAO.getInterestProp(conn, gender);
		
		
		Stat[][] result = new Stat[11][];
		result[0] = height;
		result[1] = shape;
		result[2] = style;
		result[3] = age;
		result[4] = religion;
		result[5] = drink;
		result[6] = smoke;
		result[7] = job;
		result[8] = scholar;
		result[9] = region;
		result[10] = interest;
		
		return result;
	}	
	
	public Stat[][] getUpStat(int userNo) {
		Connection conn = getConnection();
		MatchDAO mDAO = new MatchDAO();
		
		UserInfoDAO uiDAO = new UserInfoDAO();
		Account ac = uiDAO.selectAccount(conn, userNo);
		String gender = ac.getGender();
		
		Stat[] height = mDAO.getUpProp(conn, "HEIGHT", gender);
		Stat[] shape = mDAO.getUpProp(conn, "SHAPE", gender);
		Stat[] style = mDAO.getUpProp(conn, "STYLE", gender);
		Stat[] age = mDAO.getUpProp(conn, "AGE", gender);
		
		Stat[] religion = mDAO.getUpProp(conn, "RELIGION", gender);
		Stat[] drink = mDAO.getUpProp(conn, "DRINK", gender);
		Stat[] smoke = mDAO.getUpProp(conn, "SMOKE", gender);
		Stat[] job = mDAO.getUpProp(conn, "JOB", gender);
		Stat[] scholar = mDAO.getUpProp(conn, "SCHOLAR", gender);
		Stat[] region = mDAO.getUiProp(conn, "REGION", gender);
		
		Stat[] interest = mDAO.getInterestProp(conn, gender);
		
		
		Stat[][] result = new Stat[11][];
		result[0] = height;
		result[1] = shape;
		result[2] = style;
		result[3] = age;
		result[4] = religion;
		result[5] = drink;
		result[6] = smoke;
		result[7] = job;
		result[8] = scholar;
		result[9] = region;
		result[10] = interest;
		
		return result;
	}
	
	public int[] searchIdealList(int userNo) {
		double minSync = 0.7;
		
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
		ArrayList<Integer> rList = new ArrayList<Integer>();
		
		for (int i=0; i < tlist.length ; i++) {
			UserInfo ti = uiDAO.selectUserInfo(conn, tlist[i]);
			UserPrefer tp = upDAO.selectUserPrefer(conn, tlist[i]);
			if (getMatchSync(ui, up, ti, tp) > minSync){rList.add(tlist[i]);}
		}
		int [] result = new int[rList.size()];
		for (int i=0; i<result.length; i++) {
			result[i] = rList.get(i).intValue();
		}
		return result;
	}
	
	public Stat[][] getIdealUpStat(int[] list) {
		Connection conn = getConnection();
		
		UserInfoDAO uiDAO = new UserInfoDAO();
		UserPreferDAO upDAO = new UserPreferDAO();
		
		Stat[] height = new Stat[8];
		height[0].setItem("150");
		height[1].setItem("155");
		height[2].setItem("160");
		height[3].setItem("165");
		height[4].setItem("170");
		height[5].setItem("175");
		height[6].setItem("180");
		height[7].setItem("185");
		
		Stat[] shape = new Stat[5];
		shape[0].setItem("마름");
		shape[1].setItem("보통");
		shape[2].setItem("통통");
		shape[3].setItem("근육질");
		shape[4].setItem("글래머");
		
		Stat[] style = new Stat[6];
		style[0].setItem("귀여운");
		style[1].setItem("지적인");
		style[2].setItem("섹시한");
		style[3].setItem("따뜻한");
		style[4].setItem("우아한");
		style[5].setItem("터프한");
		
		Stat[] age = new Stat[5];
		age[0].setItem("-2");
		age[1].setItem("-1");
		age[2].setItem("0");
		age[3].setItem("1");
		age[4].setItem("2");
		
		/*int minAge = 15;
		for(int i=0; i < age.length; i++) {
			age[i].setItem("" + Integer.toString(minAge+i));
		}
		*/
		Stat[] religion = new Stat[5];
		religion[0].setItem("기독교");
		religion[1].setItem("천주교");
		religion[2].setItem("불교");
		religion[3].setItem("무교");
		religion[4].setItem("기타");
		
		Stat[] drink = new Stat[4];
		drink[0].setItem("3");
		drink[1].setItem("2");
		drink[2].setItem("1");
		drink[3].setItem("0");

		Stat[] smoke = new Stat[2];
		smoke[0].setItem("1");
		smoke[1].setItem("0");
		
		Stat[] job = new Stat[8];
		job[0].setItem("학생");
		job[1].setItem("사무직");
		job[2].setItem("연구직");
		job[3].setItem("교육직");
		job[4].setItem("예술");
		job[5].setItem("서비스");
		job[6].setItem("전문직");
		job[7].setItem("기타");
		
		Stat[] scholar = new Stat[5];
		scholar[0].setItem("0");
		scholar[1].setItem("2");
		scholar[2].setItem("4");
		scholar[3].setItem("6");
		scholar[4].setItem("8");
		
		Stat[] region = new Stat[16];
		region[0].setItem("11");
		region[1].setItem("12");
		region[2].setItem("13");
		region[3].setItem("20");
		region[4].setItem("31");
		region[5].setItem("32");
		region[6].setItem("33");
		region[7].setItem("41");
		region[8].setItem("42");
		region[9].setItem("43");
		region[10].setItem("51");
		region[11].setItem("52");
		region[12].setItem("53");
		region[13].setItem("54");
		region[14].setItem("55");
		region[15].setItem("60");
		
		
		Stat[] interest = new Stat[20];
		interest[0].setItem("movie");
		interest[1].setItem("musical");
		interest[2].setItem("comic");
		interest[3].setItem("picture");
		interest[4].setItem("books");
		interest[5].setItem("music");
		interest[6].setItem("sing");
		interest[7].setItem("instrument");
		interest[8].setItem("cook");
		interest[9].setItem("camp");
		interest[10].setItem("exercise");
		interest[11].setItem("sports");
		interest[12].setItem("vgame");
		interest[13].setItem("bgame");
		interest[14].setItem("sns");
		interest[15].setItem("drink");
		interest[16].setItem("beauty");
		interest[17].setItem("pet");
		interest[18].setItem("diy");
		interest[19].setItem("money");

		Stat[][] result = new Stat[11][];
		result[0] = height;
		result[1] = shape;
		result[2] = style;
		result[3] = age;
		result[4] = religion;
		result[5] = drink;
		result[6] = smoke;
		result[7] = job;
		result[8] = scholar;
		result[9] = region;
		result[10] = interest;
		
		for (int i=0; i< result.length ;i++) { // 초기화
			for (int j=0; j< result[i].length; j++) {
				result[i][j].setProp(0);
			}
		}
		
		for (int n=0; n<list.length; n++ ) {
			UserInfo ui = uiDAO.selectUserInfo(conn, list[n]);
			UserPrefer up = upDAO.selectUserPrefer(conn, list[n]);
			
			for (int j=0; j<height.length ; j++) {
				if (up.getHeight() == Integer.parseInt(height[j].getItem())) {
					height[j].addProp();
				}
			}
			for (int j=0; j<shape.length ; j++) {
				if (up.getShape().equals(shape[j].getItem())) {
					shape[j].addProp();
				}
			}
			for (int j=0; j<style.length ; j++) {
				if (up.getStyle().equals(style[j].getItem())) {
					style[j].addProp();
				}
			}
			for (int j=0; j<age.length ; j++) {
				if (up.getAge() == Integer.parseInt(age[j].getItem())) {
					age[j].addProp();
				}
			}
			for (int j=0; j<religion.length ; j++) {
				if (up.getReligion().equals(religion[j].getItem())) {
					religion[j].addProp();
				}
				
			}
			for (int j=0; j<drink.length ; j++) {
				if (up.getDrink() == Integer.parseInt(drink[j].getItem())) {
					drink[j].addProp();
				}
			}
			for (int j=0; j<smoke.length ; j++) {
				if (up.getSmoke() == Integer.parseInt(smoke[j].getItem())) {
					smoke[j].addProp();
				}
			}
			for (int j=0; j<job.length ; j++) {
				if (up.getJob().equals(job[j].getItem())) {
					job[j].addProp();
				}
			}
			for (int j=0; j<scholar.length ; j++) {
				if (up.getScholar() == Integer.parseInt(scholar[j].getItem())) {
					scholar[j].addProp();
				}
			}
			for (int j=0; j<region.length ; j++) {
				if (ui.getRegion() == Integer.parseInt(region[j].getItem())) {
					region[j].addProp();
				}
			}
			for (int j=0; j<interest.length ; j++) {
				String[] interestList = ui.getInterest();
				for (int k=0; k< interestList.length ; k++) {
					if (interestList[k].equals(interest[j].getItem())) {
						interest[j].addProp();
					}
				}
			}
		}
		
		for (int p=0; p< result.length ;p++) { // 전체 인원수로 나눠 비율 구하기
			for (int j=0; j< result[p].length; j++) {
				result[p][j].divProp(list.length);
			}
			Arrays.sort(result[p]);
		}
		return result;
	}
}