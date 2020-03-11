package account.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import account.model.vo.Account;
import account.model.vo.UserInfo;
import account.model.vo.UserPhoto;

public class UserInfoDAO {

	private Properties prop = new Properties();
	
	public UserInfoDAO() {
		String fileName = UserInfoDAO.class.getResource("/sql/account/account-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public Account selectAccount(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Account ac = null;
		String query = prop.getProperty("selectAccount");
		try	{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ac = new Account();
				ac.setUserNo(userNo);
				ac.setGrade(rs.getInt("GRADE"));
				ac.setId(rs.getString("ID"));
				ac.setGender(rs.getString("GENDER"));
				ac.setUserName(rs.getString("USER_NAME"));
				ac.setPhone(rs.getString("PHONE"));
				ac.setEmail(rs.getString("EMAIL"));
				ac.setBirth(rs.getDate("BIRTH"));
			}
		}catch(Exception e) { 
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return ac;
	}
	
	public int getUserAge(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = prop.getProperty("getUserAge");
		int age = 0;
		try	{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
			age = (rs.getInt("AGE"));
			}
		}catch(Exception e) { 
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return age;
	}
	
	public int getUserNo(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = prop.getProperty("getUserNo");
		int userNo = 0;
		try	{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
			userNo = (rs.getInt("USER_NO"));
			}
		}catch(Exception e) { 
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return userNo;
	}
	
	public UserInfo selectUserInfo(Connection conn, int usNo) {
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		UserInfo ui = new UserInfo();
		String query = prop.getProperty("selectUserInfo");
		int userNo = usNo;
		try {
			  pstmt = conn.prepareStatement(query);
			  pstmt.setInt(1, userNo);
			  rs = pstmt.executeQuery();
			  if(rs.next()) {
			  	ui.setUserNo(userNo);
			  	ui.setHello(rs.getString("HELLO"));
				ui.setHeight(rs.getInt("HEIGHT"));
				ui.setShape(rs.getString("SHAPE"));
				ui.setStyle(rs.getString("STYLE"));
				ui.setRegion(rs.getInt("REGION"));
				ui.setReligion(rs.getString("RELIGION"));
				ui.setScholar(rs.getInt("SCHOLAR"));
				ui.setJob(rs.getString("JOB"));
				ui.setDrink(rs.getInt("DRINK"));
				ui.setSmoke(rs.getInt("SMOKE"));
			  }
		  } catch (SQLException e) { 
			  e.printStackTrace(); 
		  } finally {
			close(rs);
			close(pstmt);
		  }
		System.out.println("DAO 체크 : " + ui.toString());
		return ui;
	}
	
	public int insertUserInfo(Connection conn, UserInfo ui) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertUserInfo");
		int result= 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, ui.getUserNo());
			pstmt.setString(2, ui.getHello());
			pstmt.setInt(3, ui.getHeight());
			pstmt.setString(4, ui.getShape());
			pstmt.setString(5, ui.getStyle());
			pstmt.setInt(6, ui.getRegion());
			pstmt.setString(7, ui.getReligion());
			pstmt.setInt(8,ui.getScholar());
			pstmt.setString(9, ui.getJob());
			pstmt.setInt(10, ui.getDrink());
			pstmt.setInt(11, ui.getSmoke());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}
	public int updateUserInfo(Connection conn, UserInfo ui) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateUserInfo");
		int result= 0;
		
		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, ui.getHello());
			pstmt.setInt(2, ui.getHeight());
			pstmt.setString(3, ui.getShape());
			pstmt.setString(4, ui.getStyle());
			pstmt.setInt(5, ui.getRegion());
			pstmt.setString(6, ui.getReligion());
			pstmt.setInt(7,ui.getScholar());
			pstmt.setString(8, ui.getJob());
			pstmt.setInt(9, ui.getDrink());
			pstmt.setInt(10, ui.getSmoke());
			pstmt.setInt(11, ui.getUserNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public String[] selectInterest(Connection conn, int userNo) {
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		String query = prop.getProperty("selectInterest");
		ArrayList<String> list = new ArrayList<String>();
		try {
			  pstmt = conn.prepareStatement(query);
			  pstmt.setInt(1, userNo);
			  rs = pstmt.executeQuery();
			  while(rs.next()) {list.add(rs.getString("INTEREST"));}
		  } catch (SQLException e) { 
			  e.printStackTrace(); 
		  } finally {
			close(rs);
			close(pstmt);
		  }
		String[] interest = new String[list.size()];
		  int size=0;
		  for(String temp : list){
		    interest[size++] = temp;
		  }
		return interest;
	}
	
	public int insertInterest(Connection conn, UserInfo ui) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertInterest");
		int result = 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			
			for(int i = 0; i < ui.getInterest().length; i++) {
				pstmt.setString(1, ui.getInterest()[i]);
				pstmt.setInt(2, ui.getUserNo());
				int r = pstmt.executeUpdate();
				if (r < 0 ) { result  = -1;}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteInterest(Connection conn, UserInfo ui) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteInterest");
		int result= 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, ui.getUserNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public UserPhoto selectUserPhoto(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		UserPhoto p = new UserPhoto();
		String query = prop.getProperty("selectPhoto");
		try {
			pstmt = conn.prepareStatement(query);
      
			pstmt.setInt(1,userNo);
      
			rset = pstmt.executeQuery();
			if(rset.next()) {
				p.setPhotoNo(rset.getInt("PHOTO_NO"));
				p.setUserNo(rset.getInt("USER_NO"));
				p.setOriginName(rset.getString("ORIGIN_NAME"));
				p.setChangeName(rset.getString("CHANGE_NAME"));
				p.setFilePath(rset.getString("FILE_PATH"));
				p.setFileLevel(rset.getInt("FILE_LEVEL"));
				p.setDeleted(rset.getString("DELETED"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
	}
	public int insertPhoto(Connection conn, UserPhoto p) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertPhoto");
		int result= 0;
		
		try {
			pstmt = conn.prepareStatement(query);
//insertPhoto=INSERT INTO USER_PHOTO VALUES(SEQ_PHOTONO.NEXTVAL, ?, ?, ?, ?, 0, DEFAULT)

			pstmt.setInt(1,p.getUserNo());
			pstmt.setString(2, p.getOriginName());
			pstmt.setString(3, p.getChangeName());
			pstmt.setString(4, p.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int deletePhoto(Connection conn, UserPhoto p) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("deletePhoto");
		int result= 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, p.getUserNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int[] searchUserNoList(Connection conn, String gender) {
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		String query = prop.getProperty("searchUserNoList");
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		try {
			  pstmt = conn.prepareStatement(query);
			  pstmt.setString(1, gender);
			  
			  rs = pstmt.executeQuery();
			  while(rs.next()) {
				  list.add(rs.getInt("USER_NO"));
			  }
		  } catch (SQLException e) {
			  e.printStackTrace(); 
		  } finally {
			close(rs);
			close(pstmt);
		  }
		int[] rList = new int[list.size()];
	    for (int i=0; i < rList.length; i++)
	    {
	    	rList[i] = list.get(i).intValue();
	    	// System.out.println("반대성별 유저 리스트 확인 : " + rList[i]);
	    }
		return rList;
	}
	
}
