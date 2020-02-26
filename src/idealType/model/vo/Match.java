package idealType.model.vo;

import java.util.Date;


public class Match {
	private int userNo;			
	private int targetNo;		
	private Date matchDate;		
	private String status;	

	public Match(int userNo, int targetNo, Date matchDate, String status) {
		this.userNo = userNo;
		this.targetNo = targetNo;
		this.matchDate = matchDate;
		this.status = status;
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

	public Date getMatchDate() {
		return matchDate;
	}

	public void setMatchDate(Date matchDate) {
		this.matchDate = matchDate;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getStatus() {
		return status;
	}



	
	
	


}

