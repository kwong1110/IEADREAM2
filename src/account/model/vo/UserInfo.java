package account.model.vo;

import java.util.Arrays;

public class UserInfo {

	private int userNo;
	private String gender;		// 성별
	private String hello;		// 자기소개
	private int height;			// 키
	private String shape;		// 체형
	private String style;		// 스타일
	private int age;			// 나이
	private int region;			// 거주지역
	private String religion;	// 종교
	private int scholar;		// 학력
	private String job;			// 직업
	private int drink;			// 음주
	private int smoke;			// 흡연

	private String[] interest;

	public UserInfo() {}

	public UserInfo(int userNo, String gender, String hello, int height, String shape, String style,
			int age, int region, String religion, int scholar, String job, int drink, int smoke, String[] interest) {
		super();
		this.userNo = userNo;
		this.gender = gender;
		this.hello = hello;
		this.height = height;
		this.shape = shape;
		this.style = style;
		this.age = age;
		this.region = region;
		this.religion = religion;
		this.scholar = scholar;
		this.job = job;
		this.drink = drink;
		this.smoke = smoke;
		this.interest = interest;
	}
	
	public UserInfo(int userNo, String gender, String hello, int height, String shape, String style,
			int age, int region, String religion, int scholar, String job, int drink, int smoke) {
		super();
		this.userNo = userNo;
		this.gender = gender;
		this.hello = hello;
		this.height = height;
		this.shape = shape;
		this.style = style;
		this.age = age;
		this.region = region;
		this.religion = religion;
		this.scholar = scholar;
		this.job = job;
		this.drink = drink;
		this.smoke = smoke;
	}
	
	public UserInfo(int userNo, String gender, String hello, int height, String shape, String style,
			int region, String religion, int scholar, String job, int drink, int smoke) {
		super();
		this.userNo = userNo;
		this.gender = gender;
		this.hello = hello;
		this.height = height;
		this.shape = shape;
		this.style = style;
		this.region = region;
		this.religion = religion;
		this.scholar = scholar;
		this.job = job;
		this.drink = drink;
		this.smoke = smoke;
	}
	
	public UserInfo(int userNo, String hello, int height, String shape, String style,
			int region, String religion, int scholar, String job, int drink, int smoke) {
		super();
		this.userNo = userNo;
		this.hello = hello;
		this.height = height;
		this.shape = shape;
		this.style = style;
		this.region = region;
		this.religion = religion;
		this.scholar = scholar;
		this.job = job;
		this.drink = drink;
		this.smoke = smoke;
	}
	
	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getHello() {
		return hello;
	}

	public void setHello(String hello) {
		this.hello = hello;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public String getShape() {
		return shape;
	}

	public void setShape(String shape) {
		this.shape = shape;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getRegion() {
		return region;
	}

	public void setRegion(int region) {
		this.region = region;
	}

	public String getReligion() {
		return religion;
	}

	public void setReligion(String religion) {
		this.religion = religion;
	}

	public int getScholar() {
		return scholar;
	}

	public void setScholar(int scholar) {
		this.scholar = scholar;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public int getDrink() {
		return drink;
	}

	public void setDrink(int drink) {
		this.drink = drink;
	}

	public int getSmoke() {
		return smoke;
	}

	public void setSmoke(int smoke) {
		this.smoke = smoke;
	}

	public String[] getInterest() {
		return interest;
	}

	public void setInterest(String[] interest) {
		this.interest = interest;
	}

	@Override
	public String toString() {
		return "UserInfo [userNo=" + userNo + ", gender=" + gender + ", hello=" + hello + ", height=" + height
				+ ", shape=" + shape + ", style=" + style + ", age=" + age + ", region=" + region + ", religion="
				+ religion + ", scholar=" + scholar + ", job=" + job + ", drink=" + drink + ", smoke=" + smoke
				+ ", interest=" + Arrays.toString(interest) + "]";
	}
	
}
