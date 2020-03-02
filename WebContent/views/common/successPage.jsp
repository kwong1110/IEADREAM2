<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
</head>
<style>
.main{
	display: flex;
  	align-items: center;
  	justify-content: center;
  	flex-wrap: wrap;
  	flex-direction: column;
}
</style>
<body>
	<div class="main">
		<div>
			<h3><%= msg %></h3>
		</div>
		<div class="btnBox">
			<button class="defaultBtn" onclick="ok();">확인</button>
		</div>
	</div>
</body>
<script>

	// 부모창 새로고침 후 자식창(본인) 닫음.
function ok(){	
	opener.document.location.reload();
	self.close();
}

</script>
</html>