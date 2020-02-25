package board.controller.bestCouple;

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
import board.model.service.bestCoupleService;
import board.model.vo.BestCouple;
import board.model.vo.Board;
import board.model.vo.Photo;
import common.MyFileRenamePolicy;

/**
 * Servlet implementation class bestCoupleInsertServlet
 */
@WebServlet("/insert.bc")
public class bestCoupleInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bestCoupleInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "photo_uploadFiles/";
			
			MultipartRequest multipartRequest
				= new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
	
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multipartRequest.getFileNames();
				
			while(files.hasMoreElements()) {
				String name = files.nextElement();
			
				if(multipartRequest.getFilesystemName(name) != null) {
					
					saveFiles.add(multipartRequest.getFilesystemName(name));
					originFiles.add(multipartRequest.getOriginalFileName(name));
				}
			}
			
			String title = multipartRequest.getParameter("title");
			int userNo = ((Account)request.getSession().getAttribute("loginUser")).getUserNo();
			String mName = multipartRequest.getParameter("mName");
			String fName = multipartRequest.getParameter("fName");
			int dtPeriod = Integer.parseInt(multipartRequest.getParameter("dtPeriod"));
			String fvDate = multipartRequest.getParameter("fvDate");
			String content = multipartRequest.getParameter("content");
			
			Board b = new Board();
			b.setTitle(title);
			b.setUserNo(userNo);
			b.setContent(content);
			
			BestCouple bc = new BestCouple();
			bc.setmName(mName);
			bc.setfName(fName);
			bc.setDtPeriod(dtPeriod);
			bc.setFvDate(fvDate);
			
			
			ArrayList<Photo> photoList = new ArrayList<Photo>();
			for(int i = originFiles.size() -1;  i >= 0; i--) {
				Photo pt = new Photo();
				pt.setFilePath(savePath);
				pt.setOriginName(originFiles.get(i));
				pt.setChangeName(saveFiles.get(i));
				
				if(i == originFiles.size()-1) {
					pt.setFileLevel(0);
				} else {
					pt.setFileLevel(1);
				}
				
				photoList.add(pt);
			}
				
			int result = new bestCoupleService().insertPhoto(b, bc, photoList);
			
			if(result > 0) {
				response.sendRedirect("list.bc");
			} else {
				for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					failedFile.delete();
				}
				
				request.setAttribute("msg", "[이달의 베스트 커플] 글 작성에 실패하였습니다.");
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
