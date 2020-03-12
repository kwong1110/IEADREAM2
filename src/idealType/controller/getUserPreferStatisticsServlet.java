package idealType.controller;

import static common.JDBCTemplate.getConnection;

import java.io.IOException;
import java.sql.Connection;
import java.util.Arrays;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import account.model.dao.UserInfoDAO;
import account.model.vo.Account;
import idealType.model.dao.MatchDAO;
import idealType.model.service.MatchService;
import idealType.model.vo.Stat;

/**
 * Servlet implementation class getIdealStatisticsServlet
 */
@WebServlet("/get.ups")
public class getUserPreferStatisticsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getUserPreferStatisticsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		int userNo = ((Account)request.getSession().getAttribute("loginUser")).getUserNo();
		MatchService mc = new MatchService();
		
		Connection conn = getConnection();
		MatchDAO mDAO = new MatchDAO();
		
		UserInfoDAO uiDAO = new UserInfoDAO();
		Account ac = uiDAO.selectAccount(conn, userNo);
		String gender = ac.getGender();
		
		String[] hval = new String[8];
		double[] hprop = new double[8];
		
		Stat[] height = mDAO.getUpProp(conn, "HEIGHT", gender);
		for (int i=0; i<height.length ; i++) {
		System.out.println("hProp" + mDAO.getUpProp(conn, "HEIGHT", gender)[i].getProp());
		 	hprop[i] = mDAO.getUpProp(conn, "HEIGHT", gender)[i].getProp();
		}
		*/
		/*
		Stat[] shape = mDAO.getUpProp(conn, "SHAPE", gender);
		Stat[] style = mDAO.getUpProp(conn, "STYLE", gender);
		Stat[] age = mDAO.getUpProp(conn, "AGE", gender);
		Stat[] religion = mDAO.getUpProp(conn, "RELIGION", gender);
		Stat[] drink = mDAO.getUpProp(conn, "DRINK", gender);
		Stat[] smoke = mDAO.getUpProp(conn, "SMOKE", gender);
		Stat[] job = mDAO.getUpProp(conn, "JOB", gender);
		Stat[] scholar = mDAO.getUpProp(conn, "SCHOLAR", gender);
		Stat[] region = mDAO.getUiProp(conn, "REGION", gender);
		Stat[] interest = mDAO.getInterestProp(conn, gender);
		

		int uic = mDAO.getUserInfoCount(conn, gender);
		int upc = mDAO.getUserPreferCount(conn, gender);
		
		for (int j=0; j< height.length; j++) { height[j].divProp(upc);}
		Arrays.sort(height);
		for (int j=0; j< shape.length; j++) { shape[j].divProp(upc);}
		Arrays.sort(shape);
		for (int j=0; j< style.length; j++) { style[j].divProp(upc);}
		Arrays.sort(style);
		for (int j=0; j< age.length; j++) { age[j].divProp(upc);}
		Arrays.sort(age);
		for (int j=0; j< religion.length; j++) { religion[j].divProp(upc);}
		Arrays.sort(religion);
		for (int j=0; j< drink.length; j++) { drink[j].divProp(upc);}
		Arrays.sort(drink);
		for (int j=0; j< smoke.length; j++) { smoke[j].divProp(upc);}
		Arrays.sort(smoke);
		for (int j=0; j< job.length; j++) { job[j].divProp(upc);}
		Arrays.sort(job);
		for (int j=0; j< scholar.length; j++) { scholar[j].divProp(upc);}
		Arrays.sort(scholar);
		for (int j=0; j< region.length; j++) { region[j].divProp(uic);}
		Arrays.sort(region);
		for (int j=0; j< interest.length; j++) { interest[j].divProp(uic);}
		Arrays.sort(interest);

		String[] hval = {"150", "155", "160", "165", "170", "175", "180", "185"};
		double[] hprop = {0.1, 0.1, 0.15, 0.15, 0.2, 0.2, 0.1, 0.1, 0.1};
		String[] shval = {"마름", "보통", "통통", "근육질"};
		double[] shprop = {0.3, 0.4, 0.05, 0.2, 0.05};
		String[] stval = {"귀여운", "지적인", "섹시한", "따뜻한", "우아한", "터프한"};
		double[] stprop = {0.2, 0.2, 0.2, 0.2, 0.1, 0.1, 0.1};
		String[] relval = {"기독교", "천주교", "불교", "무교", "기타"};
		double[] relprop = {0.2, 0.2, 0.1, 0.45, 0.05};
		String[] dval = {"3", "2", "1", "0"};
		double[] dprop = {0.1, 0.2, 0.4, 0.3};
		String[] sval = {"1", "0"};
		double[] sprop = {0.2, 0.8};
		String[] jval = {"학생", "사무직", "연구직", "교육직", "예술", "서비스", "전문직", "기타"};
		double[] jprop = {0.3, 0.05, 0.05, 0.1, 0.2, 0.05, 0.2, 0.05};
		String[] scval = {"0", "2", "4", "6", "8"};
		double[] scprop = {0.1, 0.05, 0.6, 0.15, 0.1};
		String[] reval = {"11", "12", "13", "20", "31,", "32", "33", "41", "42", "43", "51", "52", "53", "54", "55", "60"};
		double[] reprop = {0.2, 0.1, 0.3, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.15, 0.1, 0.05, 0.05};
		String[] ival = {"movie", "musical", "comic", "picture", "books", "music",
                "sing", "instrurment", "cook", "camp", "exercise", "sports",
                "vgame", "bgame", "sns", "drink", "beauty", "pet", "diy", "money"};
		double[] iprop = {0.2, 0.1, 0.1, 0.1, 0.4, 0.4, 0.1, 0.1, 0.1, 0.1, 0.2, 0.2, 0.2, 0.1, 0.1, 0.2, 0.2, 0.2, 0.2, 0.1};
		*/
		String page = null;
		if(true) {
			page = "views/idealType/userPreferStatistics.jsp";
		/*
			request.setAttribute("hval", hval);
			request.setAttribute("hprop", hprop);
			request.setAttribute("shval", shval);
			request.setAttribute("shprop", shprop);
			request.setAttribute("stval", stval);
			request.setAttribute("stprop", stprop);
			request.setAttribute("relval", relval);
			request.setAttribute("relprop", relprop);
			request.setAttribute("dval", dval);
			request.setAttribute("dprop", dprop);
			request.setAttribute("sval", sval);
			request.setAttribute("sprop", sprop);
			request.setAttribute("jval", jval);
			request.setAttribute("jprop", jprop);
			request.setAttribute("scval", scval);
			request.setAttribute("scprop", scprop);
			request.setAttribute("reval", reval);
			request.setAttribute("reprop", reprop);
			request.setAttribute("ival", ival);
			request.setAttribute("iprop", iprop);
		
			request.setAttribute("height", height);
			request.setAttribute("shape", shape);
			request.setAttribute("style", style);
			request.setAttribute("age", age);
			request.setAttribute("religion", religion);
			request.setAttribute("drink", drink);
			request.setAttribute("smoke", smoke);
			request.setAttribute("job", job);
			request.setAttribute("scholar", scholar);
			request.setAttribute("region", region);
			request.setAttribute("interest", interest);
		*/
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "통계 조회에 실패하였습니다.");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
