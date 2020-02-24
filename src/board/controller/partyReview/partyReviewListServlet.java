package board.controller.partyReview;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.PartyReviewService;
import board.model.vo.Board;
import common.PageInfo;

/**
 * Servlet implementation class partyReviewListServlet
 */
@WebServlet("/list.pr")
public class partyReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public partyReviewListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PartyReviewService service = new PartyReviewService();
		
		int listCount = service.getListCount();
		
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		if(request.getParameter("currentPage") !=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		maxPage = (int)((double)listCount/limit + 0.9);
		
		startPage = (((int)((double)currentPage/limit + 0.9)) -1 )*limit +1;
		endPage = startPage + limit - 1; 
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		
		ArrayList<Board> list = service.selectList(currentPage);
		String page = null;
		if(list != null) {
			page = "views/loveParty/partyReview/partyReviewListView.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "파티 후기 게시판 조회에 실패하였습니다.");
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
