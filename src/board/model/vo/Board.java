package board.model.vo;

import java.sql.Date;

public class Board {
	private int boardNo; // 게시판 번호
	private int postNo; // 게시물 번호
	private int userNo;
	private String userId;
	private String title;
	private String content;
	private Date createDate;
	private int hit;
	private String deleted;
	private String category;
	private int partyNo; //파티 번호
	
	public Board() {}
	
	// 전체 생성자
	public Board(int boardNo, int postNo, int userNo, String userId, String title, String content, Date createDate,
			int hit, String deleted, String category) {
		super();
		this.boardNo = boardNo;
		this.postNo = postNo;
		this.userNo = userNo;
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.createDate = createDate;
		this.hit = hit;
		this.deleted = deleted;
		this.category = category;
	}
	
	// 1:1 문의게시판
	public Board(int boardNo, int postNo, int userNo, String userId, String title, String content, Date createDate,
			String deleted, String category) {
		super();
		this.boardNo = boardNo;
		this.postNo = postNo;
		this.userNo = userNo;
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.createDate = createDate;
		this.deleted = deleted;
		this.category = category;
	}
	// FAQ
	public Board(int boardNo, int postNo, String title, String content, String category) {
		super();
		this.boardNo = boardNo;
		this.postNo = postNo;
		this.title = title;
		this.content = content;
		this.category = category;
	}
	
	public Board(int postNo, String title, String content, String category) {
		super();
		this.postNo = postNo;
		this.title = title;
		this.content = content;
		this.category = category;
	}

	public Board(int postNo, String title, String category) {
		super();
		this.postNo = postNo;
		this.title = title;
		this.category = category;
	}

	// 파티 리뷰 1
	public Board(int boardNo, int postNo, int userNo, String userId, String title, String content, Date createDate,
			int hit, String deleted, int partyNo) {
		super();
		this.boardNo = boardNo;
		this.postNo = postNo;
		this.userNo = userNo;
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.createDate = createDate;
		this.hit = hit;
		this.deleted = deleted;
		this.partyNo = partyNo;
	}
	//파티 리뷰 2(리스트 뷰)
	public Board(int boardNo, int postNo, String userId, String title, Date createDate, int hit) {
		super();
		this.boardNo = boardNo;
		this.postNo = postNo;
		this.userId = userId;
		this.title = title;
		this.createDate = createDate;
		this.hit = hit;
	}
	
	// 베스트 커플
	public Board(int postNo, int userNo, String title, Date createDate, int hit) {
		super();
		this.postNo = postNo;
		this.userNo = userNo;
		this.title = title;
		this.createDate = createDate;
		this.hit = hit;
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
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPartyNo() {
		return partyNo;
	}

	public void setPartyNo(int partyNo) {
		this.partyNo = partyNo;
	}
	
	
}
