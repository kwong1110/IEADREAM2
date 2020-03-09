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
import account.model.vo.Account;
import account.model.vo.UserInfo;

/**
 * Servlet implementation class selectUserInfoServlet
 */
@WebServlet("/select.ui")
public class selectUserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectUserInfoServlet() {
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
		
		UserInfo ui = null;
		String pPath = null;
		
		ui = us.selectUserInfo(userNo);
		pPath = us.selectUserPhoto(userNo).getFilePath();
		
		String page = null;
		if(ui != null) {
			page = "views/myPage/user/updateUserInfo.jsp";
			request.setAttribute("ui", ui);
			request.setAttribute("pPath", pPath);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "내 정보 불러오기에 실패했습니다.");
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
