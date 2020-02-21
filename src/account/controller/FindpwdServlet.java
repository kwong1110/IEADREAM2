package account.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FindpwdServlet
 */
@WebServlet("/Findpwd.do")
public class FindpwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindpwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String userid = request.getParameter("id");
			String 
			
			Date writerDate = null;
			
			String [] dateArr = cbdate.split("-");
			int [] intArr = new int[dateArr.length];
			
			for(int i=0; i<dateArr.length; i++) {
				intArr[i] = Integer.parseInt(dateArr[i]);
			}
			
			writerDate = new Date(new GregorianCalendar(intArr[0],intArr[1]-1, intArr[2]).getTimelnMillis());
			
			Account account = new Account(id, writerDate);
			
			AccountService account = new AccountService();
			String = "";
			
			try {
				page = "view/account/searchPwdForm.jsp";
				account = account.searchPwd(account);
				System.out.println("비밀번호 찾기 완료");
				request.setAttribute("member", account);
				
			}catch(Exception e) {
				page = "views/account/common/errorPage.jsp";
				request.setAttribute("error","비밀번호 찾기중 오류 발생!!");
				request.setAttribute("exception", e);
			}
				request.getRequestDispatcher(page).forward(request. response);
				
	}
			
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
