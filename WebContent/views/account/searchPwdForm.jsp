<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="account.model.vo.Account"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<style>
.btn-commite {
	width: 24.5%;
    height: 48px;
    border-radius: 3px;
    font-size: 20px;
    color: #fff;
    background-color:#848484;
    margin-left: 510px;
 
}
.inputBox{
	width: 300px;
	height: 25px;
	border-radius: 10px;
	margin: 4px;
	text-align: center;
	align: center;

}
.loginBox{
	margin-top: 35px;
	text-align: center;
}
.button {
	margin: 4px;
	text-align: center;
}

.textbox{
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="../common/mainmenu.jsp"%>
	<div class ="pageTitle">
		<h1 style="text-align: center; margin-top:100px;">비밀번호 찾기</h1>
		<br><br>
		
		<h5 style="text-align: center;">비밀번호가 기억나지 않으세요?</h5>
		<h5 style="text-align: center;">가입할때 입력하신 아이디 이메일 주소를 통해 비밀번호를 확인하실수 있습니다.</h5>
		<br><br>
	</div>
	
	<form action="<%= request.getContextPath() %>/Findpwd.me" onsubmit="return passworddate();" method="post">
		<div class = "textbox">
	  		<h3>▶아이디</h3><input style="text-align: center;"  type="text" class="inputBox" name="userId" id="findid" placeholder="아이디를 입력해주세요" >	
	 		<h3>▶이메일</h3><input style="text-align: center;"  type="text" class="inputBox" name="email" id="Inputemail" placeholder="이메일를 입력해주세요">
		</div>
		<div class="btnBox">
			<button type="submit" class="defaultBtn" id="btnfindid">비밀번호 찾기</button>
		</div>
	</form>
	<script>
	function passworddate(){
		if($('#findid').val().trim().length == 0){
			alert('아이디를 입력해주세요.');
			$('#findid').focus();
			
			return false;
		}
		
		if($('#Inputemail').val().trim().length == 0){
			alert('이메일을 입력해주세요');
			$('#Inputemail').focus();
			
			return false;
		}
		
		return true;
	}
	
	</script>
</body>
</html>