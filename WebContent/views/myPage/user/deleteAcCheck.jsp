<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp" %>

	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>비밀번호 확인</h1>
				</div>
				<div>
					<form action="<%= request.getContextPath() %>/delete.mp" method="post">
						<table>
							<tr>
								<td>비밀번호를 입력해주세요</td>
							</tr>
							<tr>
								<td><input type="password" name="deletePass"></td>
							</tr>
						</table>
						<div class="btnBox">
							<input type="submit" value="확인">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		<%-- function check() {
			if(confirm("정말로 탈퇴하시겠어요? 지금 탈퇴하시면 더이상 이어드림의 서비스를 이용하실 수 없습니다.")) {
				// 탈퇴 선택 - 탈퇴 서블릿에 값 전달
				location.href='<%= request.getContextPath() %>/delete.mp';
			} else {
				// 탈퇴 취소 -> 내 정보 보기 페이지로 넘어감
				location.href='<%= request.getContextPath() %>/selectProfileServlet';
			}
		} --%>
	</script>
</body>
</html>