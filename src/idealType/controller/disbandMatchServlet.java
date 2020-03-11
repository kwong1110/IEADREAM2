package idealType.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import account.model.vo.Account;
import idealType.model.service.MatchService;
import idealType.model.vo.Match;

/**
 * Servlet implementation class sendHeartServlet
 */
@WebServlet("/disband.mc")
public class disbandMatchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public disbandMatchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int userNo = ((Account)request.getSession().getAttribute("loginUser")).getUserNo();
		int matchNo = Integer.parseInt(request.getParameter("matchNo"));

		MatchService ms = new MatchService();
		Match m = new Match();
		m.setUserNo(userNo);
		m.setTargetNo(ms.getUncheckedMatchList(userNo)[matchNo].getTargetNo());
		m.setStatus("X");
		System.out.println(m.toString());
		int result = ms.updateMatch(m);
		
		String page = null;
		if(result > 0) {
			page = "/get.mc";
			request.setAttribute("matchNo", matchNo);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "매치 업데이트에 실패하였습니다.");
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
