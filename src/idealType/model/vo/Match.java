package idealType.model.vo;

import java.sql.Date;

public class Match implements Comparable<Match>{
	private int userNo;			
	private int targetNo;
	private Date matchDate;		
	private String status;
	private double sync;
	private double rsync;

	public Match() {}

	

	public Match(int userNo, int targetNo, Date matchDate, String status, double sync, double rsync) {
		super();
		this.userNo = userNo;
		this.targetNo = targetNo;
		this.matchDate = matchDate;
		this.status = status;
		this.sync = sync;
		this.rsync = rsync;
	}



	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getTargetNo() {
		return targetNo;
	}

	public void setTargetNo(int targetNo) {
		this.targetNo = targetNo;
	}

	public Date getMatchDate() {
		return matchDate;
	}

	public void setMatchDate(Date matchDate) {
		this.matchDate = matchDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public double getSync() {
		return sync;
	}

	public void setSync(double sync) {
		this.sync = sync;
	}

	public double getRsync() {
		return rsync;
	}

	public void setRsync(double rsync) {
		this.rsync = rsync;
	}

	@Override
	public int compareTo(Match m) {
		double sync1 = this.getSync();
		double sync2 = m.getSync();
		if (sync1 == sync2)
			return 0;
		else if (sync1 > sync2)
			return 1;
		else
			return -1;
	}

	@Override
	public String toString() {
		return "Match [userNo=" + userNo + ", targetNo=" + targetNo + ", matchDate=" + matchDate + ", status=" + status
				+ ", sync=" + sync + ", rsync=" + rsync + "]";
	}

}

