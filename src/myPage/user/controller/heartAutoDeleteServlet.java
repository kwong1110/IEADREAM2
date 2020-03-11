package myPage.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myPage.user.model.service.userService;

/**
 * Servlet implementation class heartAutoDeleteServlet
 */
@WebServlet("/autodelete.hh")
public class heartAutoDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public heartAutoDeleteServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] autoDTarget = request.getParameterValues("autoDTargetArr");
		String[] autoDUser = request.getParameterValues("autoDUserArr");
		
		for(int i = 0; i < autoDTarget.length; i++) {
			System.out.println("타겟확인 : " + autoDTarget[i]);
			System.out.println("보낸유저확인 : " + autoDUser[i]);
		}
		
		int result = new userService().heartAutoDelete(autoDTarget, autoDUser);
		
		String msg = null;
		if(result > 0) {
			msg = "총 "+ autoDTarget.length + "개의 하트가 보관기간이 지나 삭제 되었습니다.";
		} else {
			msg = "보관기간이 지난 하트 삭제에 실패 했습니다.";
		}
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().println(msg);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
