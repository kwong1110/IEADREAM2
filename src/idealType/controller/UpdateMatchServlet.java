package idealType.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import idealType.model.service.MatchService;
import idealType.model.vo.Match;

/**
 * Servlet implementation class UpdateMatchServlet
 */
@WebServlet("/update.mc")
public class UpdateMatchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMatchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int userNo = ((Account)request.getSession().getAttribute("loginUser")).getUserNo();
		
		Match m = new Match();
		m.setUserNo(userNo);
		m.setTargetNo(targetNo);
		m.setStatus(status);
		m.setMatchDate(matchdate);
		
		int result = new MatchService().insertMatch(m);
		
		String page = null;
		if(result > 0) {
			page = "";
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
