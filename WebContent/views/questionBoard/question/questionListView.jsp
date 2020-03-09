<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.ArrayList,	board.model.vo.* , common.*" %>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("board");
	ArrayList<Reply> reply = (ArrayList<Reply>)request.getAttribute("reply");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이어드림 - 1:1문의</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board.css">
<style>
	.contents{height: 440px;border-bottom: 1px solid rgb(224,224,224);}
	.main{width: 80%; height: 100%;}
	.pageTitle{margin: 1em auto;}
	.listAtrea{width: 800px;text-align: center;}
	.tableArea tr { width: -webkit-fill-available;}
	.tableArea th {/* 게시판제목라인 */
		padding:12px 0;
		border-top:1px solid rgb(136, 136, 136); /* 상단라인색 */
		border-bottom:1px solid rgb(224, 224, 224); /* 하단라인색 */
		background:#f9f9f9;  /* 제목배경색 */ 
		color:rgb(230, 141, 150); font-size:1em;/* 제목글자크기 */ 
		letter-spacing:0.1em}/* 제목띠어쓰기간격 */ 
	.tableArea td {line-height: 10px;}
	th{border-bottom: 1px solid grey;}
		.blinking{
		color: white;
		background: pink;
		-webkit-animation:blink .5s ease-in-out infinite alternate;
		-moz-animation:blink .5s ease-in-out infinite alternate;
		animation:blink .5s ease-in-out infinite alternate;
    }
    @-webkit-keyframes blink{
        0% {opacity:0.4;}
        100% {opacity:1;}
    }
    @-moz-keyframes blink{
        0% {opacity:0.4;}
        100% {opacity:1;}
    }
    @keyframes blink{
        0% {opacity:0.4;}
        100% {opacity:1;}
    }
	
</style>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp" %>
	<div class="outer">
		<div class="wrapper">
			
			<div class="main">
				<div class="pageTitle">
					<h2>1:1 문의게시판</h2>
				</div>
				<div class="contents">
					<div class="tableArea">
						<table id="listArea" style=" width: -webkit-fill-available;">
							<thead>
								<tr>
									<th width="70px">번호</th>
									<th width="100px">카테고리</th>
									<th width="270px">제목</th>
									<th width="140px">답변 여부</th>
									<th width="170px">문의 날짜</th>
								</tr>
							</thead>
							<tbody>
								<% if(list.isEmpty()){ %>
									<tr>
										<td colspan="5">조회된 문의사항이 없습니다.</td>
									</tr>
								<% } else{%>
									<%for(int i=0; i<list.size(); i++){%>
									<%	if(loginUser.getGrade()==0 || loginUser.getUserNo()== list.get(i).getUserNo()){%>
									
									<tr>
										<td><%= list.get(i).getPostNo() %><input type = "hidden" value='<%= list.get(i).getPostNo() %>'></td>
										<td><%= list.get(i).getCategory() %></td>
										<td><%= list.get(i).getTitle() %></td>
									<%}%>
									  
										<% if(reply.get(i).getAnswerChecked().equals("N")){%>
											<td>미답변</td>
										<% } else{  %>
											<td><span class="blinking" style="border-radius:5px;padding: 5px">답변 완료</span></td>
										<%}%>
											
							
										<td><%= list.get(i).getCreateDate() %></td>
									</tr>
									<%}%>
								<%}%>
							</tbody>
					</table>
				</div>
			</div>	
				<!-- 페이징 -->
				<div class='pagingArea' align='center'>
						<% if(!list.isEmpty()){ %>
						<!-- 맨 처음-->
						<button onclick="location.href='<%= request.getContextPath() %>/list.qu?userNo=<%= loginUser.getUserNo()%>&currentPage=1'">&lt;&lt;</button>
						<!-- 이전 페이지-->
						<button onclick="location.href='<%= request.getContextPath() %>/list.qu?userNo=<%= loginUser.getUserNo()%>&currentPage=<%= currentPage-1 %>'" id="beforeBtn">PREV</button>
						<script>
							if(<%= currentPage %> <= 1){
								var before = $('#beforeBtn');
								before.attr('disabled','true');
							}
						</script>
						<!-- 페이지 목록 버튼 -->
						<% for(int p = startPage; p <= endPage; p++){ %>
							<% if(p == currentPage){ %>
								<button id="choosen" disabled><%= p %></button>
							<% } else { %>
								<button id="numBtn" onclick="location.href='<%=request.getContextPath() %>/list.qu?userNo=<%= loginUser.getUserNo()%>&currentPage=<%= p %>'"><%= p %></button>
							<% } %>
						<% } %>
						
						<!-- 다음 페이지 -->
						<button onclick="location.href='<%= request.getContextPath() %>/list.qu?userNo=<%= loginUser.getUserNo()%>&currentPage=<%= currentPage + 1 %>'" id="afterBtn">NEXT</button>
						<script>
							if(<%= currentPage %> >= <%= maxPage %>){
								var after= $("#afterBtn");
								after.attr('disabled','true');
							}
						</script>
						<!-- 맨 끝 -->
						<button onclick="location.href='<%= request.getContextPath() %>/list.qu?userNo=<%= loginUser.getUserNo()%>&currentPage=<%= maxPage %>'">&gt;&gt;</button>					
						<% } %>
					</div>
					<div class='searchArea' align='right'>
						<% if(loginUser != null){ %>
						<button class="defaultBtn" onclick='location.href="views/questionBoard/question/questionInsertForm.jsp"'>작성하기</button>
						<% } %>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(function(){
			<% if(!list.isEmpty()){ %>
			$('#listArea td').mouseenter(function(){
				$(this).parent().css({'background':'darkgray','cursor':'pointer'});
			}).mouseout(function(){
				$(this).parent().css('background','none');
			}).click(function(){
				var postNo = $(this).parent().children().children('input').val();
				<%if(loginUser != null && loginUser.getGrade()!=0){ %>
					location.href='<%= request.getContextPath() %>/detail.qu?postNo=' + postNo;
				<% } else if(loginUser != null && loginUser.getGrade()==0){ %>
					location.href='<%= request.getContextPath() %>/Mdetail.qu?postNo=' + postNo;
				<% } %> 
			});
			<% } %>
		});
		
		
	</script>
</body>
<%@ include file="../../common/footer.jsp"%> 
</html>