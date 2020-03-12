package idealType.controller;

import static common.JDBCTemplate.getConnection;

import java.io.IOException;
import java.sql.Connection;
import java.util.Arrays;

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

		String page = null;
		if(true) {
			page = "views/idealType/userPreferStatistics.jsp";
			request.setAttribute("height", height);
			
			request.setAttribute("hval", hval);
			request.setAttribute("hprop", hprop);
			
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
