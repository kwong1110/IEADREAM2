package coupleStory.bestCouple.model.dao;

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

import coupleStory.bestCouple.model.vo.BestCouple;

public class bestCoupleDAO {
	private Properties prop = new Properties();
	
	public bestCoupleDAO() {
		String fileName = bestCoupleDAO.class.getResource("/sql/coupleStory/bestCouple-query.properties").getPath();
		
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
		//getListCount=SELECT COUNT(*) FROM COUPLE_BEST
		
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
	
	public ArrayList selectBcList(Connection conn, int currentPage) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BestCouple> bcList = null;
		
		int posts = 3;
		
		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts -1;
		
		String query = prop.getProperty("selectBList");
		//SELECT * FROM BCLIST WHERE RNUM BETWEEN ? AND ?
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			bcList = new ArrayList<BestCouple>();
			
			while(rset.next()) {
				BestCouple bc = new BestCouple(rset.getInt("POST_NO"),
												rset.getString("TITLE"),
												rset.getDate("CREATE_DATE"),
												rset.getInt("HIT"),
												rset.getString("DELETE").charAt(0));
				
				bcList.add(bc);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return bcList;
	}


}
