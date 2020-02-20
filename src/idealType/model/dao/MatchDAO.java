package idealType.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import idealType.model.vo.Match;
import questionBoard.question.model.vo.Question;

public class MatchDAO {
	
	private Properties prop = new Properties();
	
	public MatchDAO() {
		String fileName = MatchDAO.class.getResource("/sql/idealType/idealType-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
}
