package loveParty.partyReview.model.vo;

import java.sql.Date;

public class PartyReview {

	private int postNo;// 게시글 번호
	private int photoNo;
	private int partyNo;
	private int userNo;
	private String title;
	private String content;
	private Date createDate;
	private int hit;
	private char deleted;
	private int boardNo;
	private String changeName;
	
	public PartyReview() {}

	public PartyReview(int postNo, int photoNo, int partyNo, int userNo, String title, String content, Date createDate,
			int hit, char deleted, int boardNo, String changeName) {
		super();
		this.postNo = postNo;
		this.photoNo = photoNo;
		this.partyNo = partyNo;
		this.userNo = userNo;
		this.title = title;
		this.content = content;
		this.createDate = createDate;
		this.hit = hit;
		this.deleted = deleted;
		this.boardNo = boardNo;
		this.changeName = changeName;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
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

	public char getDeleted() {
		return deleted;
	}

	public void setDeleted(char deleted) {
		this.deleted = deleted;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}


}
