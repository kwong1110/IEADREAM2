<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>이어드림 - 회원가입</title>
<style>
	
	.contents{
		text-align: left;
		width: 800px;
		border: 8px solid pink;
		box-shadow: 3px 3px 3px 3px gray;
	}
	
	.table{
		margin-top: 8%;
		margin-left: 25%;
	}
	
	.table td {
		padding-bottom: 5%;
	}
	
	#dubtn{
		margin-left: 23%;
		font-size: 12px;
	}
	
	.msg{
		margin-left: 23%;
	}
	
	.box{
		width: 200px;
		height: 25px;
		border-radius: 8px;
		margin-left: 20%;
	}
	
	.rdbox{
		margin-left: 20%;
	}
	
	.btnBox{
		margin-left: 630px;
		padding: 5% 0 1% 0;
	}
	
	.cancel{
		background: lightgray;
	}
	
</style>
</head>
<body>
	<%@ include file="../common/mainmenu.jsp" %>
	<section>
		<div class="outer">
			<div class="wrapper">
				<div class="main">
					<div class="pageTitle"><h1>회원가입</h1></div>
					<form action="<%= request.getContextPath() %>/insert.ac" method="post" class="contents" id="contents" name="joinForm" onsubmit="return validate();">
						<div class="table">
							<table>
								<tr>
									<td>아이디</td>
									<td><input type="text" name="joinUserId" id="joinUserId" class="box" placeholder=" 6~12자의 영문,숫자" required></td>
									<td><button type="button" id="dubtn" class="defaultBtn" onclick="checkId();">중복체크</button></td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td><input type="password" name="joinUserPwd" id="joinUserPwd" class="box" placeholder=" 8~15자의 영문,숫자,특수문자 " maxlength="15" required></td>
									<td style="width:200px"><label id="pwdResult1" class="msg"></label></td>
								</tr>
								<tr>
									<td>비밀번호 확인</td>
									<td><input type="password" name="joinUserPwd2" id="joinUserPwd2" class="box" maxlength="15" required></td>
									<td><label id="pwdResult2" class="msg"></label></td>
								</tr>
								<tr>
									<td>이름</td>
									<td><input type="text" name="userName" id="userName" class="box" required></td>
									<td><label id="nameResult" class="msg"></label></td>
								</tr>
								<tr>
									<td>휴대전화</td>
									<td><input type="tel" name="phone" placeholder="  (-없이)01012345678" class="box" required></td>
								</tr>
								<tr>
									<td>이메일</td>
										<td><input type="text" name="email" class="box" id="email" required></td>
										<td><button type="button" id="dubtn" class="defaultBtn" onclick="checkEmail();">중복체크</button></td>
								</tr>
								<tr>
									<td>성별</td>
									<td>
										<label><input type="radio" name="gender" value="M" class="rdbox" required checked>남자</label>
										<label><input type="radio" name="gender" value="F" class="rdbox" required>여자</label>
									</td>
								</tr>
								<tr>
									<td>생년월일</td>
									<td><input type="date" name="birth" class="box" required></td>
								</tr>
							</table>
						</div>
						
						<div class="btnBox">
							<button type="submit" id="joinBtn" class="defaultBtn" value="1단계완료">다음단계</button>
							<button type="reset" id="goMain" class="defaultBtn cancel" onclick="goMain();">취소</button>
						</div>
					</form>
				</div>	
			</div>
		</div>
	</section>
	
	
	
	<script>
	$(function(){
		$('input').focusin(function(){
			$(this).css('box-shadow', '1px 1px 5px skyblue');
		}).focusout(function(){
			$(this).css('box-shadow', 'none');
		});
	});
	
	
	$(function checkId(){
		var isUsable = false;
		var isIdChecked = false;
		
		$('#joinUserId').on('change paste keyup', function(){
			isIdChecked = false;			
		});
	});
	
	$(function checkEmail(){
		var isEmUsable = false;
		var isEmailChecked = false;
		
		$('#email').on('change paste keyup', function(){
			isEmailChecked = false;			
		});
	});
	
	
	$(function(){
		var isId, isEmail, isPwd1, isPwd2, isName = false;
		
		$("#joinUserId").change(function(){
			var idExp = /^[a-zA-Z](?=.*[a-zA-Z])(?=.*[0-9]).{5,11}$/;
			var userId = $('#joinUserId');
			
			if(!idExp.test($(this).val())){
				alert('아이디는 영문과 숫자로 이루어진 6~12자 이어야 합니다.')
				$(this).focus().css("background","pink").val('');
				isId = false;
			} else{
				$.ajax({
					url: "<%= request.getContextPath()%>/idCheck.ac",
					type: "post",
					data: {joinUserId:userId.val()},
					success: function(data){
						if(data == 'success'){
							alert('사용 가능한 아이디입니다.');
							$('#joinUserId').css("background","white");
							isUsable = true;
							isIdChecked = true;
							isId = true;
						} else{
							alert('이미 사용 중인 아이디입니다.');
							$('#joinUserId').focus().css("background","pink").val('');
							isUsable = false;
							isIdChecked = false;
							isId = false;
						}
					}
				});
			}
		});
		
		
		$("#email").change(function(){
			var emExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			var email = $('#email');
			
			if(!emExp.test($(this).val())){
				alert('이메일을 올바르게 입력해주세요.')
				$(this).focus().css("background","pink").val('');
				isEmail = false;
			} else{
				$.ajax({
					url: "<%= request.getContextPath()%>/emailCheck.ac",
					type: "post",
					data: {email:email.val()},
					success: function(data){
						if(data == 'success'){
							alert('사용 가능한 이메일입니다.');
							$('#email').css("background","white");
							isEmUsable = true;
							isEmailChecked = true;
							isEmail = true;
						} else{
							alert('이미 사용 중인 이메일입니다.');
							$('#email').focus().css("background","pink").val('');
							isEmUsable = false;
							isEmailChecked = false;
							isEmail = false;
						}
					}
				});
			}	
		});
		
		
		function validate(){
			if(isUsable && isIdChecked && isEmUsable && isEmailChecked){
				return true;
			} else{
				alert('아이디와 이메일 중복확인을 해주세요.');
				return false;
			}
		}
		
		
		$('#joinUserPwd').blur(function(){
			var pwdExp = /[a-zA-Z](?=.*[a-zA-Z])(?=.*[!@#$%^&*])(?=.*[0-9]).{7,14}/;
			
			if(!pwdExp.test($(this).val())){
				$('#pwdResult1').text("비밀번호 입력 오류").css('color', 'red');
				$(this).focus().css('background','pink');
				isPwd1 = false;
			} else{
				$('#pwdResult1').text("정상 입력").css('color', 'rgb(136, 136, 136)');
				$(this).css("background","initial");
				isPwd1 = true;
			}
		});
		
		$('#joinUserPwd2').keyup(function(){
			if($(this).val() != $('#joinUserPwd').val()){
				$('#pwdResult2').text("비밀번호 불일치").css('color', 'red');
				$(this).focus().css('background', 'pink');
				isPwd2 = false;
			} else{
				$('#pwdResult2').text("비밀번호 일치").css('color', 'rgb(136, 136, 136)');
				$(this).css("background","initial");
				isPwd2 = true;
			}
		});
		
		
		$("#userName").change(function(){
			var nameExp = /[가-힣]{2,}/;
			
			if(!nameExp.test($(this).val())){
				$('#nameResult').text('잘못된 이름 입력').css('color', 'red');
				$(this).focus().css("background", "pink").val('');
				isName = false;
			} else{
				$('#nameResult').text('정상 입력').css('color', 'rgb(136, 136, 136)');
				$(this).css("background", "initial");
				isName = true;
			}
		});
		
		
		$('#contents').submit(function(){
			if(isId && isEmail && isPwd1 && isPwd2 && isName){
				return true;
			} else{
				alert('회원가입 폼에 맞춰주세요.');
				if(!isId) $('#joinUserId').focus();
				else if(!isEmail) $('#email').focus();
				else if(!isPwd1) $('#joinUserPwd').focus();
				else if(!isPwd2) $('#joinUserPwd2').focus();
				else if(!isName) $('#userName').focus();

				return false;
			}
		});
		
	});
	
	</script>
	
</body>
<%@ include file="../common/footer.jsp" %>
</html>