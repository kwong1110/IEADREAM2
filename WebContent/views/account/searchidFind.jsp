<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="account.model.vo.Account"%>
    
 <%
	Account a = (Account)request.getAttribute("a");
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
	margin-top: 200px;

}

.pageTitletwo{
	text-align: center;
	margin-top: 200px;

}

.boxingBox{
	width: 300px;
    background-color: #ddd;
    text-align: center;
	

}
</style>
</head>
<body>

	<div class="pageTitle">
	<h2 style="text-align: center;">아이디 찾기</h2>
	<h5 style="text-align: center;">입력하신 정보로 가입된 아이디가 있습니다</h5>
	</div>
	
	<div class="boxingBox" >
	이름 : <%= a.getUserName() %>
	<br><br>
	
	이메일 : <%= a.getEmail() %>
	<br><br>
	
	아이디: <%= a.getId() %>
	<!-- userId가져오는것  -->
	</div>

	<div class="btnBox">
		<!-- 버튼 클릭하였을때 로그인 페이지 창으로 이동 -->
		<button type="submit" class="defaultBtn findid" id="btnfindid" onclick="location.href='<%= request.getContextPath() %>/views/account/accountLoginForm.jsp'">로그인</button>
		<button type="submit" class="defaultBtn findid" id="btnfindid" onclick="location.href='<%= request.getContextPath() %>/views/account/searchPwdForm.jsp'">비밀번호 찾기</button>
	</div>
</body>
</html>