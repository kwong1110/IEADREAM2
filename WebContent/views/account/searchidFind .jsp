<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="account.model.vo.Account"%>
    
 <%
	Account a = (Account)request.getAttribute("account");
%>
 
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<style>

.pageTitle{
	text-align: center;
	margin-top: 300px;
}	
</style>

</head>
<body>  
	<div class="pageTitle">
		회원님의 아이디는 <%= a.getId() %> 입니다. 
		<!-- userId가져오는것  -->						
	</div>							
	 
	<div class="btnBox">
		<!-- 버튼 클릭하였을때 로그인 페이지 창으로 이동 -->
		<button type="submit" class="defaultBtn findid" id="btnfindid" onclick="location.href='<%= request.getContextPath() %>/views/account/accountLoginForm.jsp'">로그인하러 가기</button>
	</div>
</body>
</html>