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

import board.model.service.bestCoupleService;
import board.model.vo.BestCouple;
import board.model.vo.Board;
import board.model.vo.Photo;
import common.MyFileRenamePolicy;

/**
 * Servlet implementation class bestCoupleUpdateServlet
 */
@WebServlet("/update.bc")
public class bestCoupleUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bestCoupleUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			
			int pNo = Integer.parseInt(multipartRequest.getParameter("pNo"));
			String title = multipartRequest.getParameter("title");
			String mName = multipartRequest.getParameter("mName");
			String fName = multipartRequest.getParameter("fName");
			int dtPeriod = Integer.parseInt(multipartRequest.getParameter("dtPeriod"));
			String fvDate = multipartRequest.getParameter("fvDate");
			String content = multipartRequest.getParameter("content");
			
			Board b = new Board();
			b.setPostNo(pNo);
			b.setTitle(title);
			b.setContent(content);
			
			BestCouple bc = new BestCouple();
			bc.setPostNo(pNo);
			bc.setmName(mName);
			bc.setfName(fName);
			bc.setDtPeriod(dtPeriod);
			bc.setFvDate(fvDate);
			
			ArrayList<Photo> pList = new ArrayList<Photo>();
			for(int i = originFiles.size() - 1; i >= 0; i--) {
				Photo pt = new Photo();
				pt.setPostNo(pNo);
				pt.setFilePath(savePath);
				pt.setOriginName(originFiles.get(i));
				pt.setChangeName(saveFiles.get(i));
				
				if(i == originFiles.size()-1) {
					pt.setFileLevel(0);
				} else {
					pt.setFileLevel(1);
				}
				
				pList.add(pt);
			}
			
			ArrayList<String> detailPhotoId = new ArrayList<String>();
			for(int i = 0; i < 2; i++) {
				detailPhotoId.add(multipartRequest.getParameter("detailPhotoId" + i));
			}
			
			ArrayList<String> changePhoto = new ArrayList<String>();
			changePhoto.add(multipartRequest.getParameter("cTitle"));
			for(int i = 0; i < 1; i++) {
				changePhoto.add(multipartRequest.getParameter("cContent" + (i+1)));
			}
			
			ArrayList<Photo> changeFile = new ArrayList<Photo>();
			ArrayList<Photo> newInsertFile = new ArrayList<Photo>();
			
			for(int h = 0; h < pList.size();) {
				for(int i = 0; i < 2; i++) {
					if(!detailPhotoId.get(i).equals("") && changePhoto.get(i).equals("data")) {
						pList.get(h).setPhotoNo(Integer.parseInt(detailPhotoId.get(i)));
						changeFile.add(pList.get(h));
						h++;
					}else if(detailPhotoId.get(i).equals("") && changePhoto.get(i).equals("data")) {
						newInsertFile.add(pList.get(h));
						h++;
					}
				}
			}
			
			int result = 0;
			
			if(changeFile.isEmpty() && newInsertFile.isEmpty()) {
				result = new bestCoupleService().updatePhoto(b, bc);
			} else if(!changeFile.isEmpty() && newInsertFile.isEmpty()) {
				result = new bestCoupleService().updatePhoto(b, bc, changeFile);
			} else if(changeFile.isEmpty() && !newInsertFile.isEmpty()) {
				result = new bestCoupleService().updatePhoto(b, bc, newInsertFile);
			} else {
				result = new bestCoupleService().updatePhoto(b, bc, changeFile, newInsertFile);
			}
			
			String page = "";
			if(result > 0) {
				page = "detail.bc?pNo=" + b.getPostNo();
			} else {
				for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					failedFile.delete();
				}
				
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "[이달의 베스트 커플] 게시글 수정에 실패하였습니다.");
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
