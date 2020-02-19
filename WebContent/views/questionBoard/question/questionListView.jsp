<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.ArrayList, questionBoard.question.model.vo.*" %>
<%
	ArrayList<Question> list = (ArrayList<Question>)request.getAttribute("list");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width: 800px; height: 500px; background: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left: auto; margin-right: auto; margin-top: 50px;
	}
	#listArea{text-align: center;}
	.tableArea{width:650px;	height:350px; margin-left:auto;	margin-right:auto;}
	th{border-bottom: 1px solid grey;}
	.pagingArea button{border-radius: 15px; background: #D5D5D5;}
	.searchArea{margin-right: 50px;}
	.searchArea button{background: #D1B2FF; border-radius: 5px; color: white; width: 80px; heigth: 25px; text-align: center;}
	button:hover{cursor: pointer;}
	#insertBtn{
		border-radius: 10px;
		background:  rgb(123, 164, 213);
		padding: 10px;
		color: white;
		font-size: 15px;
		text-align: center;
		border:none;
	}
</style>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp" %>
	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>1:1 문의게시판</h1>
				</div>
				<div class="tableArea">
					<table id="listArea">
						<tr>
							<th width="90px">번호</th>
							<th width="100px">카테고리</th>
							<th width="150px">제목</th>
							<th width="100px">답변 여부</th>
							<!-- <th width="170px">수정</th> -->
							<th width="170px">문의 날짜</th>
						</tr>
						<% if(list.isEmpty()){ %>
						<tr>
							<td colspan="5">조회된 문의사항이 없습니다.</td>
						</tr>
						<% } else{
							for(Question q : list){ %>
						<tr>
							<td><%= q.getPostNo() %><input type = "hidden" value='<%= q.getPostNo() %>'></td>
							<td><%= q.getCategory() %></td>
							<td><%= q.getTitle() %></td>
							
							<!-- 답변 완료 메시지 물어보기 -->
							
							<% if(q.getAnswerChecked()=='N'){ %>
							<td>미답변</td>
							<% } else{  %>
							<td>답변 완료</td>
							<%} %>
							 <td><%= q.getCreateDate() %></td>
							
							<%-- <td><input type="button" onclick='location.href="<%= request.getContextPath() %>/views/questionBoard/question/questionUpdateForm.jsp"' value="수정"></td> --%>
						</tr>
						<%		}
							}%>
					</table>
				<div class='searchArea' align='right'>
					<%-- <% if(loginUser != null){ %> --%>
					<button onclick='location.href="views/questionBoard/question/questionInsertForm.jsp"' id="insertBtn">작성하기</button>
					<%-- <% } %> --%>
				</div>
			</div>
		</div>
		</div>
	</div>
	<script>
		$(function(){
			$('#listArea td').mouseenter(function(){
				$(this).parent().css({'background':'darkgray','cursor':'pointer'});
			}).mouseout(function(){
				$(this).parent().css('background','none');
			}).click(function(){
				var postNo = $(this).parent().children().children('input').val();
				location.href='<%= request.getContextPath() %>/detail.qu?postNo=' + postNo;
				<%-- // 로그인 한 사람만 상세보기 이용할 수 있게 하기
				<%if(loginUser != null){ %>
					location.href='<%= request.getContextPath() %>/detail.bo?bid=' + bid;
				<% } else { %>
					alert('회원만 이용할 수 있는 서비스 입니다.');
				<% } %> --%>
				
			});
			/* $('#updateBtn').click(function(){
				<button onclick='location.href="views/board/boardInsertForm.jsp"'>작성하기</button>
			}); */
		});
		
	</script>
</body>
</html>