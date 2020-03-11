package myPage.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import account.model.vo.Account;
import myPage.user.model.service.userService;

/**
 * Servlet implementation class heartOkServlet
 */
@WebServlet("/heartok.hh")
public class heartOkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public heartOkServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String okTarget = request.getParameter("okTarget");
		String okUser = request.getParameter("okUser");
		String userNo = request.getParameter("userNo");
		
		System.out.println("user"+ okUser + "target" + okTarget + userNo);
		
		int result = new userService().heartOk(okTarget, okUser);
		
		String page = null;
		if(result > 0) {
			page = "/list.hh?userNo=" + userNo;
			request.setAttribute("msg", "하트 수락 하였습니다.");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "하트 수락에 실패하였습니다.");
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
