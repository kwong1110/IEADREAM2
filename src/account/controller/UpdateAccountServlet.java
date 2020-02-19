package account.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import account.model.service.AccountService;
import account.model.vo.Account;

/**
 * Servlet implementation class UpdateAccountServlet
 */
@WebServlet("/update.ac")
public class UpdateAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); /* 들어오는 값 깨지지 않게 인코딩 */
		
		/* updateMyProfile.jsp에서 바꿀 값 받아와서 변수 지정 */
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String user_name = request.getParameter("user_name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		/* 받아온 값 account객체에 담기 */
		Account account = new Account(id, pass, user_name, email, phone);
		
		/* DB에 업데이트한 결과값 가져오기 */
		int result = new AccountService().updateAccount(account);
		
		/* 결과값에 따라 페이지 나누기 */
		String page = null;
		if(result > 0) {
			page = ""; /*정보 확인 페이지로 다시 가기*/
			request.setAttribute("msg", "회원정보 수정에 성공하였습니다.");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "회원 수정에 실패하였습니다.");
		}
		
		/* view단에 페이지(값?) 보내기 */
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
