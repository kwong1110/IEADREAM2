package board.controller.weAreCouple;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import account.model.vo.Account;
import board.model.service.WeAreCoupleService;
import board.model.vo.Board;
import board.model.vo.Photo;
import common.MyFileRenamePolicy;

/**
 * Servlet implementation class weAreCoupleInsertServlet
 */
@WebServlet("/insert.wac")
public class weAreCoupleInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public weAreCoupleInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) { // 지금 넘어온 enctype이 multipart/form-data로 전송되었는지 확인
			int maxSize = 1024 * 1024 * 10; // 10Mbyte : 전송파일 용량 제한(바꿔도 상관 없다)
			String root = request.getSession().getServletContext().getRealPath("/"); // 웹 서버 컨테이너 경로 추출 ( 맨위를 말함)
			// 어디에 저장할건지 지정하는것
			String savePath = root + "photo_uploadFiles/";
			
			/*
				DefaultFileRenamePolicy dfrp = null;
				DefaultFileRenamePolicy는 cos.jar 안에 있는 클래스
				같은 파일 명이 존재하는지 확인 후 존재한다면 파일 명 뒤에 숫자를 붙여 구분
					ex. aaa.zip		aaa1.zip	aaa2.zip
			
			*/
			MultipartRequest multipartRequest
				= new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			//	request를 받아오고,  어디에 저장할건지 경로,  파일에대한 제한용량(최대크기)  형식이 어떤 형식인지, 같은 이름의 파일을 무슨 정책을 사용해서 이름을 정할건지(내가 만든 정책 클래스를 넣음) 
			
			ArrayList<String> saveFiles = new ArrayList<String>();   // 바뀐 파일에 대한 이름을 저장할 ArrayList
			ArrayList<String> originFiles = new ArrayList<String>(); // 원본 파일의 이름을 저장할 ArrayList
			
			Enumeration<String> files = multipartRequest.getFileNames();
			// 파일이름을 반환하는 메소드
			// 폼에서 전송된 파일들의 이름 반환하는메소드
			// 반환값 : Enumeration 
			// iterator의 구버전 
			
			while(files.hasMoreElements()) {
				String name = files.nextElement(); // 전송 순서의 역순으로 파일을 가져옴
				
				if(multipartRequest.getFilesystemName(name) != null) { // rename이 제대로 됐으면
					// getFilesystemName(name) : MyFileRenamePoliicy의 rename메소드에서 작성한 대로 rename된 파일명
					saveFiles.add(multipartRequest.getFilesystemName(name));
					originFiles.add(multipartRequest.getOriginalFileName(name)); // 원래이름 그대로
				}
			}
			
			String title = multipartRequest.getParameter("title");
			String content = multipartRequest.getParameter("content");
			String userId = ((Account)request.getSession().getAttribute("loginUser")).getId();
			int userNo = ((Account)request.getSession().getAttribute("loginUser")).getUserNo();
			
			Board b = new Board();
			b.setTitle(title);
			b.setContent(content);
			b.setUserId(userId);
			b.setUserNo(userNo);
			
			ArrayList<Photo> fileList = new ArrayList<Photo>();
			// 역순으로 들어가있음
			for(int i = originFiles.size() -1; i>=0; i--) {
				Photo at = new Photo();
				at.setFilePath(savePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				
				System.out.println(originFiles);
				//대표이미지 인지 아닌지를 구분해주는 if문
				if( i == originFiles.size()-1) {
					at.setFileLevel(0);
				} else {
					at.setFileLevel(1);
				}
				
				fileList.add(at);
			}
			int result = new WeAreCoupleService().insertThumbnail(b,fileList);
			
			if(result > 0) {
				response.sendRedirect("list.wac");
			} else { // 실패한 파일은 등록이 되지않도록 하는것
				for(int i = 0; i< saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					failedFile.delete();
				}
				
				request.setAttribute("msg", "사진 게시판 등록에 실패하였습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
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
