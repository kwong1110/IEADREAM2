package loveParty.partyReview.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import loveParty.partyReview.model.vo.PartyReviewList;

public class PartyReviewDAO {
	private Properties prop = new Properties();
	
	public PartyReviewDAO() {
		String fileName = PartyReviewDAO.class.getResource("/sql/loveParty/partyReview-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return result;
	}
	
	public ArrayList<PartyReviewList> selectList(Connection conn, int currentPage) {
		PreparedStatement pstmt = null;
		ArrayList<PartyReviewList> list = null;
		ResultSet rset = null;
		int posts = 10;
		
		int startRow = (currentPage -1)*posts + 1;
		int endRow = startRow + posts -1;
		
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			list = new ArrayList<PartyReviewList>();
			rset = pstmt.executeQuery();
			while(rset.next()) {
				 list.add(new PartyReviewList(rset.getInt("POST_NO"), 
			 					rset.getInt("PARTY_NO"),
			 					  rset.getString("user_name"),
								  rset.getString("title"), 
								  rset.getString("content"),
								  rset.getDate("create_date"), 
								  rset.getInt("hit"),
								  rset.getString("PARTY_PHOTO"),
								  rset.getString("deleted").charAt(0)));
				 	System.out.println(list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<PartyReviewList> selectImage(Connection conn, int postNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<PartyReviewList> list = null;
		
		String query = prop.getProperty("selectImage");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			
			rs = pstmt.executeQuery();
			list = new ArrayList<PartyReviewList>();
			
			while(rs.next()) {
				PartyReviewList prl = new PartyReviewList();
				prl.setPostNo(rs.getInt("postNo"));
				prl.setPartyNo(rs.getInt("partyNo"));
				prl.setUserName(rs.getString("userName"));
				prl.setTitle(rs.getString("title"));
				prl.setContent(rs.getString("content"));
				prl.setCreateDate(rs.getDate("createDate"));
				prl.setHit(rs.getInt("hit"));
				prl.setPartyPhoto(rs.getString("partyPhoto"));
				prl.setDeleted(rs.getString("deleted").charAt(0));
			list.add(prl);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	
}
