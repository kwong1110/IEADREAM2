package loveParty.loveParty.model.vo;

import java.sql.Date;

public class Party {
	
	private int partyNo;
	private String title;
	private Date partyDate;
	private int mIn;	// 남자 참여
	private int fIn;	// 여자 참여
	private int maxIn;
	private String thumb;
	private String poster;
	
	public Party() {}

	public Party(int partyNo, String title, Date partyDate, int mIn, int fIn, int maxIn, String thumb, String poster) {
		this.partyNo = partyNo;
		this.title = title;
		this.partyDate = partyDate;
		this.mIn = mIn;
		this.fIn = fIn;
		this.maxIn = maxIn;
		this.thumb = thumb;
		this.poster = poster;
	}

	public int getPartyNo() {
		return partyNo;
	}

	public void setPartyNo(int partyNo) {
		this.partyNo = partyNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getThumb() {
		return thumb;
	}

	public void setThumb(String thumb) {
		this.thumb = thumb;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}
}
