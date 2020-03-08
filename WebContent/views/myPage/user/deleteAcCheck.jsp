<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이어드림 - 탈퇴</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board.css">

<style>
	.listArea{width: 800px;}
	.tableArea tr { width: -webkit-fill-available;}
	.tableArea td {/* 게시판제목라인 */
		padding:20px 0;
		color:rgb(230, 141, 150); font-size:1em;/* 제목글자크기 */ 
		letter-spacing:0.1em;}/* 제목띠어쓰기간격 */ 
	
	input{font-size: 20px; padding: 2px; width: 30%;}

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
					<h1>비밀번호 확인</h1>
				</div>
				<div class="tableArea">
					<form action="<%= request.getContextPath() %>/delete.mp" method="post">
						<table class="listArea">
							<tr>
								<td>비밀번호를 입력해주세요</td>
							</tr>
							<tr>
								<td><input type="password" name="deletePass"></td>
							</tr>
						</table>
						<div class="btnBox">
							<button class="defaultBtn cancelBtn" id="ok" onclick="check();" type="submit">탈퇴</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		function check() {
			if(confirm("정말로 탈퇴하시겠어요? 지금 탈퇴하시면 더이상 이어드림의 서비스를 이용하실 수 없습니다.")) {
			} else {
				// 탈퇴 취소 -> 내 정보 보기 페이지로 넘어감
				location.href='<%= request.getContextPath() %>/selectProfileServlet';
			}
		}
	</script>
</body>
<%@ include file="../../common/footer.jsp" %>
</html>