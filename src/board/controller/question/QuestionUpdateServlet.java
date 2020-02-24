package board.controller.question;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.QuestionService;
import board.model.vo.Board;

/**
 * Servlet implementation class QuestionUpdateServlet
 */
@WebServlet("/update.qu")
public class QuestionUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		String title = request.getParameter("title");
		String category = request.getParameter("category");
		String content = request.getParameter("content");
		
		Board board = new Board();
		board.setPostNo(postNo);
		board.setTitle(title);
		board.setCategory(category);
		board.setContent(content);
		
		int result = new QuestionService().updateQuestion(board);
		
		String page = null;
		if(result>0) {
			page = "/detail.qu?postNo="+postNo;
		}else {
			page= "views/common/errorPage.jsp";
			request.setAttribute("msg", "문의글수정에 실패하였습니다.");
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

