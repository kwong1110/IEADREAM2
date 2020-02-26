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
import account.model.vo.UserInfo;
import myPage.user.model.service.userProfileService;

/**
 * Servlet implementation class updateUserInfoServlet
 */
@WebServlet("/updateUser.if")
public class updateUserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateUserInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 디테일이 아니고 바로 정보를 불러와 수정해야하기 때문에 servlet에서 view 페이지로 넘어감
		HttpSession session = request.getSession();
		
		int userNo = ((Account)session.getAttribute("loginUser")).getUserNo();
		
		UserInfo ui = new userProfileService().updateUserInfo(userNo);
		
		String page = null;
		if(ui != null) {
			page = "views/myPage/user/updateMyProfile.jsp";
			request.setAttribute("ui", ui);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "내 프로필 조회에 실패했습니다.");
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
