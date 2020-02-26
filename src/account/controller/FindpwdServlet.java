package account.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import account.model.service.AccountService;
import account.model.vo.Account;

/**
 * Servlet implementation class FindpwdServlet
 */
@WebServlet("/Findpwd.me")
public class FindpwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindpwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String email = request.getParameter("email");
		
	
		Account findUser = new Account(userId, email);
		String account = new AccountService().searchPwd(findUser);
		
		String page ="";
		if (account != null){
			page = "views/account/searchpwdForm.jsp";
			System.out.println("비밀번호 찾기 완료!!");
			request.setAttribute("account", account);
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "아이디 찾기에 실패하셨습니다,");
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
