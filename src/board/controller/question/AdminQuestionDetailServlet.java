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
import board.model.vo.Reply;

/**
 * Servlet implementation class QuestionDetailServlet
 */
@WebServlet("/Mdetail.qu")
public class AdminQuestionDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQuestionDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//int postNo = Integer.parseInt(request.getParameter("postNo"));
		String postNo = request.getParameter("postNo");
		Board board = new QuestionService().selectQuestion(postNo);
		Reply reply = new QuestionService().selectRQuestion(postNo);
		
		
		
		String page = null;
		if(board != null) {
			page = "views/questionBoard/question/adminQuestionDetailView.jsp";
			request.setAttribute("board", board);
			request.setAttribute("reply", reply);
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "문의글 상세조회에 실패하였습니다.");
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
