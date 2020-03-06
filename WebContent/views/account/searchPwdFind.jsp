<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String password = (String)request.getAttribute("password");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<style>
.boxingBox{
	width: 300px;
	height:	150px;
	text-align: center;
    background-color: #ddd; 
   	transform: translate( 175%, -10% );
   	box-shadow: 5px 5px 5px;

}

.btmbox{
	text-align: center;
}

.pageTitle{
	text-align: center;
	margin-top: 200px;

}
</style>
</head>

<body>
 	<div class="pageTitle">
		<h2 style="text-align: center;">비밀번호 찾기</h2>
	</div>
  	
  	<div class="boxingBox" >
  		<br><br><br>
		회원님의 비밀번호는 <%= password %>입니다.
		<!-- userPassword 결과값 출력!! ㅠㅠ  -->						
	</div>				
	
	<div class="btnBox">
		<!-- 버튼 클릭하였을때 로그인 페이지 창으로 이동 -->
		<button type="submit" class="defaultBtn findid" id="btnfindid" onclick="location.href='<%= request.getContextPath() %>/views/account/accountLoginForm.jsp'">로그인하러 가기</button>
	</div>			
</body>
</html>