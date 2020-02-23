package board.model.vo;

public class BestCouple {
	private int postNo; // 게시물 번호
	private String mName; // 남자 이름
	private String fName; // 여자 이름
	private int dtPeriod; // 연애 기간
	private String fvDate; // 즐겨하는 데이트
	
	public BestCouple() {}

	public BestCouple(int postNo, String mName, String fName, int dtPeriod, String fvDate) {
		super();
		this.postNo = postNo;
		this.mName = mName;
		this.fName = fName;
		this.dtPeriod = dtPeriod;
		this.fvDate = fvDate;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public int getDtPeriod() {
		return dtPeriod;
	}

	public void setDtPeriod(int dtPeriod) {
		this.dtPeriod = dtPeriod;
	}

	public String getFvDate() {
		return fvDate;
	}

	public void setFvDate(String fvDate) {
		this.fvDate = fvDate;
	}
	
}
