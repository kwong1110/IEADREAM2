package questionBoard.question.model.vo;

import java.sql.Date;

public class Question {

	private int postNo;
	private int userNo;
	private String category;
	private Date createDate;
	private String title;
	private String content;
	private char answerChecked;
	private String answerContent;
	private Date answerDate;
	private char deleted;
	
	public Question(){}

	public Question(int postNo, int userNo, String category, Date createDate, String title, String content,
			char answerChecked, String answerContent, Date answerDate, char deleted) {
		this.postNo = postNo;
		this.userNo = userNo;
		this.category = category;
		this.createDate = createDate;
		this.title = title;
		this.content = content;
		this.answerChecked = answerChecked;
		this.answerContent = answerContent;
		this.answerDate = answerDate;
		this.deleted = deleted;
	}

	


	public Question(char answerChecked, String answerContent, Date answerDate) {
		super();
		this.answerChecked = answerChecked;
		this.answerContent = answerContent;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public char getAnswerChecked() {
		return answerChecked;
	}
	
	public void setAnswerChecked(char answerChecked) {
		this.answerChecked = answerChecked;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public Date getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(Date answerDate) {
		this.answerDate = answerDate;
	}

	public char getDeleted() {
		return deleted;
	}

	public void setDeleted(char deleted) {
		this.deleted = deleted;
	}

	
	
}
