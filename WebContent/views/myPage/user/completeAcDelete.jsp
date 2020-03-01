<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String msg = (String)request.getAttribute("msg"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴 완료</title>
</head>
<body>
	<div class="main">
		<h3>탈퇴가 완료되었습니다.</h3>
		<div class="btnBox">
			<button onclick="ok();">확인</button>
		</div>
	</div>
</body>
<script>

	// 부모창 새로고침 후 자식창(본인) 닫음.
function ok(){	
	location.href='<%= request.getContextPath() %>/index.jsp';
}

</script>
</html>