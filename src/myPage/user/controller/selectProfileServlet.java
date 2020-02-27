package myPage.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import account.model.vo.Account;
import myPage.user.model.service.userProfileService;

/**
 * Servlet implementation class selectProfileServlet
 */
@WebServlet("/selectProfileServlet")
public class selectProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(); //로그인 정보 불러오기
		
		String loginUser = ((Account)session.getAttribute("loginUser")).getId();
		
		Account account = new userProfileService().selectProfile(loginUser);
		//account 객체에 내 정보보기에 필요한 모든 정보 받아오기
		
		String page = null;
		if(account != null) {
			page = "views/myPage/user/selectMyProfileView.jsp";
			request.setAttribute("account", account);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "내 정보 보기에 실패했습니다.");
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
