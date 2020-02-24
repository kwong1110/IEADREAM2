package account.model.vo;

public class UserInterest {
	private int userNo;
	private String interest;
	
	public UserInterest() {}

	public UserInterest(int userNo, String interest) {
		this.userNo = userNo;
		this.interest = interest;
	}
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	
	
}