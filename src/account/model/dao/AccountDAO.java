package account.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import account.model.vo.Account;

public class AccountDAO {

	private Properties prop = new Properties();
	
	public AccountDAO() {
		String fileName = AccountDAO.class.getResource("/sql/account/account-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int updateAccount(Connection conn, Account account) {
		/* 내용물을 새로 넣어야하기 때문에 pstmt로 넣기 */
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateAccount");
		
		try {
			/* query문에 값 담아서 보내기 */
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, account.getPassword());
			pstmt.setString(2, account.getUserName());
			pstmt.setString(3, account.getPhone());
			pstmt.setString(4, account.getEmail());
			pstmt.setString(5, account.getId());
			
			/* DB수행 결과값 result에 담기 */
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int idCheck(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("idCheck");
		//SELECT COUNT(*) FROM ACCOUNT WHERE ID=?
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int insertAccount(Connection conn, Account a) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAccount");
		//INSERT INTO ACCOUNT VALUES(SEQ_ANO.NEXTVAL, DEFAULT, ?, ?, ?, ?, ?, ?, ?, DEFAULT)
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, a.getId());
			pstmt.setString(2, a.getPassword());
			pstmt.setString(3, a.getGender());
			pstmt.setString(4, a.getUserName());
			pstmt.setString(5, a.getPhone());
			pstmt.setString(6, a.getEmail());
			pstmt.setDate(7, a.getBirth());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public Account loginMember(Account account, Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Account loginUser = null;
		
		String query = prop.getProperty("loginUser");
		// loginUser=SELECT * FROM ACCOUNT WHERE ID=? AND PASSWORD=? AND DELETED='N'
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, account.getId());
			pstmt.setString(2, account.getPassword());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Account(rset.getInt("user_no"), 
									   rset.getInt("grade"), 
									   rset.getString("id"),
									   rset.getString("password"),
									   rset.getString("gender"),
									   rset.getString("user_name"),
									   rset.getString("phone"),
									   rset.getString("email"),
									   rset.getDate("birth"),
									   rset.getString("deleted"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("DAO : " + loginUser);
		return loginUser;
	}
}
