package loveParty.partyReview.model.vo;

import java.sql.Date;

public class PartyReviewList {
	private int postNo;	
	private int partyNo;
	private String userName;
	private String title;
	private String content;
	private Date createDate;
	private int hit;
	private String partyPhoto;
	private char deleted;
	
	public PartyReviewList() {}

	public PartyReviewList(int postNo, int partyNo, String userName, String title, String content, Date createDate,
			int hit, String partyPhoto, char deleted) {
		super();
		this.postNo = postNo;
		this.partyNo = partyNo;
		this.userName = userName;
		this.title = title;
		this.content = content;
		this.createDate = createDate;
		this.hit = hit;
		this.partyPhoto = partyPhoto;
		this.deleted = deleted;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getPartyNo() {
		return partyNo;
	}

	public void setPartyNo(int partyNo) {
		this.partyNo = partyNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public String getPartyPhoto() {
		return partyPhoto;
	}

	public void setPartyPhoto(String partyPhoto) {
		this.partyPhoto = partyPhoto;
	}

	public char getDeleted() {
		return deleted;
	}

	public void setDeleted(char deleted) {
		this.deleted = deleted;
	}
	
	
}
