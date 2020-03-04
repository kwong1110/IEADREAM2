package idealType.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import account.model.vo.Account;
import idealType.model.service.MatchService;
import idealType.model.vo.Stat;

/**
 * Servlet implementation class getIdealStatisticsServlet
 */
@WebServlet("/get.ist")
public class getIdealStatisticsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getIdealStatisticsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = ((Account)request.getSession().getAttribute("loginUser")).getUserNo();
		MatchService mc = new MatchService();
		int[] list = mc.searchIdealList(userNo);
		Stat[][] st = mc.getIdealUpStat(list);
		
		
		String page = null;
		if(st != null) {
			page = "views/idealType/idealTypeStatistics.jsp";
			request.setAttribute("st", st);
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
