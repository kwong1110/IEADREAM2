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
 * Servlet implementation class faqAdminUpdateServlet
 */
@WebServlet("/faqUpdate.faq")
public class faqAdminUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public faqAdminUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("con");
		
		Faq faq = new Faq();
		faq.setPostNo(postNo);
		faq.setCategory(category);
		faq.setTitle(title);
		faq.setContent(content);
		
		int result = new FaqService().updateFaq(faq);
		
		String page = null;
		if(result > 0) {
			page = "/adminList.faq";
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "FAQ 수정에 실패하였습니다.");
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
