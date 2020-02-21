<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="account.model.vo.Account"%>
<%
	Account account = (Account)request.getAttribute("account");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 성공했을때 페이지</title>
</head>
<body>
		<!-- 아이디 찾기 성공했을때  정보 출력하는곳 -->
		회원님의 아이디는 <%=account.id()%>입니다
</body>
</html>