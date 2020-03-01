<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "board.model.vo.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	 String category = request.getParameter("category");
	System.out.println(category);
	String[] selected = new String[4];
	switch(category){
	case "결제":
		selected[0] = "selected";
		break;
	case "서비스":
		selected[1] = "selected";
		break;
	case "회원/등급":
		selected[2] = "selected";
		break;
	case "기타":
		selected[3] = "selected";
		break;
	} 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이어드림 - 1:1문의</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<style>

	.outer{
		width: 1000px; height: 500px; background: white;
		margin-left: auto; margin-right: auto; margin-top: 50px;
	}
	textarea, #title, #category{
		border-radius: 5px;
		font-size:15px;
		font-family:"ON I고딕";
	}
	textarea{margin-top:10px;}
	
</style>
</head>
<body>
<%@ include file="../../common/mainmenu.jsp" %>
	<div class="outer">
		<div class="wrapper">
		<div class = "main">
			<div class="pageTitle">
				<h1>1:1 문의</h1>
			</div>
			
			<div class="tableArea"> 
				<form id="board" action="<%= request.getContextPath() %>/update.qu" method="post">
					<table>
						<tr>
							<td>
								<input type ="hidden" name ="postNo" value="<%= request.getParameter("postNo") %>">
								<input type="text" id="title"  name="title" size="40" value="<%= request.getParameter("title")%>"></td>
							<th>카테고리</th>
							<td>
							<select name="category" id="category">
									<option>--------</option>
									<option value="결제" <%= selected[0] %>>결제</option>
									<option value="서비스" <%= selected[1] %>>서비스</option>
									<option value="회원/등급" <%= selected[2] %>>회원/등급</option>
									<option value="기타" <%= selected[3] %>>기타</option>
							</select>
							</td>	
						</tr>
						<tr>
							<td colspan="4">
								<textarea rows="15" cols="60" name="content" style="resize:none; width: 100%;" ><%= request.getParameter("content") %></textarea>
							</td>
						</tr>
					</table>
					<br>
					<div align="center">
						<button type="submit" class="defaultBtn">등록하기</button>
						<input type="button"  class="defaultBtn" id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/list.qu?userNo='+<%= loginUser.getUserNo() %>" value="취소">
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
<%@ include file="../../common/footer.jsp" %>
</html>