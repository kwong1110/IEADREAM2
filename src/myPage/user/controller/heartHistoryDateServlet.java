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

import myPage.user.model.service.userService;
import myPage.user.model.vo.SearchBlog;

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
    public static StringBuilder sb;

    static String getString(String input, String data) {
    	// API에서 필요한 문자 자르기.
    
        String[] dataSplit = data.split("{" + input + "}");
        String[] dataSplit2 = dataSplit[1].split("\"" + input + "\"");
        return dataSplit2[0];
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String okTarget = request.getParameter("okTarget");
		String okUser = request.getParameter("okUser");

		userService us = new userService();
        
        int searchT = us.searchDate(okTarget);
        String searchlocation = "";
        switch(searchT) {
        case 11: searchlocation="서울"; break;
        case 12: searchlocation="인천"; break;
        case 13: searchlocation="경기"; break;
        case 20: searchlocation="강원"; break;
        case 31: searchlocation="충북"; break;
        case 32: searchlocation="충남"; break;
        case 33: searchlocation="대전"; break;
        case 41: searchlocation="전북"; break;
        case 42: searchlocation="전남"; break;
        case 43: searchlocation="광주"; break;
        case 51: searchlocation="경북"; break;
        case 52: searchlocation="대구"; break;
        case 53: searchlocation="경남"; break;
        case 54: searchlocation="부산"; break;
        case 55: searchlocation="울산"; break;
        case 60: searchlocation="제주"; break;
        }
        
        String text = searchlocation + "맛집";
        
        String clientId = "ukOYt4rgn6AgUshnXDfi"; //애플리케이션 클라이언트 아이디값"
        String clientSecret = "pCzKblPfs4"; //애플리케이션 클라이언트 시크릿값"
        
        try {
            text = URLEncoder.encode(text, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text + "&display=3&";
            
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
            
            sb = new StringBuilder();
            String line;
 
            while ((line = br.readLine()) != null) {
                sb.append(line + "\n");
            }
            br.close();
            con.disconnect();
            String data = sb.toString();
            
            String[] array;
        	array = data.split("\"");
        	String[] title = new String[3];
        	String[] link = new String[3];
        	String[] category = new String[3];
        	String[] description = new String[3];
        	String[] telephone = new String[3];
        	String[] address = new String[3];
        	String[] mapx = new String[3];
        	String[] mapy = new String[3];
        	
        	int k = 0;
        	for (int i = 0; i < array.length; i++) {
        	    if (array[i].equals("title"))
        	    	title[k] = array[i + 2];
        	    if (array[i].equals("link"))
        	        link[k] = array[i + 2];
        	    if (array[i].equals("description"))
        	        description[k] = array[i + 2];
        	    if (array[i].equals("bloggername"))
        	        telephone[k] = array[i + 2];
        	    if (array[i].equals("bloggerlink"))
        	        address[k] = array[i + 2];
        	    if (array[i].equals("postdate")) {
        	        mapx[k] = array[i + 2];
        	        k++;
        	    }
        	}
            
            System.out.println(sb);
            System.out.println("----------------------------");
            System.out.println("첫번째 타이틀 : " + title[0]);
            System.out.println("두번째 타이틀 : " + title[1]);
            System.out.println("세번째 타이틀 : " + title[2]);
            
            response.setContentType("text/html;charset=UTF-8"); 
			request.setAttribute("data", data);
			RequestDispatcher view = request.getRequestDispatcher("views/myPage/user/heartHistoryDateForm.jsp");
    		view.forward(request, response);
    		            
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("블로그 검색 API 실패",e);
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
