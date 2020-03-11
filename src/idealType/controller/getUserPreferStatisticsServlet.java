package idealType.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import account.model.vo.Account;
import idealType.model.service.MatchService;
import idealType.model.vo.Stat;

/**
 * Servlet implementation class getIdealStatisticsServlet
 */
@WebServlet("/get.ups")
public class getUserPreferStatisticsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getUserPreferStatisticsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = ((Account)request.getSession().getAttribute("loginUser")).getUserNo();
		MatchService mc = new MatchService();
		
		Stat[][]st = mc.getUpStat(userNo);
		
		for (int i=0; i< mc.getUpStat(userNo).length; i++) {
			for (int j=0; j < mc.getUpStat(userNo)[i].length ; j++) {
				st[i][j] = new Stat(); 
				st[i][j] = mc.getUpStat(userNo)[i][j];
				System.out.println("" + st[i][j]);
			}
		}
		
		Stat[] height = new Stat[8];
		for (int i = 0; i < height.length ;i++) {
			height[i] = new Stat();
			height[i].setProp(0);
		}
		height[0].setItem("150");
		height[1].setItem("155");
		height[2].setItem("160");
		height[3].setItem("165");
		height[4].setItem("170");
		height[5].setItem("175");
		height[6].setItem("180");
		height[7].setItem("185");
		
		Stat[] shape = new Stat[5];
		for (int i = 0; i < shape.length ;i++) {
			shape[i] = new Stat();
			shape[i].setProp(0);
		}
		shape[0].setItem("마름");
		shape[1].setItem("보통");
		shape[2].setItem("통통");
		shape[3].setItem("근육질");
		shape[4].setItem("글래머");
		
		Stat[] style = new Stat[6];
		for (int i = 0; i < style.length ;i++) {
			style[i] = new Stat();
			style[i].setProp(0);
		}
		style[0].setItem("귀여운");
		style[1].setItem("지적인");
		style[2].setItem("섹시한");
		style[3].setItem("따뜻한");
		style[4].setItem("우아한");
		style[5].setItem("터프한");
		
		Stat[] age = new Stat[5];
		for (int i = 0; i < age.length ;i++) {
			age[i] = new Stat();
			age[i].setProp(0);
		}
		age[0].setItem("-2");
		age[1].setItem("-1");
		age[2].setItem("0");
		age[3].setItem("1");
		age[4].setItem("2");
		
		Stat[] religion = new Stat[5];
		for (int i = 0; i < religion.length ;i++) {
			religion[i] = new Stat();
			religion[i].setProp(0);
		}
		religion[0].setItem("기독교");
		religion[1].setItem("천주교");
		religion[2].setItem("불교");
		religion[3].setItem("무교");
		religion[4].setItem("기타");
		
		Stat[] drink = new Stat[4];
		for (int i = 0; i < drink.length ;i++) {
			drink[i] = new Stat();
			drink[i].setProp(0);
		}
		drink[0].setItem("3");
		drink[1].setItem("2");
		drink[2].setItem("1");
		drink[3].setItem("0");

		Stat[] smoke = new Stat[2];for (int i = 0; i < smoke.length ;i++) {
			smoke[i] = new Stat();
			smoke[i].setProp(0);
		}
		smoke[0].setItem("1");
		smoke[1].setItem("0");
		
		Stat[] job = new Stat[8];
		for (int i = 0; i < job.length ;i++) {
			job[i] = new Stat();
			job[i].setProp(0);
		}
		job[0].setItem("학생");
		job[1].setItem("사무직");
		job[2].setItem("연구직");
		job[3].setItem("교육직");
		job[4].setItem("예술");
		job[5].setItem("서비스");
		job[6].setItem("전문직");
		job[7].setItem("기타");
		
		Stat[] scholar = new Stat[5];
		for (int i = 0; i < scholar.length ;i++) {
			scholar[i] = new Stat();
			scholar[i].setProp(0);
		}
		scholar[0].setItem("0");
		scholar[1].setItem("2");
		scholar[2].setItem("4");
		scholar[3].setItem("6");
		scholar[4].setItem("8");
		
		Stat[] region = new Stat[16];
		for (int i = 0; i < region.length ;i++) {
			region[i] = new Stat();
			region[i].setProp(0);
		}
		region[0].setItem("11");
		region[1].setItem("12");
		region[2].setItem("13");
		region[3].setItem("20");
		region[4].setItem("31");
		region[5].setItem("32");
		region[6].setItem("33");
		region[7].setItem("41");
		region[8].setItem("42");
		region[9].setItem("43");
		region[10].setItem("51");
		region[11].setItem("52");
		region[12].setItem("53");
		region[13].setItem("54");
		region[14].setItem("55");
		region[15].setItem("60");
		
		
		Stat[] interest = new Stat[20];
		for (int i = 0; i < interest.length ;i++) {
			interest[i] = new Stat();
			interest[i].setProp(0);
		}
		interest[0].setItem("movie");
		interest[1].setItem("musical");
		interest[2].setItem("comic");
		interest[3].setItem("picture");
		interest[4].setItem("books");
		interest[5].setItem("music");
		interest[6].setItem("sing");
		interest[7].setItem("instrument");
		interest[8].setItem("cook");
		interest[9].setItem("camp");
		interest[10].setItem("exercise");
		interest[11].setItem("sports");
		interest[12].setItem("vgame");
		interest[13].setItem("bgame");
		interest[14].setItem("sns");
		interest[15].setItem("drink");
		interest[16].setItem("beauty");
		interest[17].setItem("pet");
		interest[18].setItem("diy");
		interest[19].setItem("money");
		
		
		
		
		
		String page = null;
		if(st != null) {
			page = "views/idealType/userPreferStatistics.jsp";
			request.setAttribute("height", height);
			request.setAttribute("shape", shape);
			request.setAttribute("style", style);
			request.setAttribute("age", age);
			request.setAttribute("religion", religion);
			request.setAttribute("drink", drink);
			request.setAttribute("smoke", smoke);
			request.setAttribute("job", job);
			request.setAttribute("scholar", scholar);
			request.setAttribute("region", region);
			request.setAttribute("interest", interest);
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "통계 조회에 실패하였습니다.");
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
