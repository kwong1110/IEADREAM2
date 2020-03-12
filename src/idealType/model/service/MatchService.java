package idealType.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;

import com.sun.corba.se.impl.orbutil.ObjectUtility;

import account.model.dao.UserInfoDAO;
import account.model.dao.UserPreferDAO;
import account.model.service.UserService;
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
		System.out.println("ulist size :" + ulist.size());
		
		if (ulist.size() > 0) {
		Match[] result = new Match[ulist.size()];
		for (int i=0; i<ulist.size() ;i++) {
			result[i] = new Match();
			result[i].setUserNo(ulist.get(i).getUserNo());
			result[i].setTargetNo(ulist.get(i).getTargetNo());
			result[i].setMatchDate(ulist.get(i).getMatchDate());
			result[i].setStatus(ulist.get(i).getStatus());
			result[i].setSync(ulist.get(i).getSync());
			
			System.out.println(result[i].getUserNo());
		}
		Arrays.sort(result);
		System.out.println("gumc userNo" + result[0].getUserNo());
		System.out.println("gumc targetNo" + result[0].getTargetNo());
		return result;
		}
		else {
		return null;
		}
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
		double minSync = 0.1;
		int maxMatch = 5;
		Connection conn = getConnection();
		
		UserService us = new UserService();
		
		UserInfo ui = us.selectUserInfo(userNo);
		UserPrefer up = us.selectUserPrefer(userNo);
		UserInfoDAO uiDAO = new UserInfoDAO();
		
		String targetGender = "F"; 							// 유저 성별 추출
		if (getUserGender(userNo).equals("F")) {
			targetGender = "M";
		}
		
		int[] tlist = uiDAO.searchUserNoList(conn, targetGender); // 타겟 성별 유저 리스트
		Match[] mlist = new Match[tlist.length];
		
		for (int i=0; i < tlist.length ; i++) {
			mlist[i] = new Match();
			mlist[i].setUserNo(userNo);
			mlist[i].setTargetNo(tlist[i]);
			UserInfo ti = us.selectUserInfo(tlist[i]);		//상대방 데이터 추출
			UserPrefer tp = us.selectUserPrefer(tlist[i]);
			double sync = getMatchSync(ui, up, ti, tp);		// 내가 상대를 볼 때의 취향 일치율 계산
			mlist[i].setSync(sync); 
			double rsync = getMatchSync(ti, tp, ui, up);	// 상대방이 나를 볼 때의 취향 일치율 계산
			mlist[i].setRsync(rsync);
			System.out.println(mlist[i].toString());
		}
		Arrays.sort(mlist);									//일치율순 정렬
		
		Match[] result = new Match[maxMatch];
		
		int j = 0;
		for (int i =0; i < maxMatch; j++) {
			if (j == mlist.length) {break;}
			System.out.println("" + mlist.length);
			if (checkMatch(mlist[j]) && (mlist[j].getRsync() > minSync)) { // 중복 검사, 상대의 싱크율 검사 후 리턴
					result[i] = new Match();
					result[i] = mlist[j];
					i++;
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
			else {double v = Math.abs((ti.getHeight() - up.getHeight())/10); syncPoint += (1-v)*up.getHeightPri();}
		
		if (ti.getStyle().equals(up.getStyle())) {syncPoint += up.getStylePri();}
		
		if (getAgeDiff(ti.getAge(), ui.getAge()) == up.getAge()) {syncPoint += up.getAgePri();}
			else {double v = Math.abs((getAgeDiff(ti.getAge(), ui.getAge()) - up.getAge())/2); syncPoint += (1-v)*up.getAgePri();}
	
		if (ti.getRegion() == ui.getRegion()) {syncPoint += up.getRegionPri();}
			else if(Math.floor(ti.getRegion()/10) == Math.floor(ui.getRegion()/10)){syncPoint += 0.5*up.getRegionPri();}
			else {syncPoint -= 0.5*maxPoint;} // 도 단위에서 거주 지역이 다른 경우 페널티
		
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
		System.out.println("sync =" + syncPoint);
		System.out.println("maxp =" + maxPoint);
		return Math.round(100*syncPoint/maxPoint)/100;
	}
	public int getAgeDiff(int uage, int tage) {
		int d = tage - uage;
		int ad = 0;
		if (d > 3) {ad = 2;}
		else if (d > 0) {ad = 1;}
		else if (d == 0) {ad = 0;}
		else if (d > -3) {ad = -1;}
		else {ad = -2;}
		return ad;
	}
	
	public int fillMatch(int userNo) {
		Match[] oldMlist = getMatchList(userNo);
		int stack = 0; int result = 0;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		
		Date today = new Date(System.currentTimeMillis());
		if (oldMlist != null) {
			for (int i = 0; i < oldMlist.length ; i++) {
				oldMlist[i] = getMatchList(userNo)[i];
				if (oldMlist[i].getStatus().equals("D")) { // 대기중인 매칭 수 구하기
					oldMlist[i].setMatchDate(today);
					updateMatch(oldMlist[i]);		//매치 날짜 갱신
					System.out.println("oldMlist" + oldMlist.toString() );
					stack++;
				}
				else if(sdf.format(oldMlist[i].getMatchDate()).equals(sdf.format(today))) { // 확인한 매칭 중 오늘 생성된 매칭 수 구하기
					stack++;
					System.out.println("stack++");
				}
				System.out.println("stack :" + stack);
			}
		}
		Match[] mlist = searchMatchList(userNo); 
		for (int i = 0; stack+i < 5 ; i++) {// 빈 공간 채워넣기
			result = insertMatch(mlist[i]);
		}
		return result;
	}
	/*public Stat[][] getUiStat(int userNo) {
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
	}*/
	
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
		double minSync = 0.4;
		UserService us = new UserService();
		
		UserInfo ui = us.selectUserInfo(userNo);
		UserPrefer up = us.selectUserPrefer(userNo);
		
		String targetGender = "F";
		if (getUserGender(userNo).equals("F")) {
			targetGender = "M";
		}
	
		int[] tlist = us.getUserNoList(targetGender); // 반대 성별 유저 리스트
		ArrayList<Integer> rList = new ArrayList<Integer>();
		
		for (int i=0; i < tlist.length ; i++) {
			UserInfo ti = us.selectUserInfo(tlist[i]);
			UserPrefer tp = us.selectUserPrefer(tlist[i]);
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
		for (int i = 0; i < height.length ;i++) {
			height[i] = new Stat();
			height[i].setProp(0);
		}
		height[0].setItem("150");
		height[1].setItem("155");
		height[2].setItem("160");
		height[3].setItem("165");
		height[4].setItem("170");
		height[5].setItem("175");
		height[6].setItem("180");
		height[7].setItem("185");
		
		Stat[] shape = new Stat[5];
		for (int i = 0; i < shape.length ;i++) {
			shape[i] = new Stat();
			shape[i].setProp(0);
		}
		shape[0].setItem("마름");
		shape[1].setItem("보통");
		shape[2].setItem("통통");
		shape[3].setItem("근육질");
		shape[4].setItem("글래머");
		
		Stat[] style = new Stat[6];
		for (int i = 0; i < style.length ;i++) {
			style[i] = new Stat();
			style[i].setProp(0);
		}
		style[0].setItem("귀여운");
		style[1].setItem("지적인");
		style[2].setItem("섹시한");
		style[3].setItem("따뜻한");
		style[4].setItem("우아한");
		style[5].setItem("터프한");
		
		Stat[] age = new Stat[5];
		for (int i = 0; i < age.length ;i++) {
			age[i] = new Stat();
			age[i].setProp(0);
		}
		age[0].setItem("-2");
		age[1].setItem("-1");
		age[2].setItem("0");
		age[3].setItem("1");
		age[4].setItem("2");
		
		Stat[] religion = new Stat[5];
		for (int i = 0; i < religion.length ;i++) {
			religion[i] = new Stat();
			religion[i].setProp(0);
		}
		religion[0].setItem("기독교");
		religion[1].setItem("천주교");
		religion[2].setItem("불교");
		religion[3].setItem("무교");
		religion[4].setItem("기타");
		
		Stat[] drink = new Stat[4];
		for (int i = 0; i < drink.length ;i++) {
			drink[i] = new Stat();
			drink[i].setProp(0);
		}
		drink[0].setItem("3");
		drink[1].setItem("2");
		drink[2].setItem("1");
		drink[3].setItem("0");

		Stat[] smoke = new Stat[2];for (int i = 0; i < smoke.length ;i++) {
			smoke[i] = new Stat();
			smoke[i].setProp(0);
		}
		smoke[0].setItem("1");
		smoke[1].setItem("0");
		
		Stat[] job = new Stat[8];
		for (int i = 0; i < job.length ;i++) {
			job[i] = new Stat();
			job[i].setProp(0);
		}
		job[0].setItem("학생");
		job[1].setItem("사무직");
		job[2].setItem("연구직");
		job[3].setItem("교육직");
		job[4].setItem("예술");
		job[5].setItem("서비스");
		job[6].setItem("전문직");
		job[7].setItem("기타");
		
		Stat[] scholar = new Stat[5];
		for (int i = 0; i < scholar.length ;i++) {
			scholar[i] = new Stat();
			scholar[i].setProp(0);
		}
		scholar[0].setItem("0");
		scholar[1].setItem("2");
		scholar[2].setItem("4");
		scholar[3].setItem("6");
		scholar[4].setItem("8");
		
		Stat[] region = new Stat[16];
		for (int i = 0; i < region.length ;i++) {
			region[i] = new Stat();
			region[i].setProp(0);
		}
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
		for (int i = 0; i < interest.length ;i++) {
			interest[i] = new Stat();
			interest[i].setProp(0);
		}
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

		
		for (int n=0; n<list.length; n++ ) {
			System.out.println("루프 시작");
			UserInfo ui = uiDAO.selectUserInfo(conn, list[n]);
			UserPrefer up = upDAO.selectUserPrefer(conn, list[n]);
			
			for (int j=0; j<height.length ; j++) {
				if (up.getHeight() == Integer.parseInt(height[j].getItem())) {
					height[j].addProp();}
			}
			
			for (int j=0; j<shape.length ; j++) {
				if (up.getShape().equals(shape[j].getItem())) {
					shape[j].addProp();}
			}
			
			for (int j=0; j<style.length ; j++) {
				if (up.getStyle().equals(style[j].getItem())) {
					style[j].addProp();}
			}
			
			for (int j=0; j<age.length ; j++) {
				if (up.getAge() == Integer.parseInt(age[j].getItem())) {
					age[j].addProp();}
			}
			
			for (int j=0; j<religion.length ; j++) {
				if (up.getReligion().equals(religion[j].getItem())) {
					religion[j].addProp();}
			}
			
			for (int j=0; j<drink.length ; j++) {
				if (up.getDrink() == Integer.parseInt(drink[j].getItem())) {
					drink[j].addProp();}
			}
			
			for (int j=0; j<smoke.length ; j++) {
				if (up.getSmoke() == Integer.parseInt(smoke[j].getItem())) {
					smoke[j].addProp();}
			}
			
			for (int j=0; j<job.length ; j++) {
				if (up.getJob().equals(job[j].getItem())) {
					job[j].addProp();}
			}
			
			for (int j=0; j<scholar.length ; j++) {
				if (up.getScholar() == Integer.parseInt(scholar[j].getItem())) {
					scholar[j].addProp();}
			}
			
			for (int j=0; j<region.length ; j++) {
				if (ui.getRegion() == Integer.parseInt(region[j].getItem())) {
					region[j].addProp();}
			}
			
			for (int j=0; j<interest.length ; j++) {
				String[] interestList = ui.getInterest();
				for (int k=0; k< interestList.length ; k++) {
					if (interestList[k].equals(interest[j].getItem())) {
						interest[j].addProp();
					}
				}
			}
			for (int j=0; j< height.length; j++) { height[j].divProp(list.length);}
			Arrays.sort(height);
			for (int j=0; j< shape.length; j++) { shape[j].divProp(list.length);}
			Arrays.sort(shape);
			for (int j=0; j< style.length; j++) { style[j].divProp(list.length);}
			Arrays.sort(style);
			for (int j=0; j< age.length; j++) { age[j].divProp(list.length);}
			Arrays.sort(age);
			for (int j=0; j< religion.length; j++) { religion[j].divProp(list.length);}
			Arrays.sort(religion);
			for (int j=0; j< drink.length; j++) { drink[j].divProp(list.length);}
			Arrays.sort(drink);
			for (int j=0; j< smoke.length; j++) { smoke[j].divProp(list.length);}
			Arrays.sort(smoke);
			for (int j=0; j< job.length; j++) { job[j].divProp(list.length);}
			Arrays.sort(job);
			for (int j=0; j< scholar.length; j++) { scholar[j].divProp(list.length);}
			Arrays.sort(scholar);
			for (int j=0; j< region.length; j++) { region[j].divProp(list.length);}
			Arrays.sort(region);
			for (int j=0; j< interest.length; j++) { interest[j].divProp(list.length);}
			Arrays.sort(interest);
		}
		
		Stat[][] result = new Stat[11][];
		result[0] = height;
		System.out.println("result" + result[0][0] + result[0][1]);
		System.out.println("height" + height[0] + height[1]);
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
}