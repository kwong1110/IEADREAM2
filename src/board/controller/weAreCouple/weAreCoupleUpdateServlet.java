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
 * Servlet implementation class weAreCoupleUpdateServlet
 */
@WebServlet("/update.wac")
public class weAreCoupleUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public weAreCoupleUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) { // enctype이 multipart/form-data로 전송되었는지 확인
			int maxSize = 1024 * 1024 * 10; // 10Mbyte : 전송파일 용량 제한
			String root = request.getSession().getServletContext().getRealPath("/"); // 웹 서버 컨테이너 경로 추출
			String savePath = root + "photo_uploadFiles/";

			MultipartRequest multipartRequest 
				= new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();		// 바뀐 파일의 이름을 저장할 ArrayList
			ArrayList<String> originFiles = new ArrayList<String>();	// 원본 파일의 이름을 저장할 ArrayList
			
			Enumeration<String> files = multipartRequest.getFileNames();
			
			// 폼에서 전송된 파일들의 이름 반환
			while(files.hasMoreElements()) {
				String name = files.nextElement(); // 전송 순서의 역순으로 파일을 가져옴
				
				if(multipartRequest.getFilesystemName(name) != null) {
					// getFilesystemName(name) : MyFileRenamePolicy의 rename메소드에서 작성한 대로 rename된 파일명
					saveFiles.add(multipartRequest.getFilesystemName(name));
					originFiles.add(multipartRequest.getOriginalFileName(name));
				}
			}
			
			//int postNo = Integer.parseInt(multipartRequest.getParameter("postNo"));
			String postNo = multipartRequest.getParameter("postNo");
			
			System.out.println("update서블릿에 담겨져온 postNo : " + postNo);
			
			String title = multipartRequest.getParameter("title");
			//String userId = ((Account)request.getSession().getAttribute("loginUser")).getId();
			
			
			//String content = multipartRequest.getParameter("content");
			String content1 = multipartRequest.getParameter("content1");
			String content2 = multipartRequest.getParameter("content2");
			
			String content = content1 +"/////" + content2;
			
			
			
			String mName = multipartRequest.getParameter("mName");
			String fName = multipartRequest.getParameter("fName");
			int dtPeriod = Integer.parseInt(multipartRequest.getParameter("dtPeriod"));
			String fvDate = multipartRequest.getParameter("fvDate");
			
			
			Board b = new Board();
			//b.setPostNo(postNo);
			b.setTitle(title);
			b.setContent(content);
			//b.setUserId(userId);
			

			BestCouple bc = new BestCouple();
			bc.setmName(mName);
			bc.setfName(fName);
			bc.setDtPeriod(dtPeriod);
			bc.setFvDate(fvDate);
			
			
			ArrayList<Photo> fileList = new ArrayList<Photo>();
			for(int i = originFiles.size() -1; i >= 0; i--) {
				int post = Integer.parseInt(postNo);
				Photo at = new Photo();
				at.setPostNo(post);
				at.setFilePath(savePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				
				if(i == originFiles.size()-1) {
					at.setFileLevel(0);
				} else {
					at.setFileLevel(1);
				}
				fileList.add(at);
				
			}
			
			
			ArrayList<String> detailImgId = new ArrayList<String>();
			for(int i = 0; i < 4; i++) {
				detailImgId.add(multipartRequest.getParameter("detailImgId" + i));
			}
			
			ArrayList<String> changeImg = new ArrayList<String>();
			changeImg.add(multipartRequest.getParameter("cTitle"));
			for(int i = 0; i < 3; i++) {
				changeImg.add(multipartRequest.getParameter("cContent" + (i+1)));
			}

			
			ArrayList<Photo> changeFile = new ArrayList<Photo>();
			ArrayList<Photo> newInsertFile = new ArrayList<Photo>();
			
			for(int h = 0; h < fileList.size();) {
				for(int i = 0; i < 2; i++) {
					if(!detailImgId.get(i).equals("") && changeImg.get(i).equals("data")) { // 바꾼 파일
						fileList.get(h).setPhotoNo(Integer.parseInt(detailImgId.get(i)));
						changeFile.add(fileList.get(h));
						h++;
					} else if(detailImgId.get(i).equals("") && changeImg.get(i).equals("data")) { // 새로 넣은 파일
						newInsertFile.add(fileList.get(h));
						h++;
					}
				}
			}
			
			System.out.println("b");
			System.out.println(b);
			System.out.println();
			System.out.println("fileList");
			System.out.println(fileList);
			System.out.println();
			System.out.println("detailImgId");
			System.out.println(detailImgId);
			System.out.println();
			System.out.println("changeImg");
			System.out.println(changeImg);
			System.out.println();
			System.out.println("changeFile");
			System.out.println(changeFile);
			System.out.println();
			System.out.println("newInsertFile");
			System.out.println(newInsertFile);
			int result = 0;
			
			if(changeFile.isEmpty() && newInsertFile.isEmpty()) {
				result = new WeAreCoupleService().updatePhoto(b, bc, postNo);
			} else if(!changeFile.isEmpty() && newInsertFile.isEmpty()) {
				result = new WeAreCoupleService().updatePhoto(b,bc,  postNo,changeFile);
			} else if(changeFile.isEmpty() && !newInsertFile.isEmpty()) {
				result = new WeAreCoupleService().updatePhoto(b, bc, postNo, newInsertFile);
			} else {
				result = new WeAreCoupleService().updatePhoto(b, bc,  changeFile, newInsertFile,postNo);
			}
			
			String page = "";
			if(result > 0) {
				page = "detail.wac?postNo=" + postNo;
			} else {
				for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					failedFile.delete();
				}
				
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "사진 게시판 등록에 실패하였습니다.");
			}
			request.getRequestDispatcher(page).forward(request, response);
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
