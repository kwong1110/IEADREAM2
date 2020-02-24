<%@page import="oracle.net.aso.a"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, account.model.vo.*, java.util.ArrayList"%>
<%
	Board b = (Board)request.getAttribute("board");
	Reply r = (Reply)request.getAttribute("reply");
	
	Account a = (Account)request.getAttribute("account");
	String userId = (String)request.getAttribute("userId");
	
	String category = b.getCategory();
	int categoryInt = 0;
	switch(category){
	case "결제" : categoryInt = 1; break;
	case "파티" : categoryInt = 2; break;
	case "서비스" : categoryInt = 3; break;
	case "회원/등급" : categoryInt = 4; break;
	case "기타" : categoryInt = 5; break;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판</title>
<style>
	th, td, thead{
		    border: 1px solid gray;
   	 border-radius: 10px;
	}
	textarea, #title, #category, #Mcommand{
		border-radius: 10px;
		font-size:15px;
		font-family:"ON I고딕";
	}
	textarea{
		margin: 0;
    padding: 0;
    border: none;
	}
	#manager{
		background: rgb(123, 164, 213);
	}
	#updateBtn{
		border-radius: 10px;
		background:  rgb(123, 164, 213);
		padding: 10px;
		color: white;
		font-size: 15px;
		text-align: center;
		border:none;
	}
	#deleteBtn ,#menuBtn{
		border-radius: 10px;
		background:rgb(230, 141, 150);
		padding: 10px;
		color: white;
		font-size: 15px;
		text-align: center;
	}

</style>
</head>
<body>
<%@ include file="../../common/mainmenu.jsp" %>
	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>1:1 문의</h1>
				</div>
				<div class="tableArea">
					<form action="<%= request.getContextPath() %>/views/questionBoard/question/questionUpdateForm.jsp"  id="detailForm"  method="post">
						<table>
							<thead>
								<tr>
									<th width=10%>제목</th>
									<td width=30%>
										<input type ="hidden" value ="<%= b.getPostNo() %>" name = "postNo">
										<input type="hidden" id="title" name = "title" value="<%= b.getTitle() %>"><%= b.getTitle() %>							
									</td>
									<% if(loginUser.getGrade() == 0) {%>
									<th>작성자</th>
									<td>
										<%= b.getUserId() %>
									</td>
									<% } %>
									<th width=20% id="category">카테고리</th>
									<td>
										<%= category %>
										<input type="hidden" value="<%= categoryInt %>" name="category">
									</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="4">
										<textarea rows="15" cols="60" name="content" style="resize:none; width: 100%; height: 30%;"  readonly ><%= b.getContent() %></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					
						<div id="replyArea">
							<table id="replyTable">
								<tr>
									<th id="manager" rowspan ="1">관리자</th>
									<td id="Mcommand" rowspan = "3" colspan="4" align= center>
										<% if(r.getAnswerContent() != null) { %>
											<input type="text" name = "answerContent" value ="<%= r.getAnswerContent() %>">
										<% } else { %>
											관리자가 아직 답변을 달지 않았습니다.
										<% } %>
									</td>
								</tr>
							</table>
						</div>
						<% if(loginUser.getGrade() != 0){ %> 
						<div class="btnBox">
							<input type="submit" id="updateBtn" value="수정">
							<input type="button" onclick="location.href='<%= request.getContextPath() %>/list.qu?userNo=<%= loginUser.getUserNo()%>'" id="menuBtn" value="메뉴로" >
							<input type="button" onclick="deleteBoard();" id="deleteBtn" value="삭제">
						</div>
						<% } %> 
					</form>
				 </div>
		 	 </div>	
	 	 </div>				
	</div>
	<script>
		function deleteBoard(){
			var bool = confirm("정말로 삭제하시겠습니까?");
			if(bool){
				$('#detailForm').attr('action','<%=request.getContextPath() %>/delete.qu');
				$('#detailForm').submit();
			}
		}
		
	</script>
</body>
</html>
