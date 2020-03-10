package board.controller.question;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import board.model.service.QuestionService;
import board.model.vo.Reply;

/**
 * Servlet implementation class QuestionReplyUpdateServlet
 */
@WebServlet("/updateReply.qu")
public class QuestionReplyUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionReplyUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String answerContent  = request.getParameter("answerContent");
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		
		Reply r = new Reply();
		r.setAnswerContent(answerContent);
		r.setPostNo(postNo);
		
		ArrayList<Reply> list = new QuestionService().insertReply(r);
		System.out.println("servlet" + r);
		response.setContentType("application/json; charset=UTF-8");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
