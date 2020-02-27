<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="account.model.vo.*, common.*, java.util.ArrayList" %>
<%
	request.setCharacterEncoding("UTF-8");
	String checkList = request.getParameter("checkList");
		// 쿼리스트링으로 받아온 값을 javascript 배열로 묶은 ','와 
		// 회원번호와 이름을구분하기위해 넣어주었던 ','를 제거 후 배열에 담아준다.
	String[] checkArr = checkList.split(",");
		
	String checkName="";
	String checkNo="";
	for(int i = 0; i < checkArr.length; i++){
		if(i % 2 == 0){
			checkNo += checkArr[i] + ",";
		} else {
			checkName += checkArr[i] + ",";
		}
	}
	String[] nameArr = checkName.split(",");
	String[] noArr = checkNo.split(",");
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
  	left:21%;
}

.botBox{
	background: #c7eef2;
	padding: 10px;
	border-radius: 10px;
}
.deleteCheck{
	margin: 10px;
	font-weight: bold;
	font-size: 15px;
	color: red;
}
</style>
</head>
<body>
	<div class="main">
		<form action="<%= request.getContextPath() %>/manageDelete.bo" method="get">
			<table class="mainBoard">
				<thead>
					<tr>
						<th>게시글 번호</th>
						<th>아이디</th>
					</tr>
				</thead>
				<tbody>
					<tr>
				<% for(int i = 0; i < nameArr.length; i++){ %>
						<td><%= nameArr[i] %></td>
						<td><%= noArr[i] %></td>
						
						<td style="display:none;"><input type="hidden" name="bNo" value="<%= nameArr[i] %>"></td>
					</tr>
				<% } %>
				</tbody>
			</table>
			<div class="deleteCheck">
				<div>총 <%=nameArr.length %>개 의 게시글삭제를 </div>
				<div>정말로 진행 하시겠습니까?</div>
			</div>
			<div class="btnBox">
				<button class="defaultBtn" type="submit">확인</button>
				<button class="defaultBtn" type="button" onclick="window.close();">취소</button>
			</div>
		</form>
	</div>
</body>
</html>