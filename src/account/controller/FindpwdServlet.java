package account.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import account.model.service.AccountService;
import account.model.vo.Account;

/**
 * Servlet implementation class FindpwdServlet
 */
@WebServlet("/Findpwd.me")
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
		String userId = request.getParameter("userId");
		String email = request.getParameter("email");

		// VO에 있는 db에 보내기 위해서 만든객체이며 현재 지금은 바로 db에 보내지않고 userName 이랑 email을 담아두고 있다.
		Account findUser = new Account();
		findUser.setId(userId);
		findUser.setEmail(email);
		
		// userId랑 email을 보내준뒤 우리는 password를 찾으니 비밀번호 값을 가져오는것
		String password = new AccountService().searchPwd(findUser);
		
		String page = null;
		if (password != null){
			
			String imsiPw = "";
			ArrayList alphaNum = new ArrayList(); 
			
			char c = 'A';
			while(true) {
				alphaNum.add(c++);
				
				if(c == 'z') break;
			}
			
			for(int i = 0; i <= 9; i++) {
				alphaNum.add(i);
			}
			
			for(int i = 0; i < 6; i++) {
				int random = (int)(Math.random() * alphaNum.size());
				
				imsiPw += alphaNum.get(random);
			}
			
			final String sender = "pow2345@naver.com"; // 보내는 사람 ID (Ex: @naver.com 까지..)
			final String senderPassword = "tmddnrjekd1@"; // 보내는 사람 Password

			String host = "smtp.naver.com"; // 사용하는 메일

			// Get the session object
			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.auth", "true");

			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(sender, senderPassword);
				}
			});

			// Compose the message
			try {
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(sender));
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

				// sender Email Address
//				message.setFrom("테스트메일 : <" + sender + ">");
				message.setFrom(sender);

				// Subject
				message.setSubject("임시 비밀번호 전송");
					
				// Text
				message.setText("임시 비밀번호를 전송합니다. 임시 비밀번호는 " + imsiPw + " 입니다.", "UTF-8", "html");

				// send the message
				Transport.send(message);
				System.out.println("전송 완료!!!!");

			} catch (MessagingException e) {
				System.out.println("전송 실패!! ㅠㅠ");
				e.printStackTrace();
			}
			
			// 비밀번호 암호화 후 변경
			String encPwd = null;
			MessageDigest md = null;	
			
			try {
				md = MessageDigest.getInstance("SHA-512");
				
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			
			byte[] bytes = imsiPw.getBytes(Charset.forName("UTF-8"));
			md.update(bytes);
			encPwd = Base64.getEncoder().encodeToString(md.digest());
			
			int result = new AccountService().adminPwdUpdate(encPwd, userId);
			
			if(result > 0) {
				page = "views/account/searchPwdFind.jsp";
				System.out.println("비밀번호 찾기 완료!!");
				request.setAttribute("email", email);
			} else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "비밀번호 찾기에 실패하셨습니다.");
			}
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "비밀번호 찾기에 실패하셨습니다.");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}
		

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
