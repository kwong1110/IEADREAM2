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
.pageTitletwo{
	text-align: center;
	margin-top: 200px;

}

.boxingBox{
	width: 300px;
	height:	150px;
	text-align: center;
    background-color: #ddd; 
   	transform: translate( 175%, -10% );
   	box-shadow: 2px 2px 2px;
	
}
.pageTitle{
	padding-left: 5px;
	font-size: 10spx; font-weight: 150px; vertical-align: middle; padding: 11px 11px 11px 11px; border-bottom: 3px solid pink;
	}
	
.img{
	width: 30%;
	height: 20%;
}	

</style>
</head>
<body>
	<%@ include file="../common/mainmenu.jsp"%>
	<div class ="pageTitle">
		<h1 style="text-align: left;  margin-top:60px; margin-left:350px;">아이디 찾기</h1>
	</div>
	
	<br><br>
	
	<h5 style="text-align:center; margin-top:30px;">입력하신 정보로 가입된 아이디가 있습니다</h5>
	
	<br><br>
	
	<div class="boxingBox" >
	<br><br>
	이름 : <%= a.getUserName() %>
	<!-- User이름 가져오는것 -->
	<br><br>
	
	이메일 : <%= a.getEmail() %>
	<!-- email값  가져오는것 -->
	<br><br>
	<br>
	
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