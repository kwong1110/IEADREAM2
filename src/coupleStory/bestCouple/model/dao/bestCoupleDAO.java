package coupleStory.bestCouple.model.dao;

import static common.JDBCTemplate.*;


import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

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
}
