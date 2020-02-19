package account.model.vo;

public class UserPrefer {

	// PRI는 비중.
	private int userNo;
	private String height;		// 키
	private int heightPRI;
	private String shape;		// 체형
	private int shapePRI;
	private String style;		// 스타일
	private int stylePRI;
	private int age;			// 나이
	private int agePRI;
	private String region;		// 거주지역
	private int regionPRI;
	private String religion;	// 종교
	private int religionPRI;
	private String scholar;		// 학력
	private int scholarPRI;
	private String job;			// 직업
	private int jobPRI;
	private String drink;		// 음주
	private int drinkPRI;
	private String smoke;		// 흡연
	private int smokePRI;
	private int interestPRI;	// 관심분야
	
	public UserPrefer() {}
	
	public UserPrefer(int userNo, String height, int heightPRI, String shape, int shapePRI, String style,
			int stylePRI, int age, int agePRI, String region, int regionPRI, String religion, int religionPRI,
			String scholar, int scholarPRI, String job, int jobPRI, String drink, int drinkPRI, String smoke,
			int smokePRI, int interestPRI) {
		this.userNo = userNo;
		this.height = height;
		this.heightPRI = heightPRI;
		this.shape = shape;
		this.shapePRI = shapePRI;
		this.style = style;
		this.stylePRI = stylePRI;
		this.age = age;
		this.agePRI = agePRI;
		this.region = region;
		this.regionPRI = regionPRI;
		this.religion = religion;
		this.religionPRI = religionPRI;
		this.scholar = scholar;
		this.scholarPRI = scholarPRI;
		this.job = job;
		this.jobPRI = jobPRI;
		this.drink = drink;
		this.drinkPRI = drinkPRI;
		this.smoke = smoke;
		this.smokePRI = smokePRI;
		this.interestPRI = interestPRI;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public int getHeightPRI() {
		return heightPRI;
	}
	public void setHeightPRI(int heightPRI) {
		this.heightPRI = heightPRI;
	}
	public String getShape() {
		return shape;
	}
	public void setShape(String shape) {
		this.shape = shape;
	}
	public int getShapePRI() {
		return shapePRI;
	}
	public void setShapePRI(int shapePRI) {
		this.shapePRI = shapePRI;
	}
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
	public int getStylePRI() {
		return stylePRI;
	}
	public void setStylePRI(int stylePRI) {
		this.stylePRI = stylePRI;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getAgePRI() {
		return agePRI;
	}
	public void setAgePRI(int agePRI) {
		this.agePRI = agePRI;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public int getRegionPRI() {
		return regionPRI;
	}
	public void setRegionPRI(int regionPRI) {
		this.regionPRI = regionPRI;
	}
	public String getReligion() {
		return religion;
	}
	public void setReligion(String religion) {
		this.religion = religion;
	}
	public int getReligionPRI() {
		return religionPRI;
	}
	public void setReligionPRI(int religionPRI) {
		this.religionPRI = religionPRI;
	}
	public String getScholar() {
		return scholar;
	}
	public void setScholar(String scholar) {
		this.scholar = scholar;
	}
	public int getScholarPRI() {
		return scholarPRI;
	}
	public void setScholarPRI(int scholarPRI) {
		this.scholarPRI = scholarPRI;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public int getJobPRI() {
		return jobPRI;
	}
	public void setJobPRI(int jobPRI) {
		this.jobPRI = jobPRI;
	}
	public String getDrink() {
		return drink;
	}
	public void setDrink(String drink) {
		this.drink = drink;
	}
	public int getDrinkPRI() {
		return drinkPRI;
	}
	public void setDrinkPRI(int drinkPRI) {
		this.drinkPRI = drinkPRI;
	}
	public String getSmoke() {
		return smoke;
	}
	public void setSmoke(String smoke) {
		this.smoke = smoke;
	}
	public int getSmokePRI() {
		return smokePRI;
	}
	public void setSmokePRI(int smokePRI) {
		this.smokePRI = smokePRI;
	}
	public int getInterestPRI() {
		return interestPRI;
	}
	public void setInterestPRI(int interestPRI) {
		this.interestPRI = interestPRI;
	}
}
