package myPage.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import account.model.vo.Account;
import myPage.admin.model.service.adminService;

/**
 * Servlet implementation class searchMemberServlet
 */
@WebServlet("/search.mem")
public class searchMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 실패
		
	/*		
			// sBtn(검색버튼 on/off), memGrade(회원등급), sCategory(검색카테고리), sWord(검색어) 받아오기
		String memGrade = request.getParameter("memGrade");
		String sCategory = request.getParameter("sCategory");
		String sWord = request.getParameter("sWord");
		
		ArrayList<Account> search = new adminService().searchMmList(memGrade, sCategory, sWord);
		for(Account s : search) {
			System.out.println("search list 객체 확인 : " + s);
		}
		
		response.setContentType("application/json; charset=UTF-8");
		
		new Gson().toJson(search, response.getWriter());
		
	*/	
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
