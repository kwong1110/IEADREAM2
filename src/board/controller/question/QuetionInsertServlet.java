package board.controller.question;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import account.model.vo.Account;
import board.model.service.QuestionService;
import board.model.vo.Board;

/**
 * Servlet implementation class QuetionInsertServlet
 */
@WebServlet("/insert.qu")
public class QuetionInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QuetionInsertServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int userNo = ((Account)request.getSession().getAttribute("loginUser")).getUserNo();

		Board board = new Board();
		board.setCategory(category);
		board.setTitle(title);
		board.setContent(content);
		board.setUserNo(userNo);
		
		System.out.println("insertservlet: " + board);
		
		int resultb = new QuestionService().insertQuestion1(board);
		System.out.println("servlet resultb : " + resultb);
		
		if (resultb > 0 ) {
			response.sendRedirect("list.qu?userNo="+userNo);
		} else {
			request.setAttribute("msg", "문의글 등록에 실패하였습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
