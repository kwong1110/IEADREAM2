package questionBoard.question.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import account.model.vo.Account;
import questionBoard.question.model.service.QuestionService;
import questionBoard.question.model.vo.Question;

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
		//String userId = request.getParameter("userId");
		int userNo = ((Account)request.getSession().getAttribute("loginUser")).getUserNo();

		Question question = new Question();
		question.setCategory(category);
		question.setTitle(title);
		question.setContent(content);
		question.setUserNo(userNo);
		/* int result = new QuestionService().insertQuestion(question, category); */
		int result = new QuestionService().insertQuestion(question);

		if (result > 0) {
			response.sendRedirect("list.qu");
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
/*
 * ======= package questionBoard.question.controller;
 * 
 * import java.io.IOException;
 * 
 * import javax.servlet.RequestDispatcher; import
 * javax.servlet.ServletException; import javax.servlet.annotation.WebServlet;
 * import javax.servlet.http.HttpServlet; import
 * javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse;
 * 
 * import questionBoard.question.model.service.QuestionService; import
 * questionBoard.question.model.vo.Question;
 * 
 *//**
	 * Servlet implementation class QuetionInsertServlet
	 */
/*
 * @WebServlet("/insert.qu") public class QuetionInsertServlet extends
 * HttpServlet { private static final long serialVersionUID = 1L;
 * 
 *//**
	 * @see HttpServlet#HttpServlet()
	 */
/*
 * public QuetionInsertServlet() { super(); // TODO Auto-generated constructor
 * stub }
 * 
 *//**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
/*
 * protected void doGet(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException {
 * request.setCharacterEncoding("UTF-8");
 * 
 * int category = Integer.parseInt(request.getParameter("category")); String
 * title = request.getParameter("title"); String content =
 * request.getParameter("content"); //String id =
 * (Account)request.getSession().getAttribute("loginUser")).getUserId();
 * 
 * Question question = new Question(); question.setTitle(title);
 * question.setContent(content); //question.set int result = new
 * QuestionService().insertQuestion(question, category);
 * 
 * if(result>0) { response.sendRedirect("list.qu"); } else {
 * request.setAttribute("msg", "문의글 등록에 실패하였습니다."); RequestDispatcher view =
 * request.getRequestDispatcher("views/common/errorPage.jsp");
 * view.forward(request, response); } }
 * 
 *//**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 *//*
		 * protected void doPost(HttpServletRequest request, HttpServletResponse
		 * response) throws ServletException, IOException { // TODO Auto-generated
		 * method stub doGet(request, response); }
		 * 
		 * } >>>>>>> branch 'master' of https://github.com/kwong1110/IeaDream.git
		 */