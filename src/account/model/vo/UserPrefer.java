package account.model.vo;

import java.util.ArrayList;

public class UserPrefer {

	// Pri는 비중.
	private int userNo;
	private int height;		// 키
	private int heightPri;
	private String shape;		// 체형
	private int shapePri;
	private String style;		// 스타일
	private int stylePri;
	private int age;			// 나이
	private int agePri;
	private int region;		// 거주지역
	private int regionPri;
	private String religion;	// 종교
	private int religionPri;
	private int scholar;		// 학력
	private int scholarPri;
	private String job;			// 직업
	private int jobPri;
	private int drink;		// 음주
	private int drinkPri;
	private int smoke;		// 흡연
	private int smokePri;
	private int interestPri;	// 관심분야
	
	public UserPrefer() {}

	public UserPrefer(int userNo, int height, int heightPri, String shape, int shapePri, String style, int stylePri,
			int age, int agePri, int region, int regionPri, String religion, int religionPri, int scholar,
			int scholarPri, String job, int jobPri, int drink, int drinkPri, int smoke, int smokePri, int interestPri) {
		super();
		this.userNo = userNo;
		this.height = height;
		this.heightPri = heightPri;
		this.shape = shape;
		this.shapePri = shapePri;
		this.style = style;
		this.stylePri = stylePri;
		this.age = age;
		this.agePri = agePri;
		this.region = region;
		this.regionPri = regionPri;
		this.religion = religion;
		this.religionPri = religionPri;
		this.scholar = scholar;
		this.scholarPri = scholarPri;
		this.job = job;
		this.jobPri = jobPri;
		this.drink = drink;
		this.drinkPri = drinkPri;
		this.smoke = smoke;
		this.smokePri = smokePri;
		this.interestPri = interestPri;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getHeightPri() {
		return heightPri;
	}

	public void setHeightPri(int heightPri) {
		this.heightPri = heightPri;
	}

	public String getShape() {
		return shape;
	}

	public void setShape(String shape) {
		this.shape = shape;
	}

	public int getShapePri() {
		return shapePri;
	}

	public void setShapePri(int shapePri) {
		this.shapePri = shapePri;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public int getStylePri() {
		return stylePri;
	}

	public void setStylePri(int stylePri) {
		this.stylePri = stylePri;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getAgePri() {
		return agePri;
	}

	public void setAgePri(int agePri) {
		this.agePri = agePri;
	}

	public int getRegion() {
		return region;
	}

	public void setRegion(int region) {
		this.region = region;
	}

	public int getRegionPri() {
		return regionPri;
	}

	public void setRegionPri(int regionPri) {
		this.regionPri = regionPri;
	}

	public String getReligion() {
		return religion;
	}

	public void setReligion(String religion) {
		this.religion = religion;
	}

	public int getReligionPri() {
		return religionPri;
	}

	public void setReligionPri(int religionPri) {
		this.religionPri = religionPri;
	}

	public int getScholar() {
		return scholar;
	}

	public void setScholar(int scholar) {
		this.scholar = scholar;
	}

	public int getScholarPri() {
		return scholarPri;
	}

	public void setScholarPri(int scholarPri) {
		this.scholarPri = scholarPri;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public int getJobPri() {
		return jobPri;
	}

	public void setJobPri(int jobPri) {
		this.jobPri = jobPri;
	}

	public int getDrink() {
		return drink;
	}

	public void setDrink(int drink) {
		this.drink = drink;
	}

	public int getDrinkPri() {
		return drinkPri;
	}

	public void setDrinkPri(int drinkPri) {
		this.drinkPri = drinkPri;
	}

	public int getSmoke() {
		return smoke;
	}

	public void setSmoke(int smoke) {
		this.smoke = smoke;
	}

	public int getSmokePri() {
		return smokePri;
	}

	public void setSmokePri(int smokePri) {
		this.smokePri = smokePri;
	}

	public int getInterestPri() {
		return interestPri;
	}

	public void setInterestPri(int interestPri) {
		this.interestPri = interestPri;
	}

	

}
