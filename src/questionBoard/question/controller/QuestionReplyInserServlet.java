package questionBoard.question.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import questionBoard.question.model.service.QuestionService;
import questionBoard.question.model.vo.Question;

/**
 * Servlet implementation class QuestionReplyInserServlet
 */
@WebServlet("/insertReply.qu")
public class QuestionReplyInserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionReplyInserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String answerContent  = request.getParameter("answerContent");
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		
		Question q = new Question();
		q.setAnswerContent(answerContent);
		q.setPostNo(postNo);
		
		ArrayList<Question> list = new QuestionService().insertReply(q);
		response.setContentType("application/json; charset=UTF-8");
		//new Gson().toJson(list, response.getWriter());//list를 response.getWriter를 통해서 보내겠다.
		
		// 데이트 형식을 맞추기 위해 
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
