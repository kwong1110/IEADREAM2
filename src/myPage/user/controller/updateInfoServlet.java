package myPage.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import account.model.vo.UserInfo;
import myPage.user.model.service.userProfileService;

/**
 * Servlet implementation class updateInfoServlet
 */
@WebServlet("/update.ui")
public class updateInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
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
		
		int result = new userProfileService().updateInfo(ui);
		
		String page = null;
		if(result > 0) {
			page = "views/common/successPage.jsp";
			request.setAttribute("msg", "정보 변경이 성공하였습니다.");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "정보 변경에 실패했습니다.");
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
