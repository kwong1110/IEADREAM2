<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="account.model.vo.Account"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<style>
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
<%@ include file="../account/accountLoginForm.jsp"%>
	<div class ="outer">
	<h1 style="text-align: center;  margin-top:100px;">아이디 찾기</h1>
	<h5 style="text-align: center;">아이디가 기억나지 않으세요?</h5>
	<h5 style="text-align: center;">가입할때 입력하신 이메일 주소를 통해 아이디를 확인하실수 있습니다</h5>
	</div>
	
	<form action="views/common/searchid" method="post"></form>
	
	<div class ="textbox">
  		<h3 style="text-align: center;">▶이름</h3><input type="text" class="inputBox" name="findid" id="findid" placeholder="이름을 입력해주세요" >
 
 		<h3 style="text-align: center;">▶이메일</h3><input type="text" class="inputBox" name="findid" id="findid" placeholder="이메일을 입력해주세요" >
</div>
		<button type="submit" class="defaultBtn findid" id="btnfindid" onclick="location.href='<%= request.getContextPath() %>/Findeid.do'">아이디 찾기</button>
	<script>
	$(window).load(function(){
		$("#btnfindid").click(btnfind);
		
	});
	
	
	// 버튼 클릭시 실행되는 함수
	function btnfindid(event){
	
	// Email인 객체를 Email 라는 변수에 저장	
	var Eamil = $("#Email");
		
	
	// 이메일과 이름값을 입력하지 않았을때 뜨는 경고창	
	if(findid.val()==""){
		alert("이메일을 입력해주세요");
		return;

	}
	
	
	$.post("searchidForm.jsp",{
		Email:Email.val(),
		name : name.val()
	},function(data){
		alert(eval(data).result);
	});
	}
	</script>														 							
</body>
</html>