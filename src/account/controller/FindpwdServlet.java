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

		// VO에 있는 db에 보내기 위해서 만든객체이며 현재 지금은 바로 db에 보내지않고 userName 이랑 email을 담아두고 있다.
		Account findUser = new Account();
		findUser.setId(userId);
		findUser.setEmail(email);
		
		// userId랑 email을 보내준뒤 우리는 password를 찾으니 비밀번호 값을 가져오는것
		String password = new AccountService().searchPwd(findUser);
		
		String page = null;
		if (password != null){
			page = "views/account/searchPwdFind.jsp";
			System.out.println("비밀번호 찾기 완료!!");
			request.setAttribute("password", password);
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "비밀번호 찾기에 실패하셨습니다.");
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
