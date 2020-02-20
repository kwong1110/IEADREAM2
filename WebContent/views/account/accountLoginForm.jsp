<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="account.model.vo.Account"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<style>
.inputBox{
	width: 200px;
	height: 25px;
	border-radius: 10px;
	margin: 4px;
}

.loginBox{
	margin-top: 35px;
	text-align: center;
}

.loginBtn{
	width: 300px;
}

.loginTitle{
	text-align: center;
	margin: 20px;
}

button {
	margin: 4px;
}
</style>
</head>
<body>
	<%@ include file="../common/mainmenu.jsp"%>
	<div class ="outer">
		<div class="wrapper">
	    	<div class="main">
	    		<div class="loginTitle">
	     			<h2>로그인</h2>
	     		</div>
	            <form action="<%= request.getContextPath() %>/login.me" onsubmit="return validate();" method="post">
		            <div class="loginBox">
		            	<div>
		                <label>&nbsp;&nbsp;&nbsp;아이디</label>
		                <input type="text" class="inputBox" name="userId" id="userId" placeholder="ID">
		                </div>
		                <div>
		                <label>비밀번호</label>
		                <input type="password" class="inputBox" name="userPwd" id="userPwd" placeholder="Password" >
		                </div>
		            </div>
		            <div class="btnBox">		            
			            <div>
			            <button type="submit" class="defaultBtn loginBtn" onclick="location.href='<%= request.getContextPath() %>/login.me'">로그인</button> 
			            </div>
			            <button type ="button" class="defaultBtn">아이디 찾기</button>
			            <button type ="button" class="defaultBtn">비밀번호 찾기</button>
			            <button type ="button" class="defaultBtn">회원가입</button>
		            </div>
	            </form>
             </div>
		</div>
	</div>
	<script>
		function validate(){
			if($('#userId').val().trim().length == 0){
				alert('아이디를 입력해주세요.');
				$('#userId').focus();
				
				return false;
			}
			
			if($('#userPwd').val().trim().length == 0){
				alert('비밀번호를 입력해주세요.');
				$('#userPwd').focus();
				
				return false;
			}
			
			return true;
		}
	</script>
</body>
</html>