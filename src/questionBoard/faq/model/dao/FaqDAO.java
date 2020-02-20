package questionBoard.faq.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import questionBoard.faq.model.vo.Faq;

public class FaqDAO {

	private Properties prop = new Properties();
	
	public FaqDAO() {
		String fileName = FaqDAO.class.getResource("/sql/questionBoard/faq-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Faq> selectList(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Faq> list = null;
		
		String query = prop.getProperty("selectFaqList");
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			list = new ArrayList<Faq>();
			
			while(rs.next()) {
				Faq faq = new Faq(rs.getInt("post_no"),
							  rs.getString("category"),
							  rs.getString("title"),
							  rs.getString("content"));
				list.add(faq);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return list;
	}

	public int faqInsert(Connection conn, Faq faq, String category) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("faqInsert");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, category);
			pstmt.setString(2, faq.getTitle());
			pstmt.setString(3, faq.getContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return result;
	}

	public ArrayList<Faq> selectAdminList(Connection conn, int currentPage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Faq> list = null;
		
		int posts = 10;
		
		int startRow = (currentPage -1) * posts + 1;
		int endRow = startRow + posts -1;
		
		String query = prop.getProperty("selectAdminList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			list = new ArrayList<Faq>();
			
			while(rs.next()) {
				Faq faq = new Faq(rs.getInt("post_no"),
								  rs.getString("category"),
								  rs.getString("title"));
				
				list.add(faq);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public Faq selectAdminDetail(Connection conn, int num) {
		PreparedStatement pstmt = null; //글 번호를 쿼리문에 넣어야 하기 때문에 pstmt 사용
		ResultSet rs = null;
		Faq faq = null;
		
		String query = prop.getProperty("selectAdminDetail");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				faq = new Faq(rs.getInt("post_no"),
							  rs.getString("category"),
							  rs.getString("title"),
							  rs.getString("content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return faq;
		
	}

}
