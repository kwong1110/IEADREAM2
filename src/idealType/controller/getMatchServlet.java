package idealType.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import account.model.service.UserService;
import account.model.vo.*;
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
		HttpSession session = request.getSession();
		
		MatchService ms = new MatchService();
		UserService us = new UserService();
		
		Account loginUser = (Account)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		System.out.println("servlet userNo: " + userNo);
		
		int matchNo = 0;
		if (request.getAttribute("matchNo") != null) {matchNo = (int)request.getAttribute("matchNo");}
		
		Match m = new Match(); 
		m =	ms.getUncheckedMatchList(userNo)[matchNo];
		
		int targetNo = m.getTargetNo();
		
		int sync = (int)Math.round(100*m.getSync());
		
		UserPhoto p = us.selectUserPhoto(targetNo);
		String pPath = p.getFilePath();
		
		Account ta = us.selectAccount(targetNo);
		UserInfo ti = us.selectUserInfo(targetNo);
		System.out.println(ti.toString());
		
		m.setStatus("C");
		ms.updateMatch(m);
		
		String page = null;
		if(ti.getHello() != null) {
			page = "views/idealType/idealTypeMatch.jsp";
			request.setAttribute("ti", ti);
			request.setAttribute("ta", ta);
			request.setAttribute("sync", sync);
			request.setAttribute("pPath", pPath);
			request.setAttribute("matchNo", matchNo);
			request.setAttribute("maxMatchNo", ms.getUncheckedMatchList(userNo).length);
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
