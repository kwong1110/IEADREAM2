package account.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Calendar;
import java.sql.Date;
import java.util.GregorianCalendar;
import java.util.Random;

import account.model.dao.*;
import account.model.vo.*;
import account.model.vo.UserPhoto;


public class UserService {
	
	public Account selectAccount(int userNo) {
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		Account result = uiDAO.selectAccount(conn, userNo);
		
		return result;
	}
	public int getUserNo(String userId) {
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		int result = uiDAO.getUserNo(conn, userId);
		
		return result;
	}
	
	public UserInfo selectUserInfo(int userNo) {
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		UserInfo result = uiDAO.selectUserInfo(conn, userNo);
		
		Date b = uiDAO.selectAccount(conn, userNo).getBirth();
		Calendar birth = Calendar.getInstance();
	    birth.setTime(b);
		
		Calendar current = Calendar.getInstance();
		int currentYear  = current.get(Calendar.YEAR);
		int currentMonth = current.get(Calendar.MONTH) + 1;
		int currentDay   = current.get(Calendar.DAY_OF_MONTH);
		
		int birthYear  = birth.get(Calendar.YEAR);
		int birthMonth = birth.get(Calendar.MONTH) + 1;
		int birthDay   = birth.get(Calendar.DAY_OF_MONTH);
		
		int age = currentYear - birthYear;
		if (birthMonth * 100 + birthDay > currentMonth * 100 + currentDay) { age--;}

		result.setAge(age);
		
		return result;
	}
	
	public int insertUserInfo(UserInfo ui) {
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		int result = uiDAO.insertUserInfo(conn, ui);
		int result2 = uiDAO.insertInterest(conn, ui);
		
		if(result > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int updateUserInfo(UserInfo ui) {
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		int result = uiDAO.updateUserInfo(conn, ui);

		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public ArrayList<UserPhoto> selectUserPhotoList(int userNo) {
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		ArrayList<UserPhoto> result = uiDAO.selectUserPhoto(conn, userNo);
		return result;
	}
	
	public UserPhoto selectUserPhoto(int userNo) {
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		ArrayList<UserPhoto> plist = uiDAO.selectUserPhoto(conn, userNo);

		UserPhoto photo = plist.get(0);
		return photo;
	}
	public int insertPhoto(UserPhoto p) {
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		int r = uiDAO.deletePhoto(conn, p);
		int result = uiDAO.insertPhoto(conn, p);
		
		if(r > 0 && result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int deletePhoto(UserPhoto p) {
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		int result = uiDAO.deletePhoto(conn, p);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public String[] selectInterest(int userNo) {
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		String[] result = uiDAO.selectInterest(conn, userNo);
		return result;
	}
	
	public int insertUserInterest(UserInfo ui) {
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		uiDAO.deleteInterest(conn, ui);
		int result = uiDAO.insertInterest(conn, ui);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int deleteUserInterest(UserInfo ui) {
		Connection conn = getConnection();
		UserInfoDAO uiDAO = new UserInfoDAO();
		int result = uiDAO.deleteInterest(conn, ui);

		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public UserPrefer selectUserPrefer(int userNo) {
		Connection conn = getConnection();
		UserPreferDAO uiDAO = new UserPreferDAO();
		UserPrefer result = uiDAO.selectUserPrefer(conn, userNo);
		return result;
	}

	public int insertUserPrefer(UserPrefer up) {
		Connection conn = getConnection();
		UserPreferDAO upDAO = new UserPreferDAO();
		int result = upDAO.insertUserPrefer(conn, up);
        
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int updateUserPrefer(UserPrefer up) {
		Connection conn = getConnection();
		UserPreferDAO upDAO = new UserPreferDAO();
		int result = upDAO.updateUserPrefer(conn, up);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int randomInsert(int no) {
		Connection conn = getConnection();
		AccountDAO aDAO = new AccountDAO();
		UserInfoDAO uiDAO = new UserInfoDAO();
		UserPreferDAO upDAO = new UserPreferDAO();
		
		Account a = new Account();
		UserInfo ui = new UserInfo();
		UserPhoto p = new UserPhoto();
		UserPrefer up = new UserPrefer();
		Random random = new Random();
		
		for(int i=0; i<no; i++) {
			String userId = "Experiment" + i;
			String userPwd = "password1!";
			String gender = "M"; if (random.nextBoolean()) {gender = "F";}
			String userName = "실험체" + i;
			String phone = "01012345678" + i;
			String email = "exp" + i + "@naver.com";
			int year = 1980 + random.nextInt(20);
			int month = 1 + random.nextInt(12);
			int day = 1+ random.nextInt(28);
			Date birth = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());

			a.setId(userId);
			a.setPassword(userPwd);
			a.setGender(gender);
			a.setUserName(userName);
			a.setPhone(phone);
			a.setEmail(email);
			a.setBirth(birth);
			
			aDAO.insertAccount(conn, a);
			
			int userNo = getUserNo(a.getId());

			String hello = "안녕하세요";
			
			int height = 150 + 5*random.nextInt(8);
			String shape="마름";
			switch(random.nextInt(5)) {
			case 0: shape= "마름"; break;
			case 1: shape= "보통"; break;
			case 2: shape= "통통"; break;
			case 3: shape= "근육질"; break;
			case 4: shape= "글래머"; break;
			}
			
			String style = "귀여운";
			switch(random.nextInt(6)) {
			case 0: style= "귀여운"; break;
			case 1: style= "지적인"; break;
			case 2: style= "섹시한"; break;
			case 3: style= "따뜻한"; break;
			case 4: style= "우아한"; break;
			case 5: style= "터프한"; break;
			}
			
			int region = 11 + random.nextInt(3);
			
			String religion="기독교";
			switch(random.nextInt(5)) {
			case 0: religion= "기독교"; break;
			case 1: religion= "천주교"; break;
			case 2: religion= "불교"; break;
			case 3: religion= "무교"; break;
			case 4: religion= "기타"; break; 
			}
			
			int scholar = 2*random.nextInt(5);
	
			String job="학생";
			switch(random.nextInt(8)) {
			case 0: job = "학생"; break;
			case 1: job = "사무직"; break;
			case 2: job = "연구직"; break;
			case 3: job = "교육직"; break;
			case 4: job =  "예술"; break;
			case 5: job =  "서비스"; break;
			case 6: job = "전문직"; break;
			case 7: job = "기타"; break;
			}
			
			String[] interestList = {"movie", "musical", "comic", "picture", "books", "music",
                    "sing", "instrurment", "cook", "camp", "exercise", "sports",
                    "vgame", "bgame", "sns", "drink", "beauty", "pet", "diy", "money"};

			ArrayList<String> iList = new ArrayList<String>();
			
			for(int j=0; j<interestList.length; j++) {
				if(random.nextInt(3) == 0) {iList.add(interestList[j]);}
			}
			String[] interest = new String[iList.size()];
			for(int j=0; j< iList.size(); j++) {
				interest[j] = iList.get(j);
			}
			
			int drink = random.nextInt(4);
			int smoke = random.nextInt(2);
			
			ui.setUserNo(userNo);
			ui.setHello(hello);
			ui.setHeight(height);
			ui.setShape(shape);
			ui.setStyle(style);
			ui.setRegion(region);
			ui.setReligion(religion);
			ui.setScholar(scholar);
			ui.setJob(job);
			ui.setDrink(drink);
			ui.setSmoke(smoke);
			ui.setInterest(interest);
			
			uiDAO.insertUserInfo(conn, ui);
			uiDAO.insertInterest(conn, ui);
			
			String savePath ="/images/common/heart.png";
			String originName ="profile" + i;
			String changeName ="profile" + i;
			
			p.setUserNo(userNo);
			p.setFilePath(savePath);
			p.setOriginName(originName);
			p.setChangeName(changeName);
			
			uiDAO.insertPhoto(conn, p);
			
			int theight = 150 + 5*random.nextInt(8);
			int heightPri = random.nextInt(2);
			
			String tshape="마름";
			switch(random.nextInt(5)) {
			case 0: shape= "마름"; break;
			case 1: shape= "보통"; break;
			case 2: shape= "통통"; break;
			case 3: shape= "근육질"; break;
			case 4: shape= "글래머"; break;
			}
			int shapePri = random.nextInt(2);
			
			String tstyle = "귀여운";
			switch(random.nextInt(6)) {
			case 0: style= "귀여운"; break;
			case 1: style= "지적인"; break;
			case 2: style= "섹시한"; break;
			case 3: style= "따뜻한"; break;
			case 4: style= "우아한"; break;
			case 5: style= "터프한"; break;
			}
			int stylePri = random.nextInt(2);
			
			int tage = -2+ random.nextInt(5);
			int agePri = random.nextInt(2);
			
			int regionPri = random.nextInt(2);
			
			String treligion="기독교";
			switch(random.nextInt(5)) {
			case 0: religion= "기독교"; break;
			case 1: religion= "천주교"; break;
			case 2: religion= "불교"; break;
			case 3: religion= "무교"; break;
			case 4: religion= "기타"; break; 
			}
			int religionPri = random.nextInt(2);
			
			int tscholar = 2*random.nextInt(5);
			int scholarPri = random.nextInt(2);
	
			String tjob="학생";
			switch(random.nextInt(8)) {
			case 0: job = "학생"; break;
			case 1: job = "사무직"; break;
			case 2: job = "연구직"; break;
			case 3: job = "교육직"; break;
			case 4: job =  "예술"; break;
			case 5: job =  "서비스"; break;
			case 6: job = "전문직"; break;
			case 7: job = "기타"; break;
			}
			int jobPri = random.nextInt(2);
						
			int tdrink = random.nextInt(4);
			int drinkPri = random.nextInt(2);
			
			int tsmoke = random.nextInt(2);
			int smokePri = random.nextInt(2);

			int interestPri = random.nextInt(2);
			
			up.setUserNo(userNo);
			up.setHeight(theight);
			up.setHeightPri(heightPri);
			up.setShape(tshape);
			up.setShapePri(shapePri);
			up.setStyle(tstyle);
			up.setStylePri(stylePri);
			up.setAge(tage);
			up.setAgePri(agePri);
			up.setRegionPri(regionPri);
			up.setReligion(treligion);
			up.setReligionPri(religionPri);
			up.setScholar(tscholar);
			up.setScholarPri(scholarPri);
			up.setJob(tjob);
			up.setJobPri(jobPri);
			up.setDrink(tdrink);
			up.setDrinkPri(drinkPri);
			up.setSmoke(tsmoke);
			up.setSmokePri(smokePri);
			up.setInterestPri(interestPri);
			
			upDAO.insertUserPrefer(conn, up);
			
		}
		
		int result = 0;
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;

	}
	
}