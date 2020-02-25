package idealType.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import account.model.dao.UserInfoDAO;
import account.model.vo.UserInfo;
import idealType.model.dao.IdealTypeDAO;
import idealType.model.vo.Match;


public class MatchService {
	
	/* public double getSync() { 일치율 계산 알고리즘 예씨
		
		private double maxPoint;
		private double syncPoint;
		private int numberOfInterests;
		
		MaxPoint = pre.heightPRI + pre.shapePRI + stylePRI + agePRI + religionPRI + scholarPRI + jobPRI + drinkPRI + smokePRI + interestPRI;
		SyncPoint = 0;
		
		if (rec.height == pre.height) {syncPoint += pre.heightPRI;}
		else (rec.height >= pre.height - 1 && rec.height <= pre.height+1){syncPoint += 0.5*pre.heightPRI;}
		if (rec.shape == pre.shape) {syncPoint += pre.shapePRI;}
		if (rec.style == pre.style) {syncPoint += pre.stylePRI;}
		
		if (rec.age == pre.age) {syncPoint += pre.agePRI;}
		
		if (rec.religion == pre.religion) {syncPoint += pre.religionPRI;}
		if (rec.scholar == pre.scholar) {syncPoint += pre.scholarPRI;}
		if (rec.job == pre.job) {syncPoint += pre.jobPRI;}
		if (rec.drink == pre.drink) {syncPoint += pre.drinkPRI;}
		if (rec.smoke == pre.smoke) {syncPoint += pre.smokePRI;}
		
		foreach () {
			if (rec.interest == pre.interest) {syncPoint += pre.interestPRI/numberOfInterests;}
		}
		return syncPoint/maxPoint;
	}
	*/
	
	/*
		선형 방식?
		매칭 후에도 데이터는 유지됨
		
	 */
	public int insertMatch(Match m) {
		Connection conn = getConnection();
		MatchAO mDAO = new MatchDAO();
		int result = mDAO.insertMatch(conn, m);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int updateMatch(Match m) {
		Connection conn = getConnection();
		MatchDAO mDAO = new MatchDAO();
		int result = mDAO.updateMatch(conn, m);

		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}