package account.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import account.model.vo.Account;
import account.model.vo.UserInfo;
import account.model.service.UserService;

/**
 * Servlet implementation class UpdateUserInfoServlet
 */
@WebServlet("/update.ui")
public class UpdateUserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserInfoServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		
		int userNo = ((Account)request.getSession().getAttribute("loginUser")).getUserNo();
		String thumb = request.getParameter("thumb");
		String hello = request.getParameter("hello");
		int height = Integer.parseInt(request.getParameter("height"));
		String shape = request.getParameter("shape");
		String style = request.getParameter("style");
		int region = Integer.parseInt(request.getParameter("region"));
		String religion = request.getParameter("religion");
		int scholar = Integer.parseInt(request.getParameter("scholar"));
		String job = request.getParameter("job");
		int drink = Integer.parseInt(request.getParameter("drink"));
		int smoke = Integer.parseInt(request.getParameter("smoke"));
		String[] interest = request.getParameterValues("interest");
		
		UserInfo ui = new UserInfo();

		ui.setUserNo(userNo);
		ui.setThumb(thumb);
		ui.setHello(hello);
		ui.setHeight(height);
		ui.setShape(shape);
		ui.setStyle(style);
		ui.setRegion(region);
		ui.setReligion(religion);
		ui.setScholar(scholar);
		ui.setJob(job);
		ui.setDrink(drink);
		ui.setSmoke(smoke);
		ui.setInterest(interest);

		UserService us= new UserService();

		int result1 = us.updateUserInfo(ui);
		int result2 = us.deleteUserInterest(ui);
		int result3 = us.insertUserInterest(ui);
		
		String page = null;
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			page = "views/account/joinUserPreferenceForm.jsp";
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "정보 수정에 실패하였습니다.");
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
