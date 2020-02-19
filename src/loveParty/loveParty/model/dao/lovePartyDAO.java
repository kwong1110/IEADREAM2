package loveParty.loveParty.model.dao;

import static common.JDBCTemplate.*;


import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class lovePartyDAO {
	private Properties prop = new Properties();
	
	public lovePartyDAO() {
		String fileName = lovePartyDAO.class.getResource("/sql/loveParty/loveParty-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
