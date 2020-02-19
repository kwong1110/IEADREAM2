package loveParty.partyReview.model.vo;

import java.sql.Date;

public class PartyReview {

	private int postNo;		// 게시글 번호
	private int partyNo;
	private int userNo;
	private String title;
	private String content;
	private Date createDate;
	private int hit;
	private String partyPhoto;
	private char deleted;
	
	public PartyReview() {}

	public PartyReview(int postNo, int partyNo, int userNo, String title, String content, Date createDate, int hit,
			String partyPhoto, char deleted) {
		this.postNo = postNo;
		this.partyNo = partyNo;
		this.userNo = userNo;
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
