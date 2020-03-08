package idealType.controller;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import account.model.service.UserService;
import account.model.vo.Account;
import account.model.vo.UserInfo;
import idealType.model.dao.MatchDAO;
import idealType.model.service.MatchService;
import idealType.model.vo.Match;

/**
 * Servlet implementation class getMatchListServlet
 */
@WebServlet("/get.mc")
public class getMatchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getMatchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		MatchService ms = new MatchService();
		UserService us = new UserService();
		
		int userNo = ((Account)request.getSession().getAttribute("loginUser")).getUserNo();
		int matchNo = 0;
		if (request.getAttribute("matchNo") != null) {matchNo = (int)request.getAttribute("matchNo");}
		
		Match[] mlist = ms.getUncheckedMatchList(userNo);
		
		int targetNo = ms.getMatchList(userNo)[matchNo].getTargetNo();
		int sync = (int)Math.round(100*ms.getMatchList(userNo)[matchNo].getSync());
		String pPath = us.selectUserPhoto(targetNo).getFilePath();
		
		Account ac = us.selectAccount(targetNo);
		UserInfo ui = us.selectUserInfo(targetNo);
		
		Match m = new Match();
		m.setUserNo(userNo);
		m.setTargetNo(targetNo);
		m.setStatus("C");
		ms.updateMatch(m);
		
		
		String page = null;
		if(ui != null) {
			page = "views/idealType/idealTypeMatch.jsp";
			request.setAttribute("ui", ui);
			request.setAttribute("ac", ac);
			request.setAttribute("sync", sync);
			request.setAttribute("pPath", pPath);
			request.setAttribute("matchNo", matchNo);
			request.setAttribute("maxMatchNo", mlist.length);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "매칭 조회에 실패하였습니다.");
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
