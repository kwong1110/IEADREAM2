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
 * Servlet implementation class deleteProfileServlet
 */
@WebServlet("/delete.mp")
public class deleteProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(); //로그인 정보 불러오기
		String id = ((Account)session.getAttribute("loginUser")).getId();
		
		System.out.println(id);
		
		String deletePass = request.getParameter("deletePass");
		
		System.out.println(deletePass);
		
		Account account = new Account(id, deletePass);
		
		int result = new userProfileService().deleteProfile(account);
		
		String page = null;
		if(result > 0) {
			page = "views/common/successPage.jsp";
			request.setAttribute("msg", "탈퇴가 완료되었습니다.");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "잘못된 비밀번호입니다.");
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
