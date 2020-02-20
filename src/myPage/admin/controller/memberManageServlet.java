package myPage.admin.controller;

import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import account.model.vo.Account;
import common.PageInfo;
import myPage.admin.model.service.adminService;

/**
 * Servlet implementation class memberManageServlet
 */
@WebServlet("/manage.mem")
public class memberManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberManageServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		adminService service = new adminService();
		
		int listCount = service.getListCount();	// 게시판 리스트 개수
		
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
		
		
		// sBtn(검색버튼 on/off), memGrade(회원등급), sCategory(검색카테고리), sWord(검색어) 받아오기
		int sBtn = 0;
			// 1: 처음 페이지,  0: 검색시
		String memGrade = request.getParameter("memGrade");
		String sCategory = request.getParameter("sCategory");
		String sWord = request.getParameter("sWord");
		if(memGrade != null) {
			sBtn = Integer.parseInt(request.getParameter("sBtn"));
		}
		
		ArrayList<Account> list = null;
		if(sBtn == 0) {
			list = service.selectMmList(currentPage);
		} else {
			list = service.searchMmList(currentPage);
		}
		
		System.out.println(pi);
		
		String page = null;
		if(list != null) {
			page = "views/myPage/admin/memberManageForm.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
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
