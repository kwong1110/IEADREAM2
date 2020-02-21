package board.model.vo;

import java.sql.Date;

public class Reply {
	private int postNo; // 답변이 달릴 글 번호
	private int userNo;
	private int userId;
	private String answerContent; // 답변 내용
	private String answerChecked; // 답변 여부
	private Date answerDate; //답변 날짜
	
	// 전체생성자
	public Reply(int postNo, int userNo, int userId, String answerContent, String answerChecked, Date answerDate) {
		super();
		this.postNo = postNo;
		this.userNo = userNo;
		this.userId = userId;
		this.answerContent = answerContent;
		this.answerChecked = answerChecked;
		this.answerDate = answerDate;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public String getAnswerChecked() {
		return answerChecked;
	}

	public void setAnswerChecked(String answerChecked) {
		this.answerChecked = answerChecked;
	}

	public Date getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(Date answerDate) {
		this.answerDate = answerDate;
	}
	
	
}
