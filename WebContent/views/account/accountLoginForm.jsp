<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="account.model.vo.Account"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 </title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<style>
.inputBox{
	width: 180px;
	height: 25px;
	border-radius: 10px;
	margin: 4px;
	text-align: center;
}
.loginBox{
	margin-top: 35px;
	text-align: center;
	
}
.loginBtn{
	width: 300px;
}

.logintitle{

	text-align: center;

}


#p{
	width: 100px;
	height: 100px;

}
</style>
</head>
<body>
	<%@ include file="../common/mainmenu.jsp"%>
		<div class="logintitle" >
	    <h2 style= "margin-top:120px">로그인</h2>
	    </div>	
	            <form id="loginForm" action="<%= request.getContextPath() %>/login.me" onsubmit="return validate();" method="post">
		            <div class="loginBox">
		            
						<div class="loginBox">
		                	<label>&nbsp;&nbsp;아이디</label>&nbsp;&nbsp;&nbsp;<input type="text" class="inputBox" name="userId" id="userId2" placeholder="ID">
		                </div>
		                
		                <label>비밀번호</label>&nbsp;&nbsp;<input type="password" class="inputBox" name="userPwd" id="userPwd2" placeholder="PASSWORD" >
		                </div>
		                
		   
		            <div class="btnBox">
		           		            
			            <div>
			            <button type="submit" class="defaultBtn loginBtn">로그인</button> 
			            </div>
			            
			            <br>
			            
			             <!-- 아이디 찾기 눌렀을때 searchidForm 으로 넘어 가기... -->
			            <button type ="button"class="defaultBtn" onclick="location.href='<%= request.getContextPath() %>/views/account/searchIdForm.jsp'">아이디 찾기</button>
						
						<!-- 비밀번호 찾기 눌렀을때 searchPwdForm 으로 넘어가기... -->	
			            <button type ="button" class="defaultBtn" onclick="location.href='<%= request.getContextPath() %>/views/account/searchPwdForm.jsp'">비밀번호 찾기</button>
			            <button type ="button" class="defaultBtn" onclick="joinAccount();">회원가입</button>
		            </div>
	            </form>
            
	<script>
		function validate(){
			if($('#userId2').val().trim().length == 0){
				alert('아이디를 입력해주세요.');
				$('#userId2').focus();
				
				return false;
			}
			
			if($('#userPwd2').val().trim().length == 0){
				alert('비밀번호를 입력해주세요.');
				$('#userPwd2').focus();
				
				return false;
			}
			
			return true;
		}
		
		
		<%-- $(function(){
			if("<%= msg %>" != "null" && "<%= msg %>" === "아이디가 존재하지 않습니다."){
				alert("<%= msg %>");
			} else if("<%= msg %>" != "null" && "<%= msg %>" === "비밀번호가 일치하지 않습니다."){
				
				var bool = confirm("비밀번호가 일치하지 않습니다.\n 비밀번호를 찾으시겠습니까?" + failCount);
				
				if(bool){
					location.href='<%= request.getContextPath() %>/views/account/searchPwdForm.jsp';
				} 
			}
		}); --%>
		
		function goIndex(){
			location.href="<%= request.getContextPath()%>/views/common/mainmenu.jsp";
		}
		

		function joinAccount(){
			location.href="<%= request.getContextPath() %>/views/account/joinAccountForm.jsp";
		}
		
	</script>
</body>
</html>