package coupleStory.bestCouple.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.ResultSet;
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
	
public ArrayList selectBcList() {
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<BestCouple> list = null;
		
		String query = prop.getProperty("selectBList");
		
		
		
		
		return null;
	}
}
