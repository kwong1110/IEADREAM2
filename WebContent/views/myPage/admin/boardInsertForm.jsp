<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="account.model.vo.*, common.*, java.util.ArrayList" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board.css">
<style>
.main{
	position:absolute;
  	top:15%;
  	left:12%;
  	right:10%;
}

.botBox{
	background: #c7eef2;
	padding: 10px;
	border-radius: 10px;
}
</style>
</head>
<body>
	<div class="main">
		<form action="<%= request.getContextPath() %>/" method="get">
			<table class="mainBoard">
				<tr>
					<td colspan="2"> 
						<div class="botBox">
							<b>등록할 게시판 카테고리</b>
							<select name="checkCategory" class="search">
								<option value="1">베스트커플</option>
								<option value="2">우리커플됐어요</option>
							</select>
						</div>
					</td>
				</tr>
			</table>
			<div class="btnBox">
				<button class="defaultBtn" type="submit">확인</button>
				<button class="defaultBtn" type="button" onclick="window.close();">취소</button>
			</div>
		</form>
	</div>
</body>
</html>