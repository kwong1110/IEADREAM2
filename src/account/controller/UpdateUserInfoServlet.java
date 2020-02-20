package account.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import account.model.vo.UserInfo;

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
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		UserInfo ui = new UserInfo();
		
		int height = Integer.parseInt(request.getParameter("height"));
		String shape = request.getParameter("shape");
		String style = request.getParameter("style");
		String region = request.getParameter("region");
		String religion = request.getParameter("religion");
		int scholar = Integer.parseInt(request.getParameter("scholar"));
		String job = request.getParameter("job");
		int drink = Integer.parseInt(request.getParameter("drink"));
		int smoke = Integer.parseInt(request.getParameter("smoke"));
		String[] interest = request.getParameterValues("interest");
		
		ui.setHeight(height);
		ui.setShape(shape);
		ui.setStyle(style);
		ui.setRegion(region);
		ui.setReligion(religion);
		ui.setScholar(scholar);
		ui.setJob(job);
		ui.setDrink(drink);
		ui.setSmoke(smoke);	
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
