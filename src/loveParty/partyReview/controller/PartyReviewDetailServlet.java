package loveParty.partyReview.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import loveParty.partyReview.model.service.PartyReviewService;
import loveParty.partyReview.model.vo.PartyReviewList;

/**
 * Servlet implementation class PartyReviewDetailServlet
 */
@WebServlet("/detail.pr")
public class PartyReviewDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PartyReviewDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		
		PartyReviewService service = new PartyReviewService();
		ArrayList<PartyReviewList> partyReview = service.selectImage(postNo);
		
		String page = null;
		if(partyReview != null) {
			request.setAttribute("fileList", partyReview);
			page = "views/loveParty/partyReview/partyReviewDetailView.jsp";
		} else {
			request.setAttribute("msg", "파티 후기 게시판 상세보기에 실패했습니다.");
			page = "views/common/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
