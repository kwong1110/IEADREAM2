<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, board.model.vo.*,common.*" %>
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
<title>이어드림 - 우리 커플 됐어요</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board.css">
<style>
	.outer{
		width: 1000px; height: 500px; background:white;
		margin-left: auto; margin-right: auto; margin-top: 50px;
	} 
	.main{width: 80%; height: 100%;}
	.pageTitle{margin: 1em auto;}
	#listArea{text-align: center;width: 800px;}
	.contents{height: 400px;border-bottom: 1px solid rgb(224,224,224);}
	.tableArea tr { width: -webkit-fill-available;}
	.tableArea th {/* 게시판제목라인 */
		padding:12px 0;
		border-top:1px solid rgb(136, 136, 136); /* 상단라인색 */
		border-bottom:1px solid rgb(224, 224, 224); /* 하단라인색 */
		background:#f9f9f9;  /* 제목배경색 */ 
		color:rgb(230, 141, 150); font-size:1em;/* 제목글자크기 */ 
		letter-spacing:0.1em}/* 제목띠어쓰기간격 */ 
	.tableArea td {line-height: 10px;}
	
</style>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp" %>
	
	<div class ="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h2>우리 커플 됐어요</h2>
				</div>
				<div class="contents">
					<div class="tableArea">
						<table  id="listArea">
								<tr>
									<th width="70px">글번호</th>
									<th  width="300px">제목</th>
									<th  width="100px">작성자</th>
									<th  width="70px">조회수</th>
									<th  width="170px">작성일시</th>
								</tr>
							<% if(list.isEmpty()){ %>
								<tr>
									<td colspan="5">조회된 커플 리뷰가 없습니다.</td>
								</tr>
							<% } else{
									for(Board b : list){ %>
								<tr>
									<td><%= b.getPostNo() %><input type="hidden" value='<%=b.getPostNo() %>'></td>
									<td><%= b.getTitle() %></td>
									<td><%= b.getUserId() %></td>
									<td><%= b.getHit() %></td>
									<td><%= b.getCreateDate() %></td>
								</tr>
							<% 		} 
								}%>
						</table>
					</div>
				</div>
			
			<div class="clear-both"></div>
				<div class='pagingArea' align="center">
					<!-- 검색결과 페이징 -->
					<%if(!list.isEmpty()){ %>
					<button onclick="location.href='<%= request.getContextPath() %>/list.wac?currentPage=1'">&lt;&lt;</button>
					<button onclick="location.href='<%= request.getContextPath() %>/list.wac?currentPage=<%= currentPage-1 %>'" id="beforeBtn">PREV</button>
						<script>
							if(<%= currentPage %> <= 1){
								var before = $('#beforeBtn');
								before.attr('disabled','true');
							}
						</script>
						<% for(int p = startPage; p <= endPage; p++){ %>
							<%if(p == currentPage){ %>
								<button id="choosen" disabled><%= p %></button>
							<% } else { %>
								<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/list.wac?currentPage=<%= p  %>'"><%= p %></button>
							<% } %>
						<% } %>
						
						<!-- 다음 페이지로 가는 버튼 -->
						<button onclick="location.href='<%= request.getContextPath() %>/list.wac?currentPage=<%= currentPage + 1 %>'" id="afterBtn">NEXT</button>
						<script>
							if(<%= currentPage %> >= <%= maxPage %>){
								var after= $("#afterBtn");
								after.attr('disabled','true');
							}
						</script>
						
						<!-- 맨 끝으로 가는 버튼 -->
						<button onclick="location.href='<%= request.getContextPath() %>/list.wac?currentPage=<%= maxPage %>'">&gt;&gt;</button>			
						
						<% } %>
						
					</div>
					<!-- 로그인한 일반 회원만 작성하기 할 수 있도록 -->
						<div class='btnBox btnR' align='right'>
							 <% if(loginUser != null && loginUser.getGrade() != 0){ %> 
							<button class="defaultBtn" onclick='location.href="views/coupleStory/weAreCouple/weAreCoupleInsertForm.jsp"'>작성하기</button>
							<% } %> 
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
					location.href='<%= request.getContextPath() %>/detail.wac?postNo=' + postNo;
					// 로그인 한 사람만 상세보기 이용할 수 있게 하기
					<%if(loginUser != null){ %>
						location.href='<%= request.getContextPath() %>/detail.wac?postNo=' + postNo;
					 <% } else { %>
						alert('회원만 이용할 수 있는 서비스 입니다.');
						location.href='<%= request.getContextPath() %>/views/account/accountLoginForm.jsp';
					<% } %> 
				});
			});
			
			function search() {
				var searchWord = $('#searchCon').val()
				
				location.href='<%= request.getContextPath() %>/search.wac?searchWord='+searchWord;
			}
			
			 $(document).ready(function(){
			      $("#listArea").tablesorter();
			   });


		</script>
</body>
<%@ include file="../../common/footer.jsp" %>
</html>





















<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, board.model.vo.*,common.*" %>
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
<title>우리 커플 됐어요</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board.css">
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
		<div id="wrapper">
			<div id="main">
				<div class="pageTitle">
					<h1>우리 커플 됐어요</h1>
				</div>
				<div class="tableArea">
					<table id="listArea">
							<tr>
								<th width="70px">글번호</th>
								<th  width="300px">제목</th>
								<th  width="100px">작성자</th>
								<th  width="70px">조회수</th>
								<th  width="170px">작성일시</th>
							</tr>
						<% if(list.isEmpty()){ %>
							<tr>
								<td colspan="5">조회된 커플 리뷰가 없습니다.</td>
							</tr>
						<% } else{
								for(Board b : list){ %>
							<tr>
								<td><%= b.getPostNo() %><input type="hidden" value='<%=b.getPostNo() %>'></td>
								<td><%= b.getTitle() %></td>
								<td><%= b.getUserId() %></td>
								<td><%= b.getHit() %></td>
								<td><%= b.getCreateDate() %></td>
							</tr>
						<% 		} 
							}%>
					</table>
				</div>
			</div>
				<div class='pagingArea' align="center">
					<!-- 검색결과 페이징 -->
					<%if(!list.isEmpty()){ %>
					<button onclick="location.href='<%= request.getContextPath() %>/list.wac?currentPage=1'">&lt;&lt;</button>
					<button onclick="location.href='<%= request.getContextPath() %>/list.wac?currentPage=<%= currentPage-1 %>'" id="beforeBtn">&lt;</button>
						<script>
							if(<%= currentPage %> <= 1){
								var before = $('#beforeBtn');
								before.attr('disabled','true');
							}
						</script>
						<% for(int p = startPage; p <= endPage; p++){ %>
							<%if(p == currentPage){ %>
								<button id="choosen" disabled><%= p %></button>
							<% } else { %>
								<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/list.wac?currentPage=<%= p  %>'"><%= p %></button>
							<% } %>
						<% } %>
						
						<!-- 다음 페이지로 가는 버튼 -->
						<button onclick="location.href='<%= request.getContextPath() %>/list.wac?currentPage=<%= currentPage + 1 %>'" id="afterBtn">&gt;</button>
						<script>
							if(<%= currentPage %> >= <%= maxPage %>){
								var after= $("#afterBtn");
								after.attr('disabled','true');
							}
						</script>
						
						<!-- 맨 끝으로 가는 버튼 -->
						<button onclick="location.href='<%= request.getContextPath() %>/list.wac?currentPage=<%= maxPage %>'">&gt;&gt;</button>			
						
						<% } %>
						<!-- 로그인한 일반 회원만 작성하기 할 수 있도록 -->
						<div class='searchArea' align='right'>
							 <% if(loginUser != null && loginUser.getGrade() != 0){ %> 
							<button onclick='location.href="views/coupleStory/weAreCouple/weAreCoupleInsertForm.jsp"'>작성하기</button>
							<% } %> 
						</div>
					</div>
				
				<!-- <div class="search">
				<button id="searchBtn" onclick="search();">검색</button><input name="searchCon" id="searchCon" type="text" width="30">
				</div> -->
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
					location.href='<%= request.getContextPath() %>/detail.wac?postNo=' + postNo;
					// 로그인 한 사람만 상세보기 이용할 수 있게 하기
					<%if(loginUser != null){ %>
						location.href='<%= request.getContextPath() %>/detail.wac?postNo=' + postNo;
					 <% } else { %>
						alert('회원만 이용할 수 있는 서비스 입니다.');
						location.href='<%= request.getContextPath() %>/views/account/accountLoginForm.jsp';
					<% } %> 
				});
			});
			
			function search() {
				var searchWord = $('#searchCon').val()
				
				location.href='<%= request.getContextPath() %>/search.wac?searchWord='+searchWord;
			}
		</script>
</body>
</html> --%>