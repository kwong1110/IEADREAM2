package com.kh.test.mail.controller;

import java.io.IOException;
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

/**
 * Servlet implementation class SendMailServlet
 */
@WebServlet("/send.do")
public class SendMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SendMailServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 1. 전달받은 값 인코딩
		// - 전송할 값은 html이 아닌 다른 프로토콜로 전송할 것이기 때문에
		// 현재는 별도 인코딩을 하지 않습니다.
		request.setCharacterEncoding("UTF-8");

		final String sender = "rosemary4110@naver.com"; // 보내는 사람 ID (Ex: @naver.com 까지..)
		final String password = "tngus0114"; // 보내는 사람 Password

		String receiver = request.getParameter("receiver"); // 받는 사용자 (Ex: @naver.com 까지..)
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String host = "smtp.naver.com"; // 사용하는 메일

		System.out.println("---------recv Data Check--------");
		System.out.println("recvID : " + receiver);
		System.out.println("title : " + title);
		System.out.println("content : " + contents);
		System.out.println("--------------------------");

		// Get the session object
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, password);
			}
		});

		// Compose the message
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(sender));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));

			// sender Email Address
//			message.setFrom("테스트메일 : <" + sender + ">");
			message.setFrom(sender);

			// Subject
			message.setSubject("[TEST-Mail-Service] " + title);
				
				

			// Text
			message.setText(contents, "UTF-8", "html");

			// send the message
			Transport.send(message);
			System.out.println("전송 완료!!!!");

		} catch (MessagingException e) {
			System.out.println("전송 실패!! ㅠㅠ");
			e.printStackTrace();
		}

	}
	
	public static String randomPassword(int length){

		
		 // 랜덤 아무값이나 임시 비밀번호 전송칸 ... 하  ....어려워 어디다 넣어둬야 할까..
		// 어쨋든 메일로 발송하는거니깐 sendMailServlet 에 넣어도 돼지 않을까??
		int index = 0;
		char[] charset = new char[] {
		'0','1','2','3','4','5','6','7','8','9'
		,'A','B','C','D','E','F','G','H','I','J','K','L','M'
		,'N','O','P','Q','R','S','T','U','V','W','X','Y','Z'
		,'a','b','c','d','e','f','g','h','i','j','k','l','m'
		,'n','o','p','q','r','s','t','u','v','w','x','y','z'
		
		};
		
		
		StringBuffer pwd = new StringBuffer();
		for(int i = 0 ; i<length ; i++){

		index = (int) (charset.length * Math.random());

		pwd.append(charset[index]);
		//문자열 데이터 끝에 문자의 형태로 추가...??

		}

		return sb.toString();

		}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
