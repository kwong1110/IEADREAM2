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
import myPage.user.model.service.userService;

/**
 * Servlet implementation class selectMyProfileServlet
 */
@WebServlet("/selectProfile.mp")
public class selectMyProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectMyProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 내 정보를 가져오기 위해 현재 로그인한 세션의 아이디를 가져옴 */
		HttpSession session = request.getSession(); 
		
		/* String에 현재 로그인한 아이디 넣기 */
		String loginId = ((Account)session.getAttribute("loginUser")).getId();
		
		/*loginId를 매개변수로 전달해 해당 id의 회원정보를 account에 담기*/
		Account account = new userService().selectMyProfile(loginId);
		
		String page = null;
		if(account != null) { /* view단에 내 account정보 전달 */
			page = "views/mypPage/user/updateMyProfile.jsp";
			request.setAttribute("account", account);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "내 정보 조회에 실패했습니다.");
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
