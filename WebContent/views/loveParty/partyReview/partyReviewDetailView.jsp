<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<%
	Board board = (Board)request.getAttribute("partyReview");
	ArrayList<Board> board1 = (ArrayList<Board>)request.getAttribute("board");
	/* PartyReviewList image = fileList.get(0); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리 커플 됐어요</title>
<style>
	
		/* table*/
		th {
	    width: 150px;
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	    border-top: 1px solid #ccc;
	}
	td {
    	width: 350px;
    	padding: 10px;
    	vertical-align: top;
    	border-bottom: 1px solid #ccc;
    	text-align: center;
	}
	#writeButton{
		width: 70px;
		height: 30px;
		margin-right: 150px;
		float:right;
		
	}
	#category{
		height: 40px;
		text-align: center;
		border-radius: 10px
	}
	#text{
		height: 40px;
		width: 300px;
		border-radius: 10px;
	}
	#searchSpan{
	 float: right;
    margin-right: 300px;
    margin-top: 170px;
	}
</style>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp" %>
	<div class ="outer">
		<form action="<%= request.getContextPath() %>/views/loveParty/partyReview/partyReviewUpdateForm.jsp">
			<div id="wrapper">
				<div id="main">
					<div class="pageTitle">
						<h1>러브파티</h1>
					</div>
					<div class="tableArea">
						<table>
							<tr>
								<th><%= board.getTitle() %></th>
								<th>작성일시</th>
								<th><%= board.getCreateDate() %></th>
							</tr>
							<tr>
								<th>제목</th>
								<td><%= board.getTitle() %></td>
								<th>작성자</th>
								<td><%= board.getUserId() %></td>
							</tr>
							<tr>
								<th>사진</th>
								<td>
									<div id="imgArea" align="center">
										<a href="<%= request.getContextPath() %>/partyReview_uploadFiles"></a>
									</div>
								</td>
							</tr>
							<tr>
								<th>후기작성</th>
								<td colspan=3>
									<p id="contentArea">
										<%
											String memo = board.getContent();
											if(memo == null){ %>
												(메모 없음)
											}
										<%
											} else {%>
											<%= memo %>
										<%	
											}
										%>
									</p>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class='btnBox'>
				<input type ="submit" id="updateBtn" value="수정">
					<input type ="submit" onclick="deleteThumb();" id="deleteBtn" value="삭제">
					<%-- <% if(loginUser != null && loginUser.getNickName().equals(b.getbWriter())){ 
					<input type ="submit" id="updateBtn" value="수정">
					<input type ="submit" onclick="deleteThumb();" id="deleteBtn" value="삭제">
					<% } %> --%>
				
				</div>
			</div>
		</form>
	</div>
</body>
</html>