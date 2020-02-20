package account.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import account.model.vo.UserPrefer;

/**
 * Servlet implementation class UpdateUserPreferServlet
 */
@WebServlet("/update.up")
public class UpdateUserPreferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserPreferServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");		
		
		UserPrefer up = new UserPrefer();
		
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
		
		up.setHeight(height);
		up.setShape(shape);
		up.setStyle(style);
		up.setRegion(region);
		up.setReligion(religion);
		up.setScholar(scholar);
		up.setJob(job);
		up.setDrink(drink);
		up.setSmoke(smoke);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
