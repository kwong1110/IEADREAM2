<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String user_name = request.getParameter("user_name");
	int grade = Integer.parseInt(request.getParameter("grade"));
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String gender = request.getParameter("gender");
	String birth = (String)request.getParameter("birth");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	<div class="container">
		
		<section class="content">
			<main>
				<div> <h1 style="padding: 5px;">기본정보</h1> </div>
				<div class="article" id="info" style="padding-left: 20%; padding-right: 20%;"> 
					<form action="<%= request.getContextPath() %>/update.ac" method="post" id="updateForm" name="updateForm" 
						style="font-size: 20px; text-align: center;">
						<table style="border-spacing: 20px;">
								<tr>
									<td class="minW">아이디</td>
									<td>
										<input type="text" placeholder="userID" class="profile" name="id" readOnly value="<%= id %>" style="background: lightgray;">
									</td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td><input type="text" placeholder="비밀번호를 입력해주세요" class="profile" name="pass"></td>
								</tr>
								<tr>
									<td>비밀번호 확인</td>
									<td><input type="text" placeholder="비밀번호 확인" class="profile" name="passCheck"></td>
									<td><input type="text" name="passResult">
								</tr>
								<tr>
									<td>이름</td>
									<td><input type="text" placeholder="이름을 입력해주세요" class="profile" name="user_name" value="<%= user_name %>"></td>
								</tr>
								<tr>
									<td>이메일</td>
									<td><input type="text" placeholder="메일을 입력해주세요" class="profile" name="email" value="<%= email %>"></td>
								</tr>
								<tr>
									<td>휴대전화</td>
									<td><input type="text" placeholder="휴대전화 번호를 입력해주세요" class="profile" name="phone" value="<%= phone %>"></td>
								</tr>
						</table>
					</form>
					<div style="text-align: center;">
						<input id="updateBtn" type="submit" value="확인"> <!-- action으로 연결 -->
						<div id="cancelBtn" onclick="location.href='javascript:history.go(-1)'">취소</div>
						<!-- 뒷페이지로 가기 -->
					</div>
				</div>
			</main>
		</section>
		<script>
			/* 비밀번호 형식이 맞을 때 / 맞지않을 때 */
			$('#pass').on('blur', function() {
				if($('#pass').val().trim().length >= 8 && $('#pass').val().trim().length <= 15) { //글자수 세기
					/* 규칙 : 영어로 시작, 숫자, 영어, 특문 !*& 필수 포함 */
					var passRule = /^[^0-9]*[a-zA-Z][0-9]+[!*&]+/g;
					if(!(passRule.test($('#pass').val()))) { /* 입력한 값이 false로 나오면 */
						$('#passResult').text("영어, 숫자와 특수문자(!*&) 중 하나가 들어가야 합니다");
						$('#passResult').css('color','red');
						pass.focus();
					} else { /* 입력한 값이 rule에 맞을 때 */
						/* passcheck에서 password가 일치하지 않았을 때 */
						$('#passCheck').on('keyup', function() {
							if($('#pass').val() == $('#passCheck')) {
								$('#passResult').text("비밀번호가 일치합니다");
								$('#passResult').css('color','black');
							} else {
								$('#passResult').text("비밀번호가 일치하지 않습니다");
								$('#passResult').css('color','red');
								passCheck.focus();
							}
						});
						/* password가 일치하지 않았을 때 끝 */
					}
				} else { //글자수 부족
					$('#passResult').text("비밀번호는 8자 이상 15자 이하여야합니다.");
					$('#passResult').css('color','red');
					pass.focus();
				}
			})
			/* 비밀번호 형식 확인 끝*/
		</script>

	</div>
</body>
</html>