package myPage.user.controller;

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

/**
 * Servlet implementation class selectUserPreferServlet
 */
@WebServlet("/select.up")
public class selectUserPreferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectUserPreferServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Account loginUser = (Account)session.getAttribute("loginUser");
		
		UserService us = new UserService();
		int userNo = loginUser.getUserNo();
		UserInfo ui = us.selectUserInfo(userNo);
		UserPrefer up = us.selectUserPrefer(userNo);
		
		String page = null;
		if(ui != null) {
			page = "views/myPage/user/updateUserPreferForm.jsp";
			request.setAttribute("ui", ui);
			request.setAttribute("up", up);
		} else {
			page = "views/account/joinUserPreferenceForm.jsp";
			request.setAttribute("ui", ui);
			request.setAttribute("up", up);
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
