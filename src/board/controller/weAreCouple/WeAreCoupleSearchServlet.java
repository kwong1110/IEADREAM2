package board.controller.weAreCouple;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.WeAreCoupleService;
import board.model.vo.Board;
import common.PageInfo;

/**
 * Servlet implementation class WeAreCoupleSearchServlet
 */
@WebServlet("/search.wac")
public class WeAreCoupleSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WeAreCoupleSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String menu = request.getParameter("menu"); //검색할 카테고리(제목,작성자)
		String content = request.getParameter("content");// 검색할 내용
		
		
		WeAreCoupleService service = new WeAreCoupleService();
		
		String search = "on";
		
		int listCount = service.getListSearchCount(menu, content);
		
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
		ArrayList<Board> list = service.selectSearchList(currentPage, menu, content);
		
		System.out.println(menu + content);
		
		String page = null;
		if(list != null) {
			page = "views/coupleStory/weAreCouple/weAreCoupleListView.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("search", search);
			request.setAttribute("menu", menu);
			request.setAttribute("content", content);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "우리 커플됐어요 검색에 실패했습니다.");
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
