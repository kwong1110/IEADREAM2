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
}

.textbox{

	align: center;
}



</style>
</head>
<body>
	<%@ include file="../common/mainmenu.jsp"%>
	<div class ="outer">
	<h1 style="text-align: center; margin-top:100px;">비밀번호 찾기</h1>
	<br><br>
	<h5 style="text-align: center;">비밀번호가 기억나지 않으세요?</h5>
	<h5 style="text-align: center;">가입할때 입력하신 아이디 이메일 주소를 통해 비밀번호를 확인하실수 있습니다.</h5>
	<br><br>
		<div class="mx-auto search-bar input-group mb-3" style="width: 500px;">
	<div class="input-group mb-3">
		<br><br>
  		<h6>▶아이디</h6><input style="text-align: center;"  type="text" class="inputBox" name="findid" id="findid" placeholder="아이디를 입력해주세요" >	
 	</div>
 </div>
 	<h6>▶이메일</h6><input style="text-align: center;"  type="text" class="inputBox" name="findid" id="findid" placeholder="이메일를 입력해주세요" >
	</div>
		<br><br>
		
			<button type="submit" class="defaultBtn findid" id="btnfindid" onclick="location.href='<%= request.getContextPath() %>/Findeid.do'">임시비밀번호 발급</button>
	
	<script>
	$(window).load(function(){
		$("#btnfindpwd").click(btnfindpwd);	
	});
	
	
	function btnfindpwd(event){
		var id = $("#findid");
		if(id.val()==""){
			alert("아이디를 입력하세요");
			return;
		
		}

	
	var name = $("#email");
	if(name.val() == ""){
		alert("이메일 입력하세요");
		return;
		
	
	}
	
	
	
	</script>
</body>
</html>