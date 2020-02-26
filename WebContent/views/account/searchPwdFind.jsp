<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"import="account.model.vo.Account"%>

<%
	Account account = (Account)request.getAttribute("account");
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원아이디 정보 출력!!</title>
</head>
<body>

    <p class="txt"><Strong class="black">
								회원님의 아이디는 <%=account.getId() %> 입니다.</Strong></p>
								<!-- userId가져오는것  -->
					
</body>
</html>