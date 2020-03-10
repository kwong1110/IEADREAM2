package myPage.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import account.model.service.UserService;
import account.model.vo.Account;
import account.model.vo.UserInfo;
import account.model.vo.UserPhoto;
import common.MyFileRenamePolicy;
import myPage.user.model.service.userProfileService;

/**
 * Servlet implementation class updateUserInfoServlet
 */
@WebServlet("/update.ui")
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

		int maxSize = 1024 * 1024 * 10;
		String root = request.getSession().getServletContext().getRealPath("/");
		String savePath = root + "photo_uploadFiles/";
		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		String originName = mrequest.getOriginalFileName("profileImg");
		String changeName = mrequest.getFilesystemName("profileImg");
		
		HttpSession session = request.getSession();
		int userNo = ((Account)session.getAttribute("loginUser")).getUserNo();
		
		String hello = mrequest.getParameter("hello");
		int height = Integer.parseInt(mrequest.getParameter("height"));
		String shape = mrequest.getParameter("shape");
		String style = mrequest.getParameter("style");
		int region = Integer.parseInt(mrequest.getParameter("region"));
		String religion = mrequest.getParameter("religion");
		int scholar = Integer.parseInt(mrequest.getParameter("scholar"));
		String job = mrequest.getParameter("job");
		int drink = Integer.parseInt(mrequest.getParameter("drink"));
		int smoke = Integer.parseInt(mrequest.getParameter("smoke"));
		String[] interest = mrequest.getParameterValues("interest");

		UserPhoto p = new UserPhoto();
		p.setUserNo(userNo);
		p.setFilePath(savePath);
		p.setOriginName(originName);
		p.setChangeName(changeName);
		
		UserInfo ui = new UserInfo();
		ui.setUserNo(userNo);
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

		UserService UserService = new UserService();
		int result1 = UserService.insertPhoto(p);
		int result2 = UserService.updateUserInfo(ui);
		
		String page = null;
		if(result1 > 0 && result2 > 0) {
			page = "views/myPage/user/updateUserInfoForm.jsp";
			request.setAttribute("ui", ui);
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
