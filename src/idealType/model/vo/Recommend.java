package idealType.model.vo;

import java.util.Date;


public class Recommend {
	private int userNo;			
	private int targetNo;		
	private Date RecommendDate;		
	private char status;	

	public Recommend(int userNo, int targetNo, Date RecommendDate, char status) {
		this.userNo = userNo;
		this.targetNo = targetNo;
		this.RecommendDate = RecommendDate;
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

	public Date getRecommendDate() {
		return RecommendDate;
	}

	public void setRecommendDate(Date RecommendDate) {
		this.RecommendDate = RecommendDate;
	}

	public void setStatus(char status) {
		this.status = status;
	}
	
	public char getStatus() {
		return status;
	}



	
	
	


}

