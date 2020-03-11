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
import board.model.vo.BestCouple;
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
			
			MultipartRequest multipartRequest= new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();   // 바뀐 파일에 대한 이름을 저장할 ArrayList
			ArrayList<String> originFiles = new ArrayList<String>(); // 원본 파일의 이름을 저장할 ArrayList
			
			Enumeration<String> files = multipartRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement(); // 전송 순서의 역순으로 파일을 가져옴
				
				if(multipartRequest.getFilesystemName(name) != null) { // rename이 제대로 됐으면
					saveFiles.add(multipartRequest.getFilesystemName(name));
					originFiles.add(multipartRequest.getOriginalFileName(name)); // 원래이름 그대로
				}
			}
			
			String title = multipartRequest.getParameter("title");
			String content1 = multipartRequest.getParameter("content1");
			String content2 = multipartRequest.getParameter("content2");
			
			String content = content1 +"/////" + content2;
			String userId = ((Account)request.getSession().getAttribute("loginUser")).getId();
			int userNo = ((Account)request.getSession().getAttribute("loginUser")).getUserNo();
			String mName = multipartRequest.getParameter("mName");
			String fName = multipartRequest.getParameter("fName");
			int dtPeriod = Integer.parseInt(multipartRequest.getParameter("dtPeriod"));
			String fvDate = multipartRequest.getParameter("fvDate");
			
			Board b = new Board();
			b.setTitle(title);
			b.setContent(content);
			b.setUserId(userId);
			b.setUserNo(userNo);
			
			BestCouple bc = new BestCouple();
			bc.setmName(mName);
			bc.setfName(fName);
			bc.setDtPeriod(dtPeriod);
			bc.setFvDate(fvDate);
			
			
			ArrayList<Photo> fileList = new ArrayList<Photo>();
			// 역순으로 들어가있음
			for(int i = originFiles.size() -1; i>=0; i--) {
				Photo p = new Photo();
				p.setFilePath(savePath);
				p.setOriginName(originFiles.get(i));
				p.setChangeName(saveFiles.get(i));
				
				System.out.println(originFiles);
				//대표이미지 인지 아닌지를 구분해주는 if문
				if( i == originFiles.size()-1) {
					p.setFileLevel(0);
				} else {
					p.setFileLevel(1);
				}
				
				fileList.add(p);
			}
			int result = new WeAreCoupleService().insertThumbnail(b,bc,fileList);
			
			if(result > 0) {
				response.sendRedirect("list.wac");
			} else { // 실패한 파일은 등록이 되지않도록 하는것
				for(int i = 0; i< saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					failedFile.delete();
				}
				
				request.setAttribute("msg", "우리 커플 됐어요 게시판 등록에 실패하였습니다.");
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
