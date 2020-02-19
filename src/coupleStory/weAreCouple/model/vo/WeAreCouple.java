package coupleStory.weAreCouple.model.vo;

import java.sql.Date;

public class WeAreCouple {

	private int postNo;
	private int userNo;
	private String title;
	private String content;
	private Date createDate;
	private int hit;
	private char deleted;
	
	public WeAreCouple() {}

	public WeAreCouple(int postNo, int userNo, String title, String content, Date createDate, int hit, char deleted) {
		this.postNo = postNo;
		this.userNo = userNo;
		this.title = title;
		this.content = content;
		this.createDate = createDate;
		this.hit = hit;
		this.deleted = deleted;
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

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public char getDeleted() {
		return deleted;
	}

	public void setDeleted(char deleted) {
		this.deleted = deleted;
	}	
}
