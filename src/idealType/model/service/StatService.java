package idealType.model.service;

import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

import account.model.dao.UserInfoDAO;
import account.model.vo.Account;
import idealType.model.dao.MatchDAO;
import idealType.model.vo.Stat;

public class StatService {
	
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
	
	public Stat[][] getIdealUiStat(int userNo) {
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
	public Stat[][] getIdealUpStat(int userNo) {
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
	
	
	
		/*
		height[0].setItem("150");
		height[1].setItem("155");
		height[2].setItem("160");
		height[3].setItem("165");
		height[4].setItem("170");
		height[5].setItem("175");
		height[6].setItem("180");
		height[7].setItem("185");

	
		Stat[] shape = new Stat[5];
		
		shape[0].setItem("slim");
		shape[1].setItem("normal");
		shape[2].setItem("chubby");
		shape[3].setItem("muscular");
		shape[4].setItem("glamour");
		
		Stat[] style = new Stat[6];
		style[0].setItem("cute");
		style[1].setItem("intellect");
		style[2].setItem("sexy");
		style[3].setItem("warm");
		style[4].setItem("elegant");
		style[5].setItem("tough");
		
		Stat[] age = new Stat[5];
		age[0].setItem("-2");
		age[1].setItem("-1");
		age[2].setItem("0");
		age[3].setItem("1");
		age[4].setItem("2");
		
		Stat[] religion = new Stat[5];
		religion[0].setItem("christian");
		religion[1].setItem("catholic");
		religion[2].setItem("buddhism");
		religion[3].setItem("none");
		religion[4].setItem("etc");
		
		Stat[] drink = new Stat[4];
		drink[0].setItem("3");
		drink[1].setItem("2");
		drink[2].setItem("1");
		drink[3].setItem("0");
		
		Stat[] smoke = new Stat[2];
		smoke[0].setItem("1");
		smoke[1].setItem("0");
		
		Stat[] job = new Stat[8];
		job[0].setItem("student");
		job[1].setItem("office");
		job[2].setItem("research");
		job[3].setItem("education");
		job[4].setItem("art");
		job[5].setItem("service");
		job[6].setItem("profession");
		job[7].setItem("etc");

		Stat[] scholar = new Stat[5];
		job[0].setItem("0");
		job[1].setItem("2");
		job[2].setItem("4");		
		job[3].setItem("6");
		job[4].setItem("8");
		
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
		*/
		
		

	}

