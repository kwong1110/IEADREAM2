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
<title>이어드림 - FAQ 관리</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<link rel="styleSheet" href="<%= request.getContextPath() %>/css/board.css">
<style>
	.pageTitle{margin: 1em auto;}

/* .tableArea{margin: auto; padding: auto;} */
	.listAtrea{width: 800px;}
	.tableArea tr { width: -webkit-fill-available; font-size: 14px; }
	.tableArea th {/* 게시판제목라인 */
		padding:12px 0;
		border-top:1px solid rgb(136, 136, 136); /* 상단라인색 */
		border-bottom:1px solid rgb(224, 224, 224); /* 하단라인색 */
		background:#f9f9f9;  /* 제목배경색 */ 
		color:rgb(230, 141, 150); font-size:14px;/* 제목글자크기 */ 
		letter-spacing:0.1em}/* 제목띠어쓰기간격 */ 
	.tableArea td {line-height: 10px;}
		
	.post_title {width:100px;text-align:center}
	.td_cate {width:20%;text-align:center;}
	.post_no {width: 20%; text-align: center;}
	
	#searchCon {width: 300px; font-size: 15px; padding: 10px; margin: 10px; border: none;
				border-bottom: 1px solid rgb(224, 224, 224);}
	#writeFaqBtn {align: right;}
	
	.btnBox{border-top: 1px solid rgb(224, 224, 224);}
	
	*:focus { outline:none; }
	
	.pagingArea{text-decoratino: none; padding: 30px 0;}
	.pagingArea button{background: none; border: 3px solid white; font-weight: bold; margin: 1em auto;
					  position: relative; cursor: pointer;
  text-transform: uppercase;}
  
  	.contents{border-bottom: 1px solid black; height: 500px;}
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
				<div class="topBox" style="text-align: center;">
					<div class="midBox">
						<div class="searchMenu">검색어</div>
							<input placeholder="검색어를 입력하세요!" class="search search2" name="searchCon" id="searchCon" type="text" width="30">
							<button class="defaultBtn searchBtn" id="searchBtn" onclick="search();">검색</button>
					</div>
				</div>
				<div class="tableArea">
					<table id="listArea" style=" width: -webkit-fill-available;">
						<%
							if (list.isEmpty()) {
						%>
							존재하는 공지사항이 없습니다.
						<%
							} else {
						%>
						<tr>
							<th class="post_no">글번호</th>
							<th class="td_cate">카테고리</th>
							<th class="post_title">글제목</th>
							<th class="td_cate">게시날짜</th>
						</tr>
						<%
								for (Board board : list) {
						%>
									<tr>
										<td class="post_no"><%= board.getPostNo() %></td>
										<td class="td_cate"><%= board.getCategory() %></td>
										<td class="post_title"><%= board.getTitle() %></td>
										<td class="td_cate"><%= board.getCreateDate() %></td>
									</tr>
						<%
								}
							}
						%>
					</table>
					
					<div class="btnBox">
						<button  class="defaultBtn" onclick="location.href='views/questionBoard/faq/faqInsertForm.jsp'" id="writeFaqBtn">글쓰기</button>
					</div>
					
					<!-- 일반 페이징 -->
				 		<div class="pagingArea" align="center">
							<%if(!list.isEmpty()) { %>
								<!-- 맨 처음으로 가는 버튼 -->
								<button onclick="location.href='<%= request.getContextPath() %>/adminList.faq?currentPage=1'">&lt;&lt;</button>
								<!-- 이전 페이지 -->
								<button onclick="location.href='<%= request.getContextPath() %>/adminList.faq?currentPage=<%= currentPage-1 %>'" id="beforeBtn">prev</button>
								<script>
									if(<%= currentPage %> <= 1) {
										var before = $('#beforeBtn');
										before.attr('disabled', 'true');
									}
								</script>
								
								<!-- 10개 페이지 목록 -->
								<% for(int p = startPage; p <= endPage; p++) {  %>
									<%	if(p == currentPage) { %>
											<button id="choosen" disabled><%= p %></button>
								<%		} else { %>
											<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/adminList.faq?currentPage=<%= p %>'"><%= p %></button>
								<%		} %>
								<% } %>
							
								<!-- 다음 페이지 -->
								<button onclick="location.href='<%= request.getContextPath() %>/adminList.faq?currentPage=<%= currentPage+1 %>'" id="nextBtn">next</button>
								<script>
									if(<%= currentPage %> >= <%= maxPage %>) {
										var next = $('#nextBtn');
										next.attr('disabled', 'true');
									}
								</script>
								<!-- 맨 끝으로 가는 버튼 -->
								<button onclick="location.href='<%= request.getContextPath() %>/adminList.faq?currentPage=<%= maxPage %>'">&gt;&gt;</button>					
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
<%@ include file="../../common/footer.jsp" %>
</html>