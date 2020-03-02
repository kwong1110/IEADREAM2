<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="account.model.vo.Account"%>
    
 <%
	String id = (String)request.getAttribute("id");
%>
 
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기후 값 출력</title>
</head>
<body>
	
    <p class="txt"><Strong class="black">
								회원님의 아이디는 <%= id %> 입니다.</Strong></p>
								<!-- userId가져오는것  -->

</body>
</html>