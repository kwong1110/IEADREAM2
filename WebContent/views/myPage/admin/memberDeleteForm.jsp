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
</head>
<body onload='resizeWindow(this)'>
	<div class="popMain" id="mainBox">
		<form action="<%= request.getContextPath() %>/manageDelete.mem" method="get">
			<table class="popTable">
				<thead>
					<tr>
						<th>이름</th>
						<th>회원번호</th>
					</tr>
				</thead>
				<tbody>
					<tr>
				<% for(int i = 0; i < nameArr.length; i++){ %>
						<td><%= nameArr[i] %></td>
						<td><%= noArr[i] %></td>
						
						<td style="display:none;"><input type="hidden" name="userNo" value="<%= noArr[i] %>"></td>
					</tr>
				<% } %>
				</tbody>
			</table>
			<div class="deleteCheck">
				<div>총 <%=nameArr.length %>명 의 회원 탈퇴를 </div>
				<div>정말로 진행 하시겠습니까?</div>
			</div>
			<div class="btnBox">
				<button class="defaultBtn" type="submit">확인</button>
				<button class="defaultBtn" type="button" onclick="window.close();">취소</button>
			</div>
		</form>
	</div>
</body>
<script>
	function resizeWindow(win)    {
		var wid = win.document.body.offsetWidth + 80;
		var hei = win.document.body.offsetHeight + 100;    //80 과 100은 넉넉하게 하려는 임의의 값임
		
		win.resizeTo(wid,hei);
	};
</script>
</html>