<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="account.model.vo.*, java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("user_name");
	String grade = request.getParameter("grade");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String gender = request.getParameter("gender");
	String birth = request.getParameter("birth");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board.css">
<style>
	*{box-sizing: border-box;}
	.content{width: 100%; height: 100%;}    
    
    table{width: 90%;}
    button{background-color: gray; color: white; border-radius: 10px; text-align: center; 
    		font-size: 20px; cursor: pointer; padding: 10px 20px; margin: 10px;}
    .minW{min-weight: 60px;}
    
    .profile{width: 300px; height: 30px; border: 1px solid gray; border-radius: 3px;}
</style>
</head>
<body>
	
	<%@ include file="../../common/mainmenu.jsp" %>

	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>기본 정보 수정</h1>
				</div>
				<div>
					<form action="<%= request.getContextPath() %>/update.mp" method="post" id="updateForm" name="updateForm" 
						style="font-size: 20px; text-align: center;">
						<table style="border-spacing: 20px;">
								<tr>
									<td class="minW">아이디</td>
									<td>
										<input type="text" placeholder="userID" class="profile" name="id" readOnly value="<%= id %>" style="background: lightgray;">
									</td>
								</tr>
								<tr>
									<td>이름</td>
									<td><input type="text" placeholder="이름을 입력해주세요" class="profile" name="user_name" id="user_name" value="<%= name %>"></td>
									<td><input type="text" name="nameResult" id="nameResult" readonly></td>
								</tr>
								<tr>
									<td>회원등급</td>
									<td><input type="text" class="profile" name="grade" readonly value="<%= grade %>"></td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td><input type="password" placeholder="비밀번호를 입력해주세요" class="profile" name="pass" id="pass"></td>
									<td><input type="text" name="passResult" id="passResult"></td>
								</tr>
								<tr>
									<td>비밀번호 확인</td>
									<td><input type="password" placeholder="비밀번호 확인" class="profile" name="passCheck" id="passCheck"></td>
									<td><input type="text" name="passResult2" id="passResult2"></td>
								</tr>
								<tr>
									<td>이메일</td>
									<td><input type="email" placeholder="메일을 입력해주세요" class="profile" name="email" value="<%= email %>"></td>
								</tr>
								<tr>
									<td>휴대전화</td>
									<td><input type="text" placeholder="휴대전화 번호를 입력해주세요" class="profile" name="phone" value="<%= phone %>"></td>
								</tr>
								<tr>
									<td>성별</td>
									<td><input type="text" class="profile" name="gender" readonly value="<%= gender %>"></td>
								</tr>
								<tr>
									<td>생년월일</td>
									<td><input type="text" class="profile" name="birth" readonly value="<%= birth %>"></td>
								</tr>
						</table>
						<div style="text-align: center;">
								<input id="updateBtn" type="submit" value="수정"> <!-- action으로 연결 -->
						</div>
					</form>
				</div>
			</div>
		</div>
	
		<script>
				$("#user_name").blur(function(){
					var nameExp = /^[가-힣]{2,}$/;
					
					if(!nameExp.test($(this).val())){
						$('#nameResult').val('잘못된 이름 입력').css('color', 'red');
						$(this).focus().css("background", "pink").val('');
					} else{
						$('#nameResult').val('정상 입력').css('color', 'green');
						$(this).css("background", "initial");
					}
				});
				
				$('#pass').blur(function(){
					var pwdExp = /[a-zA-Z](?=.*[a-zA-Z])(?=.*[!@#$%^&*])(?=.*[0-9]).{7,14}/;
					if(!pwdExp.test($('#pass').val())){
						$('#passResult').val("비밀번호 입력 오류").css('color', 'red');
						$('#pass').focus().css('background','pink');
					} else{
						$('#passResult').val("정상 입력").css('color', 'green');
						$(this).css("background","initial");
					}
				});
				
				$('#passCheck').keyup(function(){
					if($(this).val() != $('#pass').val()){
						$('#passResult2').val("비밀번호 불일치").css('color', 'red');
						$(this).focus().css('background', 'pink');
					} else{
						$('#passResult2').val("비밀번호 일치").css('color', 'green');
						$(this).css("background","initial");
					}
				});
				
				
		</script>

	</div>
</body>
<%@ include file="../../common/footer.jsp" %>
</html>