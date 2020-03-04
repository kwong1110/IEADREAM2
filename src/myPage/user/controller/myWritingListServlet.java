package myPage.user.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.vo.Board;
import common.PageInfo;
import myPage.user.model.service.userService;

/**
 * Servlet implementation class myWritingListServlet
 */
@WebServlet("/list.mwl")
public class myWritingListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myWritingListServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		userService service = new userService();
		
		String userNo = request.getParameter("userNo");
		System.out.println("userNo : " + userNo);
		String bCategory = request.getParameter("bCategory");
		String sCategory = request.getParameter("sCategory");
		String sWord = request.getParameter("sWord");
		String search = request.getParameter("search");
		
		int listCount = 0;
		
		listCount = service.getmWListCount(userNo);	// 게시판 리스트 개수
		
		if(bCategory != null && sCategory != null && sWord != null && search != null) {
			listCount = service.getSearchmWListCount(bCategory, sCategory, sWord, userNo);
		}
		
		int currentPage;	// 현재 페이지 표시
		int limit;			// 한 페이지에 표시될 페이징 수
		int maxPage;		// 전체 페이지 중 가장 마지막 페이지
		int startPage;		// 페이징 된 페이지 중 시작 페이지
		int endPage;		// 페이징 된 페이지 중 마지막 페이지
		
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		
		limit = 10;
		
		maxPage = (int)((double)listCount/limit + 0.9);
		startPage = (((int)((double)currentPage/limit + 0.9)) - 1) * limit + 1;
		endPage = startPage + limit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<Board> list = null;
		

		list = service.selectmWList(currentPage, userNo);
				
		System.out.println("list.mwl 확인 !: " + bCategory + sCategory + sWord);
		
		if(bCategory != null && sCategory != null && sWord != null && search != null) {
			list = service.searchmWList(currentPage, bCategory, sCategory, sWord, userNo);
		}
		
		String page = null;
		if(list != null) {
			page = "views/myPage/user/myWritingListForm.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("bCategory", bCategory);
			request.setAttribute("sCategory", sCategory);
			request.setAttribute("sWord", sWord);
			request.setAttribute("search", search);
			request.setAttribute("userNo", userNo);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회에 실패하였습니다.");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
