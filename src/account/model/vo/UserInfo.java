package account.model.vo;

public class UserInfo {

	private int userNo;
	private String thumb;		// 프로필 사진
	private String hello;		// 자기소개
	private String height;		// 키
	private String shape;		// 체형
	private String style;		// 스타일
	private String region;		// 거주지역
	private String religion;	// 종교
	private String scholar;		// 학력
	private String job;			// 직업
	private String drink;		// 음주
	private String smoke;		// 흡연
	
	public UserInfo() {}

	public UserInfo(int userNo, String thumb, String hello, String height, String shape, String style, String region,
			String religion, String scholar, String job, String drink, String smoke) {
		this.userNo = userNo;
		this.thumb = thumb;
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

	public String getThumb() {
		return thumb;
	}

	public void setThumb(String thumb) {
		this.thumb = thumb;
	}

	public String getHello() {
		return hello;
	}

	public void setHello(String hello) {
		this.hello = hello;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
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

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getReligion() {
		return religion;
	}

	public void setReligion(String religion) {
		this.religion = religion;
	}

	public String getScholar() {
		return scholar;
	}

	public void setScholar(String scholar) {
		this.scholar = scholar;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getDrink() {
		return drink;
	}

	public void setDrink(String drink) {
		this.drink = drink;
	}

	public String getSmoke() {
		return smoke;
	}

	public void setSmoke(String smoke) {
		this.smoke = smoke;
	}
}
