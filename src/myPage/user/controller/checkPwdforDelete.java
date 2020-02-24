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

/**
 * Servlet implementation class checkPwdforDelete
 */
@WebServlet("/checkPwdForDelete.mp")
public class checkPwdforDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkPwdforDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String id = ((Account)session.getAttribute("loginUser")).getId();
		String myPass = ((Account)session.getAttribute("loginUser")).getPassword();
		String chkPass = request.getParameter("password");
		
		String page = null;
		if(myPass.equals(chkPass)) { /* 입력한 password와 내 password가 일치하면 */
			page = "views/myPage/user/checkDelete.jsp";
			request.setAttribute("id", id);
		} else { /* 일치하지 않으면 */
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
