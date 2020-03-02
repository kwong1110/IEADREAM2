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
		} finally {
			close(rset);
			close(pstmt);
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
		
		String query = prop.getProperty("loginUserPW");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, account.getId());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				if(rset.getString("password").equals(account.getPassword())) {
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
				}else {
					loginUser = new Account(account.getId(),"비밀번호 불일치");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		// System.out.println("DAO : " + loginUser);
		
		return loginUser;
	}

	
	// 아이디 찾기 DAO	
	public Account searchId(Connection conn, Account findUser) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Account a = null;
		
		String query = prop.getProperty("searchId");
		//SELECT ID FROM ACCOUNT WHERE USER_NAME=? AND EMAIL=? AND DELETED='N'
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, findUser.getUserName());
			pstmt.setString(2, findUser.getEmail());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				a = new Account(rset.getString("ID"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return a;
	}
	
	
	//비밀번호 찾기 DAO
	public Account searchPwd(Connection conn, Account account){
		Account result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("searchpwd");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, account.getId());
			pstmt.setString(2, account.getPassword());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = new Account();
				result.setPassword(rset.getString("password"));
				
			}
			
		}catch(Exception e) { 
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public String searchPwd(Account account, Connection conn) {
		// TODO Auto-generated method stub
		return null;
	}

	public Account selectMyProfile(Connection conn, String loginId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Account account = null;
		
		String query = prop.getProperty("selectMyProfile");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, loginId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				account = new Account(rs.getInt("user_no"),
									  rs.getInt("grade"),
									  rs.getString("id"),
									  rs.getString("password"),
									  rs.getString("gender"),
									  rs.getString("user_name"),
									  rs.getString("phone"),
									  rs.getString("email"),
									  rs.getDate("birth"),
									  rs.getString("deleted"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return account;
	}

	public int updateAccount(Connection conn, Account account) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateAccount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, account.getPassword());
			pstmt.setString(2, account.getUserName());
			pstmt.setString(3, account.getPhone());
			pstmt.setString(4, account.getEmail());
			pstmt.setString(5, account.getId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteAccount(Connection conn, String id) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteAccount");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, id);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int emailCheck(Connection conn, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("emailCheck");
		//SELECT COUNT(*) FROM ACCOUNT WHERE EMAIL=?
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return result;
	}

	
}
	

