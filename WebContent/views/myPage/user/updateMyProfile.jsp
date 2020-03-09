<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="account.model.vo.*, java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
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
<title>이어드림 - 기본 정보 수정 </title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board.css">
<style>
	.listArea{width: 600px; margin: 0 0 10px 100px;}
	.tableArea tr {width: -webkit-fill-available;}
	.tableArea td {/* 게시판제목라인 */
		padding:20px 0;
		border-top:1px solid rgb(136, 136, 136); /* 상단라인색 */
		border-bottom:1px solid rgb(224, 224, 224); /* 하단라인색 */
		color:rgb(230, 141, 150); font-size:1em;/* 제목글자크기 */ 
		letter-spacing:0.1em;
		text-align: right;}/* 제목띠어쓰기간격 */ 
	.profile{font-size: 15px; padding: 2px; width: 80%; border:none; border-bottom: 1px solid rgb(224, 224, 224);}

	.btnBox{border-top: 1px solid rgb(224, 224, 224);}
	
	*:focus { outline:none; }
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
				<div class="tableArea">
					<form action="<%= request.getContextPath() %>/update.mp" method="post" 
					id="updateForm" name="updateForm" style="font-size: 20px; text-align: center;">
						<table class="listArea" style="border-spacing: 20px;">
								<tr>
									<td class="minW">아이디</td>
									<td>
										<input style="border: none;" type="text" placeholder="userID" 
										class="profile" name="id" readonly value="<%= id %>" style="background: lightgray;">
									</td>
									<td></td>
								</tr>
								<tr>
									<td>이름</td>
									<td><input type="text" 
										class="profile" name="user_name" id="user_name" readonly value="<%= name %>">
									</td>
									<td><input style="border: none;" type="text" name="nameResult" id="nameResult" readonly></td>
								</tr>
								<tr>
									<td>회원등급</td>
									<td><input style="border: none;" type="text" class="profile" name="grade" readonly value="<%= grade %>"></td>
									<td></td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td><input type="password" placeholder="비밀번호를 입력해주세요" class="profile" name="pass" id="pass" required></td>
									<td><input style="border: none;" readonly type="text" name="passResult" id="passResult"></td>
								</tr>
								<tr>
									<td>비밀번호 확인</td>
									<td><input type="password" placeholder="비밀번호 확인" class="profile" name="passCheck" id="passCheck" required></td>
									<td><input style="border: none;" readonly type="text" name="passResult2" id="passResult2"></td>
								</tr>
								<tr>
									<td>이메일</td>
									<td><input type="email" placeholder="메일을 입력해주세요" class="profile" name="email" required value="<%= email %>"></td>
									<td></td>
								</tr>
								<tr>
									<td>휴대전화</td>
									<td><input type="tel" placeholder="휴대전화 번호를 입력해주세요" class="profile" name="phone" required value="<%= phone %>"></td>
									<td></td>
								</tr>
								<tr>
									<td>성별</td>
									<td><input type="text" style="border: none;" class="profile" name="gender" readonly value="<%= gender %>"></td>
									<td></td>
								</tr>
								<tr>
									<td>생년월일</td>
									<td><input type="text" style="border: none;" class="profile" name="birth" readonly value="<%= birth %>"></td>
									<td></td>
								</tr>
						</table>
						<div class="btnBox">
								<input class="defaultBtn" id="updateBtn" type="submit" name="submit" value="수정"> <!-- action으로 연결 -->
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
		<script>
				
				$("#user_name").blur(function(){
					var nameExp = /^[가-힣]{2,}$/;
					
					if(!nameExp.test($(this).val())){
						$('#nameResult').val('이름 오류!').css('color', 'red');
						$(this).focus();
					} else{
						$('#nameResult').val('정상 입력 되었습니다').css('color', 'rgb(136, 136, 136)');
						$(this).css("background", "initial");
					}
				});
				
				$('#pass').blur(function(){
					var pwdExp = /[a-zA-Z](?=.*[a-zA-Z])(?=.*[!@#$%^&*])(?=.*[0-9]).{7,14}/;
					if(!pwdExp.test($('#pass').val())){
						$('#passResult').val("비밀번호 오류!").css('color', 'red');
						$('#pass').focus();
					} else{
						$('#passResult').val("정상 입력 되었습니다").css('color', 'rgb(136, 136, 136)');
						$(this).css("background","initial");
					}
				});
				
				$('#passCheck').keyup(function(){
					if($(this).val() != $('#pass').val()){
						$('#passResult2').val("비밀번호 불일치!").css('color', 'red');
						$(this).focus();
					} else{
						$('#passResult2').val("비밀번호 일치!").css('color', 'rgb(136, 136, 136)');
						$(this).css("background","initial");
					}
				});
				
		</script>

</body>
<%@ include file="../../common/footer.jsp" %>
</html>