package myPage.user.model.vo;

import java.sql.Date;

public class Match {

	private int userNo;
	private int targetNo;
	private String matchStatus;
	private Date matchDate;
	private char matchDelete;
	
	public Match() {}

	public Match(int userNo, int targetNo, String matchStatus, Date matchDate, char matchDelete) {
		this.userNo = userNo;
		this.targetNo = targetNo;
		this.matchStatus = matchStatus;
		this.matchDate = matchDate;
		this.matchDelete = matchDelete;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getTargetNo() {
		return targetNo;
	}

	public void setTargetNo(int targetNo) {
		this.targetNo = targetNo;
	}

	public String getMatchStatus() {
		return matchStatus;
	}

	public void setMatchStatus(String matchStatus) {
		this.matchStatus = matchStatus;
	}

	public Date getMatchDate() {
		return matchDate;
	}

	public void setMatchDate(Date matchDate) {
		this.matchDate = matchDate;
	}

	public char getMatchDelete() {
		return matchDelete;
	}

	public void setMatchDelete(char matchDelete) {
		this.matchDelete = matchDelete;
	}
	
	
	
}
