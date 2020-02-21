package account.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import account.model.service.AccountService;
import account.model.vo.Account;

/**
 * Servlet implementation class InsertAccountServlet
 */
@WebServlet("/insert.ac")
public class InsertAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("joinUserId");
		String userPwd = request.getParameter("joinUserPwd");
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String birth = request.getParameter("birth");
		
		Date bir = null;
		if(birth != null) {
			String[] birthArr = birth.split("-");
			
			int year = Integer.parseInt(birthArr[0]);
			int month = Integer.parseInt(birthArr[1])-1;
			int day = Integer.parseInt(birthArr[2]);
			
			bir = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
		}
		
		Account a = new Account(userId, userPwd, gender, userName, phone, email, bir);
		int result = new AccountService().insertAccount(a);
		
		
		
		String page = "";
		if(result > 0) {
			page = "index.jsp";
			// page = "/insert.ui";
			request.setAttribute("msg", "기본정보 입력이 완료되었습니다.");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "회원가입에 실패하였습니다.");
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
