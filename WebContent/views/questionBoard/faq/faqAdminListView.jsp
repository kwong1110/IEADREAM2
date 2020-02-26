<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, board.model.vo.*, common.*" %>
<% 
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list"); 

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
<title>Insert title here</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<style>
		.pagingArea button{border-radius: 15px; background: #D5D5D5;}
	
</style>
</head>
<body>
	
	<%@ include file="../../common/mainmenu.jsp" %>
	
	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>FAQ 관리</h1>
				</div>
				<div class="tableArea">
					<table id="listArea">
						<tr>
							<th>글번호</th>
							<th width="100px">카테고리</th>
							<th width="300px">글제목</th>
						</tr>
						<%
							if (list.isEmpty()) {
						%>
						<tr>
							<td colspan="3">존재하는 공지사항이 없습니다.</td>
						</tr>
						<%
							} else {
								for (Board board : list) {
						%>
									<tr>
										<td><%= board.getPostNo() %></td>
										<td><%= board.getCategory() %></td>
										<td><%= board.getTitle() %></td>
									</tr>
						<%
								}
							}
						%>
					</table>
					
					<div class="btnBox">
						<button id="searchBtn" onclick="search();">검색</button><input name="searchCon" id="searchCon" type="text" width="30">
						<button onclick="location.href='views/questionBoard/faq/faqInsertForm.jsp'" id="writeFaqBtn">글쓰기</button>
					</div>
					
					<!-- 일반 페이징 -->
				 		<div class="pagingArea" align="center">
							<%if(!list.isEmpty()) { %>
								<!-- 이전 페이지 -->
								<button onclick="location.href='<%= request.getContextPath() %>/adminList.faq?currentPage=<%= currentPage-1 %>'" id="beforeBtn">&lt;</button>
								<script>
									if(<%= currentPage %> <= 1) {
										var before = $('#beforeBtn');
										before.attr('disabled', 'true');
									}
								</script>
								
								<!-- 10개 페이지 목록 -->
								<% for(int p = startPage; p <= endPage; p++) { 
										if(p == currentPage) { %>
											<button id="choosen" disabled><%= p %></button>
								<%		} else { %>
											<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/adminList.faq?currentPage=<%= p %>'"><%= p %></button>
								<%		} %>
								<% } %>
							
								<!-- 다음 페이지 -->
								<button onclick="location.href='<%= request.getContextPath() %>/adminList.faq?currentPage=<%= currentPage+1 %>'" id="nextBtn">&gt;</button>
								<script>
									if(<%= currentPage %> >= <%= maxPage %>) {
										var next = $('#nextBtn');
										next.attr('disabled', 'true');
									}
								</script>
							<% } %>
						</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$(function() {
			$('#listArea td').mouseenter(function() {
				$(this).parent().css({'background':'darkgray', 'cursor':'pointer'});
			}).mouseout(function() {
				$(this).parent().css('background','none');
			}).click(function() {
				var num = $(this).parent().children().eq(0).text();
				console.log(num);
				location.href='<%=request.getContextPath()%>/faqDetail.faq?no=' + num;
			});
		});
		
		function search() {
			var searchWord = $('#searchCon').val()
			
			location.href='<%= request.getContextPath() %>/search.faq?searchWord='+searchWord;
		}
	</script>
</body>
</html>