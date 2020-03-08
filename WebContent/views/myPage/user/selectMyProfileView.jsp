<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="account.model.vo.Account, java.util.Date"%>
<%
	Account a = (Account)request.getAttribute("account");

	String id = a.getId();
	String password = a.getPassword();
	String name = a.getUserName();
	int grade = a.getGrade();
	String phone = a.getPhone();
	String email = a.getEmail();
	String gender = a.getGender();
	Date birth = a.getBirth();
	
	String gr = null;
	switch(grade) {
	case 0: gr = "관리자"; break;
	case 1: gr = "준회원"; break;
	case 2: gr = "정회원"; break;
	}
	
	String ge = null;
	switch(gender) {
	case "F": ge = "여자"; break;
	case "M": ge = "남자"; break;
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이어드림 - 기본 정보</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board.css">
<style>
	.listArea{width: 600px; margin:0 0 100px 100px;}
	.tableArea tr { width: -webkit-fill-available;}
	.tableArea td {/* 게시판제목라인 */
		padding:20px 0;
		border-top:1px solid rgb(136, 136, 136); /* 상단라인색 */
		border-bottom:1px solid rgb(224, 224, 224); /* 하단라인색 */
		color:rgb(230, 141, 150); font-size:1em;/* 제목글자크기 */ 
		letter-spacing:0.1em;
		text-align: right;}/* 제목띠어쓰기간격 */
	.tableArea {width: 100%; align: center;}
	
	input{font-size: 15px; padding: 2px; width: 80%;}

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
					<h1>기본 정보</h1>
				</div>
				<div class="tableArea" style="padding: 30px;">
					<form action="<%= request.getContextPath() %>/views/myPage/user/updateMyProfile.jsp" method="post" id="updateForm" name="updateForm" 
						style="font-size: 20px; text-align: center;">
						<table class="listArea" style="border-spacing: 20px;">
								<tr>
									<td class="minW">아이디</td>
									<td>
										<input style="border: none;" type="text" placeholder="userID" class="profile" name="id" readOnly value="<%= id %>" style="background: lightgray;">
										<input type="hidden" name="pwd" value="<%= password %>">
									</td>
								</tr>
								<tr>
									<td>이름</td>
									<td><input style="border: none;" type="text" placeholder="이름을 입력해주세요" class="profile" name="user_name" readOnly value="<%= name %>"></td>
								</tr>
								<tr>
									<td>회원등급</td>
									<td><input style="border: none;" type="text" class="profile" name="grade" readonly value="<%= gr %>"></td>
								</tr>
								<tr>
									<td>이메일</td>
									<td><input style="border: none;" type="text" placeholder="메일을 입력해주세요" class="profile" name="email" readonly  value="<%= email %>"></td>
								</tr>
								<tr>
									<td>휴대전화</td>
									<td><input style="border: none;" type="tel" placeholder="휴대전화 번호를 입력해주세요" class="profile" name="phone" readonly value="<%= phone %>"></td>
								</tr>
								<tr>
									<td>성별</td>
									<td><input style="border: none;" type="text" class="profile" name="gender" readonly value="<%= ge %>"></td>
								</tr>
								<tr>
									<td>생년월일</td>
									<td><input style="border: none;" type="text" class="profile" name="birth" readonly value="<%= birth %>"></td>
								</tr>
						</table>
						<div class="btnBox">
								<button  class="defaultBtn" type="submit" id="updateBtn">수정</button> <!-- action으로 연결 -->
								<button class="defaultBtn cancelBtn" type="button" id="deleteAcBtn" onclick="goToDelete();">탈퇴</button>
								
								<!-- 탈퇴 확인을 위한 페이지 -->
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
				
				function goToDelete() {
					location.href='<%= request.getContextPath() %>/views/myPage/user/deleteAcCheck.jsp';
				}
		</script>

	</div>
</body>
<%@ include file="../../common/footer.jsp" %>
</html>