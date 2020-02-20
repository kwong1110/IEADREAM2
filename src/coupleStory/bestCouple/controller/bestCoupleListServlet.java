package coupleStory.bestCouple.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import coupleStory.bestCouple.model.service.bestCoupleService;
import coupleStory.bestCouple.model.vo.BestCouple;

/**
 * Servlet implementation class bestCoupleListServlet
 */
@WebServlet("/list.bc")
public class bestCoupleListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bestCoupleListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		bestCoupleService bcService = new bestCoupleService();
		
		ArrayList<BestCouple> bcList = bcService.selectBcList();
		
		String page = null;
		if(bcList != null) {
			request.setAttribute("bcList", bcList);
			page = "views/coupleStory/bestCouple/bestCoupleListForm.jsp";
		} else {
			request.setAttribute("msg", "이달의 베스트 커플 게시판 조회에 실패하였습니다.");
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
