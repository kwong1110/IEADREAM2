package board.controller.question;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.QuestionService;
import board.model.vo.Board;
import common.PageInfo;

/**
 * Servlet implementation class AdminQuestionSearchServlet
 */
@WebServlet("/search.qu")
public class AdminQuestionSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQuestionSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String search = request.getParameter("searchCon");
		String searchCategory = request.getParameter("searchCategory");
		
		QuestionService service = new QuestionService();
		
		int listCount = service.getListSearchCount(search,searchCategory);
		
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		maxPage = (int)((double)listCount / limit + 0.9);
		startPage = ((int)((double)currentPage/limit + 0.9)-1)*limit+1;
		endPage = startPage + limit - 1;
		if(maxPage < endPage) {endPage = maxPage;}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		/* 검색 리스트 불러오기 */
		ArrayList<Board> list = service.selectSearchList(currentPage, search, searchCategory);
		String page = null;
		if(list != null) {
			page = "views/questionBoard/question/adminQuestionListView.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "문의게시판 검색에 실패했습니다.");
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
