<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"import="account.model.vo.Account"%>

<%
	String password = (String)request.getAttribute("password");
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원비밀번호 정보 출력!!</title>
</head>
<body>
 	<div class="pageTitle">
 		아이디 찾기
 	</div>
  	<div class="pageTitletext">
		회원님의 비밀번호는  <%= password %> 입니다.
		<!-- userPassword  -->						
	</div>				
	
	<div class="btnBox">
		<!-- 버튼 클릭하였을때 로그인 페이지 창으로 이동 -->
		<button type="submit" class="defaultBtn findid" id="btnfindid" onclick="location.href='<%= request.getContextPath() %>/views/account/accountLoginForm.jsp'">로그인하러 가기</button>
	</div>			
</body>
</html>