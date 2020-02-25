package board.controller.bestCouple;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.bestCoupleService;
import board.model.vo.BestCouple;
import board.model.vo.Board;
import board.model.vo.Photo;

/**
 * Servlet implementation class bestCoupleDetailServlet
 */
@WebServlet("/detail.bc")
public class bestCoupleDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bestCoupleDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pNo = Integer.parseInt(request.getParameter("pNo"));
	
		bestCoupleService bcService = new bestCoupleService();
		
		Board b = bcService.selectBoard(pNo);
		BestCouple bc = bcService.selectBestCouple(pNo);
		ArrayList<Photo> pList = bcService.selectPhoto(pNo);
	
		String page = null;
		if(b != null && bc != null && pList != null) {
			request.setAttribute("b", b);
			request.setAttribute("bc", bc);
			request.setAttribute("pList", pList);
			page = "views/coupleStory/bestCouple/bestCoupleDetailForm.jsp";
		} else {
			request.setAttribute("msg", "[이달의 베스트 커플] 게시글 조회에 실패하였습니다.");
			page = "views/common/errorPage.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
