package board.controller.bestCouple;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.bestCoupleService;
import board.model.vo.Board;
import board.model.vo.Photo;
import common.PageInfo;

/**
 * Servlet implementation class bestCoupleSearchServlet
 */
@WebServlet("/search.bc")
public class bestCoupleSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bestCoupleSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String search = request.getParameter("search");
		
		bestCoupleService bcService = new bestCoupleService();
		
		int listCount = bcService.getSearchListCount(year, month);
		
		int limit;
		int currentPage;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
	
		limit = 3;
		
		maxPage = (int)((double)listCount/limit + 0.9);
		startPage = (((int)((double)currentPage/limit + 0.9)) - 1) * limit + 1;
		endPage = startPage + limit -1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<Board> bcList = bcService.searchbcList(currentPage, year, month);
		ArrayList<Photo> pList = bcService.searchpList();
		
		String page = null;
		if(bcList != null && pList != null) {
			page = "views/coupleStory/bestCouple/bestCoupleListForm.jsp";
			request.setAttribute("bcList", bcList);
			request.setAttribute("pList", pList);
			request.setAttribute("pi", pi);
			request.setAttribute("year", year);
			request.setAttribute("month", month);
			request.setAttribute("search", search);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "[이달의 베스트 커플] 게시판 검색에 실패하였습니다.");
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
