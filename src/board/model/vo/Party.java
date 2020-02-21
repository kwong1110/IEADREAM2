package board.model.vo;

import java.sql.Date;

public class Party {
	
	// board 기능
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
	
	// party 기능
	private int partyNo; //파티 번호
	private Date partyDate;
	private int mIn; // 남자 참여 인원수
	private int fIn; // 여자 참여 인원수
	private int maxIn; //최대 인원수
	
	
	public Party () {}

	// 전체생성자
	public Party(int boardNo, int postNo, int userNo, String userId, String title, String content, Date createDate,
			int hit, String deleted, String category, int partyNo, Date partyDate, int mIn, int fIn, int maxIn) {
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
		this.partyNo = partyNo;
		this.partyDate = partyDate;
		this.mIn = mIn;
		this.fIn = fIn;
		this.maxIn = maxIn;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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

	public Date getPartyDate() {
		return partyDate;
	}

	public void setPartyDate(Date partyDate) {
		this.partyDate = partyDate;
	}

	public int getmIn() {
		return mIn;
	}

	public void setmIn(int mIn) {
		this.mIn = mIn;
	}

	public int getfIn() {
		return fIn;
	}

	public void setfIn(int fIn) {
		this.fIn = fIn;
	}

	public int getMaxIn() {
		return maxIn;
	}

	public void setMaxIn(int maxIn) {
		this.maxIn = maxIn;
	}
	
	
	
	
}
