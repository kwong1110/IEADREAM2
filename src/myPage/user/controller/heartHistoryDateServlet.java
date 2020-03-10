package myPage.user.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class heartHistoryDateServlet
 */
@WebServlet("/list.hhd")
public class heartHistoryDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public heartHistoryDateServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String okTarget = request.getParameter("okTarget");
		String okUser = request.getParameter("okUser");
		
		String clientId = "ukOYt4rgn6AgUshnXDfi"; //애플리케이션 클라이언트 아이디값"
        String clientSecret = "pCzKblPfs4"; //애플리케이션 클라이언트 시크릿값"
        
        String text = "역삼역 맛집";
        
        try {
            text = URLEncoder.encode(text, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text;
            
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
         
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            
            String inputLine;
            StringBuffer sb = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {//br.readLine()가 널이 아닐때만 inputLine에 br.readLine()값 집어넣고 while문 실행
                sb.append(inputLine);
            }
            br.close();
            System.out.println(sb.toString());
                        
            response.setContentType("text/html;charset=UTF-8"); 
			request.setAttribute("searchDate", sb);
            RequestDispatcher view = request.getRequestDispatcher("views/myPage/user/heartHistoryDateForm.jsp");
    		view.forward(request, response);
    		            
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
