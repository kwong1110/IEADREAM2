<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String id = request.getParameter("id"); %>
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
					<h1>기본 정보</h1>
				</div>
				<div>
					<form action="<%= request.getContextPath() %>/delete.ac" method="post" id="deleteAc" name="deleteAc">
						<div>지금 탈퇴하면 이어드림 이용이 더이상 불가능합니다</div>
						<div>정말 탈퇴하시겠어요?</div>
						<input type="hidden" name="id" value="<%= id %>">
						<div class="btnBox">
							<input type="submit" value="탈퇴">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>