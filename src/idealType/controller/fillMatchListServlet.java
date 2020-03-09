package idealType.controller;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import account.model.vo.Account;
import idealType.model.service.MatchService;
import idealType.model.vo.Match;

/**
 * Servlet implementation class MatchInsertServlet
 */
@WebServlet("/fill.mc")
public class fillMatchListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public fillMatchListServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.sendRedirect("index.jsp");
		
		MatchService ms = new MatchService();
		
		int userNo = ((Account)request.getSession().getAttribute("loginUser")).getUserNo();
		
		Match[] oldMlist = ms.getMatchList(userNo);
		int stack = 0;
		Date today = new Date(System.currentTimeMillis());
		for (int i = 0; i < oldMlist.length ; i++) {
			if (oldMlist[i].getStatus().equals("D")) { // 대기중인 매칭 수 구하기
				oldMlist[i].setMatchDate(today);
				ms.updateMatch(oldMlist[i]); //매치 날짜 갱신
				stack++;
			}
			else if(oldMlist[i].getMatchDate() == today) { // 확인한 매칭 중 오늘 생성된 매칭 수 구하기
				stack++;
			}
		}
		Match[] newMlist = ms.searchMatchList(userNo); // 빈 공간 채워넣기
		for (int i = 0; stack+i < 5 ; i++) {
			ms.insertMatch(newMlist[i]);
		}
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
