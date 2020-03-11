package account.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import account.model.service.AccountService;
import account.model.vo.Account;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		System.out.println(userId + userPwd);
		Account Account = new Account(userId, userPwd);
		
		Account loginUser = new AccountService().loginAccount(Account);
		
		response.setContentType("text/html; charset=UTF-8");
		
		int failCount = 0;
		
		if(loginUser != null) { // 로그인 성공시에 대한 코드
			if(loginUser.getPassword().equals("비밀번호 불일치")) {
				request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
				request.setAttribute("failCount", failCount);
				RequestDispatcher view = request.getRequestDispatcher("views/account/accountLoginForm.jsp");
				view.forward(request, response);
			}else {
				HttpSession session = request.getSession();
				session.setMaxInactiveInterval(600); // 로그인에 대한  시간을 설정해주는 것이다 . -> 10분(60 * 10) 
				session.setAttribute("loginUser", loginUser);
				
				RequestDispatcher view = request.getRequestDispatcher("index.jsp");
				view.forward(request, response);
				/*if(loginUser.getGrade() != 1) {
				RequestDispatcher view = request.getRequestDispatcher("/fill.mc");
				view.forward(request, response);
				}*/
			}
		} else { // 로그인 실패 시 출력코드 
			request.setAttribute("msg", "아이디가 존재하지 않습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/account/accountLoginForm.jsp");
			view.forward(request, response);
		}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}