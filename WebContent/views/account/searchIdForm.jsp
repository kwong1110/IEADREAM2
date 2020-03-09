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
	
}
.button {
	text-align: center;
	margin: 4px;
}
.textbox{
	text-align: center;
	}
.pagetext{
	margin-top: 30px;
}	
</style>
</head>
<body>
	<%@ include file="../common/mainmenu.jsp"%>
	<div class ="pageTitle">
		<h1 style="text-align:center;  margin-top:100px;">아이디 찾기</h1>		
		<br><br>
		<h5 style="text-align: center;">아이디가 기억나지 않으세요?</h5>
		<h5 style="text-align: center;">가입할때 입력하신 이메일 주소를 통해 아이디를 확인하실수 있습니다</h5>
		<br><br>
	</div>	
		
		<!-- view 단에서 서블릿을 연결해주는 코드 -->
		<form action="<%= request.getContextPath() %>/Findeid.do" onsubmit="return IDdate();" method="post">
		<div class ="textbox">
		 <h3 style="text-align: center;">▶이름</h3><input type="text"  class="inputBox" name="userName" id="userName2" placeholder="이름을 입력해주세요" >
		 <h3 style="text-align: center;">▶이메일</h3><input type="text" class="inputBox" name="email" id="email2" placeholder="이메일을 입력해주세요" >
		</div>
		
			<div class="btnBox">
				<button type="submit" class="defaultBtn findid" id="btnfindid">아이디 찾기</button> 
			</div>
		</form>
		<script>
		function IDdate(){
			if($('#userName2').val().trim().length == 0){
				alert('이름을 입력해주세요');
			$('#userName2').focus();
			
			return false;
			}
		
			if($('#email2').val().trim().length == 0){
				alert('이메일을 입력해주세요');
				$('#email2').focus();
				
			 return false;
			 }
		
			return true;
		}

		</script>									 							
</body>
</html>