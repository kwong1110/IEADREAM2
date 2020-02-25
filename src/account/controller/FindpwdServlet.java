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
		String eamil = request.getParameter("email");
		
		Date writerDate = null;
		
		String [] dateArr = userId.split("-"); 
		int [] intArr = new int[dateArr.length];
		
		for(int i=0; i<dateArr.length;i++) {
			intArr[i] = Integer.parseInt(dateArr[i]);
		}
		
		writerDate = new Date(new GregorianCalendar(intArr[0], intArr[1]-1, intArr[2]).getTimeInMillis());
		
		Account account = new Account(userId,writerDate);
	
		AccountService hms = new AccountService();
		
		
		String page ="";
		
		
		try{
			page = "views/homep/searchPwdForm.jsp";
			int result = hms.searchPwd(account);
			System.out.println("비밀번호 찾기 완료");
			request.setAttribute("account", account);
		
		} catch(Exception e) {
			page = "views/common/errorPage.jsp";
			request.setAttribute("error", "비밀번호 찾기중 오류 발생!!");
			request.setAttribute("exception", account);
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
