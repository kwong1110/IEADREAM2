<%@page import="oracle.net.aso.a"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, account.model.vo.*, java.util.ArrayList"%>
<%
	Board b = (Board)request.getAttribute("board");
	Reply r = (Reply)request.getAttribute("reply");
	
	Account a = (Account)request.getAttribute("account");
	String userId = (String)request.getAttribute("userId");
	
	String category = b.getCategory();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<style>
	.outer{
		width: 1000px; height: 500px; background: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left: auto; margin-right: auto; margin-top: 50px;
	}
	.tableArea{width:670px;	height:350px;}
	button:hover{cursor: pointer;}

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
	}
	#manager{
		background: rgb(123, 164, 213);
	}
	#showTitle{
		resize: none;
		width: 356px;
   		height: 24px;
    	vertical-align: middle;
	}
	#showCategory{
		resize : none;
		height: 24px;
		text-align: center;
    	vertical-align: middle;
	}
	table>thead{
		margin-bottom: 20px;
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
										<input type="hidden" id="title" name = "title" value="<%= b.getTitle() %>"><textarea readonly id="showTitle"><%= b.getTitle() %></textarea>							
									</td>
									<th width=20% id="category">카테고리</th>
									<td>
										<textarea readonly id="showCategory"><%= b.getCategory() %></textarea>
										<input type="hidden" value="<%= loginUser.getUserNo()%>" name="userNo">
										<input type="hidden" value="<%= b.getCategory() %>" name="category">
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
									<th id="manager" rowspan ="1" colspan="2" style="vertical-align: middle;">관리자</th>
									<td id="Mcommand" rowspan = "3" colspan="3"  align= center>
										<% if(r.getAnswerContent() != null) { %>
											<textarea name = "answerContent" style="resize:none; width: 300px; height: 40%;"><%= r.getAnswerContent() %></textarea>
										<% } else { %>
										<textarea name = "answerContent" readonly style="resize:none; width: 300px; height: 40%; text-align: center">관리자가 아직 답변을 달지 않았습니다. </textarea>
										<% } %>
									</td>
								</tr>
							</table>
						</div>
						<% if(loginUser.getGrade() != 0){ %> 
						<div class="btnBox">
							<input type="submit" class="defaultBtn" id="updateBtn" value="수정">
							<input type="button"  class="defaultBtn" onclick="location.href='<%= request.getContextPath() %>/list.qu?userNo=<%= loginUser.getUserNo()%>'" id="menuBtn" value="메뉴로" >
							<input type="button" class="defaultBtn"  onclick="deleteBoard();" id="deleteBtn" value="삭제">
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
