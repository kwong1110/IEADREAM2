<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="questionBoard.faq.model.vo.*"%>
<%
	request.setCharacterEncoding("utf-8");
	Faq faq = (Faq)request.getAttribute("faq");
	
	
	String category = faq.getCategory();
	String[] selected = new String[4];
	
		if(category.equals("결제")) {
			selected[0] = "selected";
			selected[1] = "";
			selected[2] = "";
			selected[3] = "";
		} else if(category.equals("회원")) {
			selected[0] = "";
			selected[1] = "selected";
			selected[2] = "";
			selected[3] = "";
		} else if(category.equals("서비스")) {
			selected[0] = "";
			selected[1] = "";
			selected[2] = "selected";
			selected[3] = "";
		} else {
			selected[0] = "";
			selected[1] = "";
			selected[2] = "";
			selected[3] = "selected";
		 } 
%>
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
					<h1>FAQ 수정</h1>
				</div>
				<div class="tableArea">
					<form action="<%= request.getContextPath() %>/faqUpdate.faq" method="post">
						<table class="table">
							<tr>
								<td>
									<input type="hidden" name = postNo value="<%= faq.getPostNo() %>">
									<input type="text" size="50" class="title" name="title" value="<%= faq.getTitle() %>">
								</td>
								<td>
									<div>
										<input type="text" size="10" class="cate" value="카테고리">
									</div>
								</td>
								<td>
									<select class="select" name="category">
										<option value="결제" <%= selected[0] %>>결제</option>
										<option value="회원" <%= selected[1] %>>회원</option>
										<option value="서비스" <%= selected[2] %>>서비스</option>
										<option value="기타" <%= selected[3] %>>기타</option>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<textarea name="con" cols="100" rows="15"style="resize:none;"><%= faq.getContent() %></textarea>
								</td>
							</tr>
						</table>
						
						<br>
						
						<div class="btnBox" align="center">
							<button type="submit" id="updateFaqBtn">수정</button>
							<div onclick="location.href='javaxcript:history.go(-1);'" id="cancelBtn">취소</div>
							<button type="button" onclick="location.href='<%= request.getContextPath() %>/delete.faq'">삭제</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>