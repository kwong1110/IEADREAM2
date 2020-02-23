package board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.vo.Board;
import loveParty.partyReview.model.dao.PartyReviewDAO;
import loveParty.partyReview.model.vo.PartyReviewList;

public class PartyReviewService {

	public ArrayList<Board> selectList( int currentPage) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new PartyReviewDAO().selectList(conn,currentPage);
		close(conn);
		return list;
	}

	public int getListCount() {
		Connection conn = getConnection();
		int result = new PartyReviewDAO().getListCount(conn);
		close(conn);
		return result;
	}

	/*
	 * public ArrayList<Board> selectImage(int postNo) { Connection conn =
	 * getConnection(); ArrayList<Board> list = new
	 * PartyReviewDAO().selectImage(conn,postNo); return list; }
	 */

}
