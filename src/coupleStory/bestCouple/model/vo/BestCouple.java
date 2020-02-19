package coupleStory.bestCouple.model.vo;

import java.sql.Date;

public class BestCouple {

	private int postNo;
	private String title;
	private String content;
	private Date createDate;
	private int hit;
	private char deleted;
	
	public BestCouple() {}

	public BestCouple(int postNo, String title, String content, Date createDate, int hit, char deleted) {
		this.postNo = postNo;
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
