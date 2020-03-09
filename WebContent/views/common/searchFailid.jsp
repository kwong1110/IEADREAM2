<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<style>
.boxingBox{
	width: 300px;
	height:	130px;
	text-align: center;
    background-color: #ddd; 
   	transform: translate( 175%, 10% );
   	box-shadow: 1px 1px 1px;
	
}

</style>
</head>
<body>
	<%@ include file="../common/mainmenu.jsp"%>
	<div class="pageTitle">
	<h2 style="text-align: center; margin-top:100px;">아이디 찾기</h2>
	</div>
	
	<div class="boxingBox">
	<br><br>
	
	<div class="boxtext"></div>
	<h5 style="text-align:center; margin-top:17px;">입력하신 정보로 가입된 회원은 아이디는</h5>
	<h5 style="text-align:center;">존재하지 않습니다.</h5>
	</div>	
	
	<br><br>
	
	<div class="btnBox">
		<!-- 버튼 클릭하였을때 로그인 페이지 창으로 이동 -->
		<button type="submit" class="defaultBtn findid" id="btnfindid" onclick="location.href='<%= request.getContextPath() %>/views/account/accountLoginForm.jsp'">확인</button>
	</div>

</body>
</html>