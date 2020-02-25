package account.controller;

import java.io.IOException;

import javax.security.auth.login.AccountException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import account.model.service.AccountService;
import account.model.vo.Account;

/**
 * Servlet implementation class FindidServlet
 */
@WebServlet("/Findeid.do")
public class FindidServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindidServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			
			String userName = request.getParameter("userName");
			String email = request.getParameter("email");
			System.out.println("서블릿 유저이름, 이메일 : " + userName + email);
		
			Account findUser = new Account(userName, email);
			System.out.println("서블릿 : " + findUser);
			Account account = new AccountService().searchid(findUser);
			
			String page ="";
			if (account != null){
				page = "views/account/searchidForm.jsp";
				System.out.println("아이디 찾기 완료!!");
				request.setAttribute("account", account);
			}else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "아이디 찾기에 실패하셨습니다. ㅠㅠ");
			}
			
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
