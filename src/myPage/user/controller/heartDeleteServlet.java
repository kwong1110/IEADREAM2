package myPage.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myPage.user.model.service.userService;

/**
 * Servlet implementation class heartDeleteServlet
 */
@WebServlet("/delete.hh")
public class heartDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public heartDeleteServlet() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] userNo = request.getParameterValues("userNo");
		String[] targetNo = request.getParameterValues("targetNo");
		String loginNo = request.getParameter("loginNo");
		
		
		for(int i = 0; i < userNo.length; i++) {
			if(targetNo[i].equals("나")){
				targetNo[i] = loginNo;
			} else if (userNo[i].equals("나")){
				userNo[i] = loginNo;
			}
		}

		for(int i = 0; i < userNo.length; i++) {
			System.out.println("userNo " + userNo[i]);
			System.out.println("targetNo " + targetNo[i]);
			System.out.println(loginNo);
		}
		
		int result = new userService().deleteHeart(userNo, targetNo);
		
		String page = null;
		if(result > 0) {
			page = "views/common/successPage.jsp";
			request.setAttribute("msg", "총 "+ userNo.length + "개의 하트를 삭제 하였습니다.");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "하트 삭제에 실패하였습니다.");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
