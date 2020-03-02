<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"import="account.model.vo.Account"%>

<%
	Account account = (Account)request.getAttribute("account");
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원비밀번호 정보 출력!!</title>
</head>
<body>

    <p class="txt"><Strong class="black">
								<%=account.getPassword() %> 이메일로 임시 비밀번호 발송하였습니다 변경된 임시비밀번호로 
								로그인 해주세요!!</Strong></p>
								<!-- p가져오는것  -->
					
</body>
</html>