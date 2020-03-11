package myPage.user.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import account.model.vo.Account;
import myPage.user.model.service.userProfileService;

/**
 * Servlet implementation class updateProfileServlet
 */
@WebServlet("/update.mp")
public class updateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		
		String id = request.getParameter("id");
		String userName = request.getParameter("user_name");
		String gr = request.getParameter("grade");
			int grade = 0;
			switch(gr) {
			case "관리자": grade = 0; break;
			case "준회원": grade = 2; break;
			case "정회원": grade = 3; break;
			}
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String ge = request.getParameter("gender");
			String gender = null;
			switch(ge) {
			case "여자": ge = "F"; break;
			case "남자": ge = "M"; break;
			}
		String bi = request.getParameter("birth");
		Date birth = Date.valueOf(bi);
		
		String password = request.getParameter("pass");
		String p = request.getParameter("pass1");
		
		System.out.println("pass1 값 : " + p);
		
		if(p.equals("off")) { /* p값이 off일 경우 = 비밀번호가 빈칸으로 들어왔을 때 */
			Account account = new Account(id, grade, email, phone);
			result = new userProfileService().updateProfileNoPwd(account);
		} else if (p.equals("on")){ /* p값이 on일 경우 = 비밀번호가 채워져서 들어왔을 때 */
			Account account = new Account(grade, id, password, gender, userName, phone, email, birth);
			result = new userProfileService().updateProfile(account);
		}
		
		
		String page = null;
		if(result > 0) {
			page = "/selectProfileServlet";
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "회원 수정에 실패했습니다.");
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
