package questionBoard.faq.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import questionBoard.faq.model.service.FaqService;
import questionBoard.faq.model.vo.Faq;

/**
 * Servlet implementation class faqAdminDetailServlet
 */
@WebServlet("/faqDetail.faq")
public class faqAdminDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public faqAdminDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("no"); // list에서 num에 게시글 번호를 받아옴
		Faq faq = new FaqService().selectAdminDetail(num); // 글 번호를 매개변수로 불러올 faq 객체 저장
		
		String page = null;
		if(faq != null) {
			page = "views/questionBoard/faqAdminUpdateForm.jsp";
			request.setAttribute("faq", faq);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 상세보기에 실패하였습니다.");
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
