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
<title>이어드림 - 1:1문의</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<style>
	.outer{
		width: 1000px; height: 600px; background: white;
		margin-left: auto; margin-right: auto; margin-top: 50px;
	}
	.tableArea{width:670px;	height:350px;}
	button:hover{cursor: pointer;}
	button, input[type=button]{cursor: pointer;}
	th, td, thead{
   	 	border-radius: 5px;
	}
	textarea, #title, #category, #Mcommand{
		border-radius: 5px;
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
		background: #f9f9f9;
	}
	.qDetailTableArea{
	border-top:1px solid rgb(136, 136, 136); 
		background: #f9f9f9;
	}
	#content{
		resize: none;
    	width: 94%;
   	 	height: 30%;
   	 	margin: 20px;
	}
	.qDetailTableArea th {/* 게시판제목라인 */
		padding:12px 0;
		border-top:1px solid rgb(136, 136, 136); /* 상단라인색 */
		border-bottom:1px solid rgb(224, 224, 224); /* 하단라인색 */
		background:#f9f9f9;  /* 제목배경색 */ 
		color:rgb(51, 51, 51); font-size:1em;/* 제목글자크기 */ 
		letter-spacing:0.1em}/
</style>
</head>
<body>
<%@ include file="../../common/mainmenu.jsp" %>
	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h2>1:1 문의</h2>
				</div>
				<div class="tableArea">
					<form action="<%= request.getContextPath() %>/views/questionBoard/question/questionUpdateForm.jsp"  id="detailForm"  method="post">
						<div class="allTableArea" style="background:#f9f9f9">
						<table class="qDetailTableArea">
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
										<textarea rows="15" cols="60" id="content" name="content"  readonly ><%= b.getContent() %></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					
						<div id="replyArea" style="background: #f9f9f9; height:100px;margin-left: 20px; margin-bottom: 10px;" >
							<table id="replyTable">
								<tr>
									<th id="manager" style="vertical-align: middle; margin-left:10px">관리자</th>
									<td id="Mcommand" rowspan = "3" colspan="3"  align= center>
										<% if(r.getAnswerContent() != null) { %>
											<textarea name = "answerContent" rows="4" cols="10" readonly  style="resize:none; width: 500px; height: 40%;margin-left: 20px;"><%= r.getAnswerContent() %></textarea>
										<% } else { %>
										<textarea name = "answerContent" rows="4" cols="10" readonly style="resize:none; width: 500px; height: 40%; text-align: center;margin-left: 20px;">관리자가 아직 답변을 달지 않았습니다. </textarea>
										<% } %>
									</td>
								</tr>
							</table>
						</div>
						</div>
						<% if(loginUser.getGrade() != 0){ %> 
						<div class="btnBox">
							<button type="submit" class="defaultBtn" id="updateBtn" >수정</button>
							<button type="button"class="defaultBtn menuBtn"  onclick="location.href='<%= request.getContextPath() %>/list.qu?userNo=<%= loginUser.getUserNo()%>'" id="menuBtn">메뉴로</button>
							<button  type="button" class="defaultBtn cancelBtn"  onclick="deleteBoard();" id="deleteBtn">삭제</button>
							<%-- <input type="button"  class="defaultBtn" onclick="location.href='<%= request.getContextPath() %>/list.qu?userNo=<%= loginUser.getUserNo()%>'" id="menuBtn" value="메뉴로" >
							<input type="button" class="defaultBtn"  onclick="deleteBoard();" id="deleteBtn" value="삭제"> --%>
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
<%@ include file="../../common/footer.jsp" %>
</html>
