<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*"%>
<%
	request.setCharacterEncoding("utf-8");
	Board board = (Board)request.getAttribute("board");
	
	
	String category = board.getCategory();
	String[] selected = new String[5];
	
		if(category.equals("결제")) {
			selected[0] = "selected";
			selected[1] = "";
			selected[2] = "";
			selected[3] = "";
			selected[4] = "";
		} else if(category.equals("파티")) {
			selected[0] = "";
			selected[1] = "selected";
			selected[2] = "";
			selected[3] = "";
			selected[4] = "";
		} else if(category.equals("서비스")) {
			selected[0] = "";
			selected[1] = "";
			selected[2] = "selected";
			selected[3] = "";
			selected[4] = "";
		} else if(category.equals("회원/등급")) {
			selected[0] = "";
			selected[1] = "";
			selected[2] = "";
			selected[3] = "selected";
			selected[4] = "";
		} else {
			selected[0] = "";
			selected[1] = "";
			selected[2] = "";
			selected[3] = "";
			selected[4] = "selected";
		 } 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
</head>
<body>
	
	<%@ include file="../../common/mainmenu.jsp" %>
	
	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>FAQ 수정</h1>
				</div>
				<div class="tableArea">
					<form action="<%= request.getContextPath() %>/faqUpdate.faq" method="post">
						<table class="table">
							<tr>
								<td>
									<input type="hidden" name = postNo value="<%= board.getPostNo() %>">
									<input type="text" size="50" class="title" name="title" value="<%= board.getTitle() %>">
								</td>
								<td>
									<div>
										<input type="text" size="10" class="cate" value="카테고리">
									</div>
								</td>
								<td>
									<select class="select" name="category">
										<option value="결제" <%= selected[0] %>>결제</option>
										<option value="파티" <%= selected[1] %>>파티</option>
										<option value="회원" <%= selected[2] %>>서비스</option>
										<option value="서비스" <%= selected[3] %>>회원/등급</option>
										<option value="기타" <%= selected[4] %>>기타</option>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<textarea name="con" cols="100" rows="15"style="resize:none;"><%= board.getContent() %></textarea>
								</td>
							</tr>
						</table>
						
						<br>
						
						<div class="btnBox" align="center">
							<button type="submit" id="updateFaqBtn">수정</button>
							<div onclick="location.href='javaxcript:history.go(-1);'" id="cancelBtn">취소</div>
							<button type="button" onclick="deleteFaq();" id="deleteBtn">삭제</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		function deleteFaq() {
			var del = confirm("해당 FAQ를 삭제하시겠습니까?");
			if(del) {
				location.href='<%= request.getContextPath() %>/delete.faq?no=' +'<%= board.getPostNo() %>';
			}
		}
	</script>
	
</body>
</html>