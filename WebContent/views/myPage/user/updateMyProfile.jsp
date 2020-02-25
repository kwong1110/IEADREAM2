<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="account.model.vo.*, java.util.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	Account account = (Account)request.getAttribute("account");

	String id = account.getId();
	String name = account.getUserName();
	String password = account.getPassword();
	int grade = account.getGrade();
	String email = account.getEmail();
	String phone = account.getPhone();
	String gender = account.getGender();
	Date birth = account.getBirth();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
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
					<h1>기본 정보</h1>
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
									<td><input type="text" placeholder="이름을 입력해주세요" class="profile" name="user_name" value="<%= name %>"><%= name %></td>
									<td><input type="text" name="nameResult"></td>
								</tr>
								<tr>
									<td>회원등급</td>
									<td><input type="text" class="profile" name="grade" readonly value="<%= grade %>"><%= grade %></td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td><input type="text" placeholder="비밀번호를 입력해주세요" class="profile" name="pass" value="<%= password %>"></td>
									<td><input type="text" name="passResult"></td>
								</tr>
								<tr>
									<td>비밀번호 확인</td>
									<td><input type="text" placeholder="비밀번호 확인" class="profile" name="passCheck"></td>
									<td><input type="text" name="passResult2"></td>
								</tr>
								<tr>
									<td>이메일</td>
									<td><input type="text" placeholder="메일을 입력해주세요" class="profile" name="email" value="<%= email %>"><%= email %></td>
								</tr>
								<tr>
									<td>휴대전화</td>
									<td><input type="text" placeholder="휴대전화 번호를 입력해주세요" class="profile" name="phone" value="<%= phone %>"><%= phone %></td>
								</tr>
								<tr>
									<td>성별</td>
									<td><input type="text" class="profile" name="gender" readonly value="<%= gender %>"><%= gender %></td>
								</tr>
								<tr>
									<td>생년월일</td>
									<td><input type="text" class="profile" name="birth" readonly value="<%= birth %>"><%= birth %></td>
								</tr>
						</table>
						<div style="text-align: center;">
								<input id="updateBtn" type="submit" value="수정"> <!-- action으로 연결 -->
								
								<!-- 탈퇴 확인을 위한 페이지 -->
								<input id="deleteAcBtn" onclick="location.href='views/deleteAcCheck.jsp'" value="탈퇴">
						</div>
					</form>
				</div>
			</div>
		</div>
	
		<script>
				$('#pass').blur(function(){
					var pwdExp = /[a-zA-Z](?=.*[a-zA-Z])(?=.*[!@#$%^&*])(?=.*[0-9]).{7,14}/;
					if(!pwdExp.test($(this).val())){
						$('#passResult').text("비밀번호 입력 오류").css('color', 'red');
						$(this).focus().css('background','pink');
					} else{
						$('#passResult').text("정상 입력").css('color', 'green');
						$(this).css("background","initial");
					}
				});
				
				$('#passCheck').keyup(function(){
					if($(this).val() != $('#pass').val()){
						$('#passResult1').text("비밀번호 불일치").css('color', 'red');
						$(this).focus().css('background', 'pink');
					} else{
						$('#passResult1').text("비밀번호 일치").css('color', 'green');
						$(this).css("background","initial");
					}
				});
				
				
				$("#user_name").change(function(){
					var nameExp = /[가-힣]{2,}/;
					
					if(!nameExp.test($(this).val())){
						$('#nameResult').text('잘못된 이름 입력').css('color', 'red');
						$(this).focus().css("background", "pink").val('');
					} else{
						$('#nameResult').text('정상 입력').css('color', 'green');
						$(this).css("background", "initial");
					}
				});
		</script>

	</div>
</body>
</html>