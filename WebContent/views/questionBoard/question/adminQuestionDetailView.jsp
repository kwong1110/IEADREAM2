<%@page import="oracle.net.aso.a"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="questionBoard.question.model.vo.*, account.model.vo.*, java.util.ArrayList"%>
<%
	Question q = (Question)request.getAttribute("question");
	Account a = (Account)request.getAttribute("account");
	String userId = (String)request.getAttribute("userId");
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
										<input type ="hidden" value ="<%= q.getPostNo() %>" name = "postNo">
										<input type="hidden" id="title" name = "title" value="<%= q.getTitle() %>"><%= q.getTitle() %>							
									</td>
									<% if(loginUser.getGrade() == 0) {%>
									<th>작성자</th>
									<td>
										<%= userId %>
									</td>
									<% } %>
									<th width=20% id="category">카테고리</th>
									<td>
										<%= q.getCategory() %>
										<input type="hidden" value="<%= q.getCategory() %>" name="category">
									</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="4">
										<textarea rows="15" cols="60" name="content" style="resize:none; width: 100%; height: 30%;"  readonly ><%= q.getContent() %></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					
						<div id="replyArea">
							<table id="replyTable">
								<tr>
									<th id="manager" rowspan ="1">관리자</th>
									
										<% if(q.getAnswerContent() != null) { %>
										<td id="Mcommand" rowspan = "3" colspan="4" align= center>
											<textarea name = "answerContent" readonly><%= q.getAnswerContent() %></textarea>
											<%-- <input type="text" name = "answerContent" readonly value ="<%= q.getAnswerContent() %>"> --%>
										</td>
										<% } else { %>
										<td id="Mcommand" rowspan = "3" colspan="4" align= center>
											<textarea id="insertReply" placeholder="답변을 남겨주세요."><%= q.getAnswerContent() %></textarea>
										<% } %>
										</td>
									<td><input type="button" id="insertBtn" class="addReply" value="등록"></td>
									<td><input type="button" id="updateBtn" value="수정" ></td>
									<td><input type="button" onclick="deleteReply();" id="deleteBtn" value="삭제"></td>
								</tr>
							</table>
						</div>
					</form>
				 </div>
		 	 </div>	
	 	 </div>				
	</div>
	<script>
		function deleteReply(){
			var bool = confirm("정말로 삭제하시겠습니까?");
			if(bool){
				<%-- $('#detailForm').attr('action','<%=request.getContextPath() %>/delete.qu'); --%>
				$('#detailForm').attr('action','<%=request.getContextPath() %>/Mdelete.qu');
				$('#detailForm').submit();
			}
		}

		
		   $('.addReply').click(function(){
			var postNo = <%= q.getPostNo() %>;
			var answerContent = $('#insertReply').val();
			$.ajax({
				url: '<%= request.getContextPath() %>/insertReply.qu',
				type: 'post',
				data: {postNo: postNo, answerContent:answerContent},
				success: function(data){
					$replyTable = $('#replyTable');
					
					for(var key in data){
					var $tr= $('<tr>');
					var $writerTd = $('<td>').text('관리자');
					var $contentTd = $('<td>').text(data[key].answerContent);
					var $dateTd = $('<td>').text(data[key].answerDate);
					}
				
				}
			}); 
		   });
	</script>
</body>
</html>
