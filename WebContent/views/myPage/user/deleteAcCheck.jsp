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
					<h1>기본 정보</h1>
				</div>
				<div>
					<form action="<%= request.getContextPath() %>/checkPwdForDelete.mp" method="post" id="checkPwd" name="checkPwd">
						<div>비밀번호를 확인해주세요</div>
						<div><label>비밀번호</label><input type="text" placeholder="내용을 입력해주세요" name="password"></div>
						<div class="btnBox">
							<input type="submit" value="확인">
							<button onclick="location.href='javascript:history.go(-1);'">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>