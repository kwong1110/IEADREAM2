package coupleStory.weAreCouple.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;


public class weAreCoupleDAO {

	private Properties prop = new Properties();
	
	public weAreCoupleDAO() {
		String fileName = weAreCoupleDAO.class.getResource("/sql/coupleStory/weAreCouple-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
