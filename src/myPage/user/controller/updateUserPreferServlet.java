package myPage.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import account.model.service.UserService;
import account.model.vo.Account;
import account.model.vo.UserPrefer;
import myPage.user.model.service.userProfileService;

/**
 * Servlet implementation class updateUserPreferenceServlet
 */
@WebServlet("/update.up")
public class updateUserPreferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateUserPreferServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 디테일이 아니고 바로 정보를 불러와 수정해야하기 때문에 servlet에서 view 페이지로 넘어감
		HttpSession session = request.getSession();

		int userNo = ((Account)request.getSession().getAttribute("loginUser")).getUserNo();
		int height = Integer.parseInt(request.getParameter("height"));
		int heightPri = Integer.parseInt(request.getParameter("heightPri"));
		String shape = request.getParameter("shape");
		int shapePri = Integer.parseInt(request.getParameter("shapePri"));
		String style = request.getParameter("style");
		int stylePri = Integer.parseInt(request.getParameter("stylePri"));
		int age = Integer.parseInt(request.getParameter("age"));
		int agePri = Integer.parseInt(request.getParameter("agePri"));
		int regionPri = Integer.parseInt(request.getParameter("regionPri"));
		String religion = request.getParameter("religion");
		int religionPri = Integer.parseInt(request.getParameter("religionPri"));
		int scholar = Integer.parseInt(request.getParameter("scholar"));
		int scholarPri = Integer.parseInt(request.getParameter("scholarPri"));
		String job = request.getParameter("job");
		int jobPri = Integer.parseInt(request.getParameter("jobPri"));
		int drink = Integer.parseInt(request.getParameter("drink"));
		int drinkPri = Integer.parseInt(request.getParameter("drinkPri"));
		int smoke = Integer.parseInt(request.getParameter("smoke"));
		int smokePri = Integer.parseInt(request.getParameter("smokePri"));
		int interestPri = Integer.parseInt(request.getParameter("interestPri"));

		UserPrefer up = new UserPrefer();

		up.setUserNo(userNo);
		up.setHeight(height);
		up.setHeightPri(heightPri);
		up.setShape(shape);
		up.setShapePri(shapePri);
		up.setStyle(style);
		up.setStylePri(stylePri);
		up.setAge(age);
		up.setAgePri(agePri);
		up.setRegionPri(regionPri);
		up.setReligion(religion);
		up.setReligionPri(religionPri);
		up.setScholar(scholar);
		up.setScholarPri(scholarPri);
		up.setJob(job);
		up.setJobPri(jobPri);
		up.setDrink(drink);
		up.setDrinkPri(drinkPri);
		up.setSmoke(smoke);
		up.setSmokePri(smokePri);
		up.setInterestPri(interestPri);

		int result = new UserService().updateUserPrefer(up);
		
		String page = null;
		if(result > 0) {
			page = "views/myPage/user/updateUserPreferForm.jsp";
			request.setAttribute("up", up);
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
