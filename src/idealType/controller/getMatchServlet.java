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
		String page = null;
		HttpSession session = request.getSession();
		
		MatchService ms = new MatchService();
		UserService us = new UserService();
		
		Account loginUser = (Account)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		System.out.println("servlet userNo: " + userNo);
				
		if (ms.getUncheckedMatchList(userNo) != null) {
			Match m = ms.getUncheckedMatchList(userNo)[0];

		int targetNo = m.getTargetNo();
		
		int sync = (int)Math.round(100*m.getSync());
		
		UserPhoto p = us.selectUserPhoto(targetNo);
		String pPath = p.getFilePath();
		
		Account ta = us.selectAccount(targetNo);
		UserInfo ti = us.selectUserInfo(targetNo);
		System.out.println(ti.toString());
		
		m.setStatus("C");
		ms.updateMatch(m);
		
		page = "views/idealType/idealTypeMatch.jsp";
		request.setAttribute("p", p);
		request.setAttribute("ti", ti);
		request.setAttribute("ta", ta);
		request.setAttribute("sync", sync);
		request.setAttribute("pPath", pPath);
		request.setAttribute("maxMatchNo", ms.getUncheckedMatchList(userNo).length);
		}
		else {
		page = "views/common/errorPage.jsp";
		request.setAttribute("msg", "남은 매칭이 없습니다. 내일을 기다려주세요.");
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
