package loveParty.partyReview.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import loveParty.partyReview.model.dao.PartyReviewDAO;
import loveParty.partyReview.model.vo.PartyReview;
import loveParty.partyReview.model.vo.PartyReviewList;

public class PartyReviewService {

	public ArrayList<PartyReviewList> selectList( int currentPage) {
		Connection conn = getConnection();
		
		ArrayList<PartyReviewList> list = new PartyReviewDAO().selectList(conn,currentPage);
		close(conn);
		return list;
	}

	public int getListCount() {
		Connection conn = getConnection();
		int result = new PartyReviewDAO().getListCount(conn);
		close(conn);
		return result;
	}

	public ArrayList<PartyReviewList> selectImage(int postNo) {
		Connection conn = getConnection();
		ArrayList<PartyReviewList> list = new PartyReviewDAO().selectImage(conn,postNo);
		return list;
	}

}
