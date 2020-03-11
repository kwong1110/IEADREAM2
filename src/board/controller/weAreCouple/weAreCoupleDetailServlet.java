package board.controller.weAreCouple;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.WeAreCoupleService;
import board.model.vo.BestCouple;
import board.model.vo.Board;
import board.model.vo.Photo;

/**
 * Servlet implementation class weAreCoupleDetailServlet
 */
@WebServlet("/detail.wac")
public class weAreCoupleDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public weAreCoupleDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String postNo = request.getParameter("postNo");
		WeAreCoupleService service = new WeAreCoupleService();
		
		Board board = service.selectBoard(postNo);
		ArrayList<Photo> fileList = service.selectPhoto(postNo);
		BestCouple bc = service.selectCouple(postNo);
		
		String page = null;
		if(board != null &&fileList != null  &&bc != null) {
			request.setAttribute("board", board);
			request.setAttribute("fileList", fileList);
			request.setAttribute("bc",bc);
			page= "views/coupleStory/weAreCouple/weAreCoupleDetailView.jsp";
		} else {
			request.setAttribute("msg", "사진 게시판 상세보기에 실패하였습니다.");
			page = "views/common/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
