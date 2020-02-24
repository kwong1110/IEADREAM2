package myPage.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myPage.admin.model.service.adminService;

/**
 * Servlet implementation class memberManageUpdateServlet
 */
@WebServlet("/manageUpdate.mem")
public class memberManageUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberManageUpdateServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String checkCategory = request.getParameter("checkCategory");
		String[] userNo = request.getParameterValues("userNo");
		// str= String.join("|", arrayStr);
		
		
		for(int i =0; i < userNo.length; i++) {
			System.out.println("유저 번호 : " + userNo[i]);
		}		
		System.out.println("카테코리 : " + checkCategory);
		
		int result = new adminService().updateGrade(checkCategory, userNo);
		
		
		String grade = "";
		if(checkCategory.equals("1")) {
			grade = "준회원";
		} else {
			grade = "정회원";
		}

		
		String page = null;
		if(result > 0) {
			page = "views/common/successPage.jsp";
			request.setAttribute("msg", "총 "+ userNo.length + "명 '" + grade + "' 등급으로 변경하였습니다.");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "회원 수정에 실패하였습니다.");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
