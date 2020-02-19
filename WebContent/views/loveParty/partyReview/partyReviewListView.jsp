<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, loveParty.partyReview.model.vo.*" %>
<%@ page import="common.*" %>
<%
	ArrayList<PartyReviewList> list = (ArrayList<PartyReviewList>)request.getAttribute("list");
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
		<div id="wrapper">
			<div id="main">
				<div class="pageTitle">
					<h1>우리 커플 됐어요</h1>
				</div>
				<div class="tableArea">
					<table id="listArea">
							<tr>
								<th width="100px">글번호</th>
								<th  width="100px">제목</th>
								<th  width="100px">작성자</th>
								<th  width="100px">조회수</th>
								<th  width="100px">작성일시</th>
							</tr>
						<% if(list.isEmpty()){ %>
							<tr>
								<td colspan="5">조회된 파티 리뷰가 없습니다.</td>
							</tr>
						<% } else{
								for(PartyReviewList p : list){ %>
							<tr>
								<td><%= p.getPostNo() %><input type="hidden" value='<%=p.getPostNo() %>'></td>
								<td><%= p.getTitle() %></td>
								<td><%= p.getUserName() %></td>
								<td><%= p.getHit() %></td>
								<td><%= p.getCreateDate() %></td>
							</tr>
						<% 		} 
							}%>
					</table>
				</div>
			</div>
			<div class='btnBox'>
				<input type="submit" value="작성" onclick='location.href="views/loveParty/partyReview/partyReviewInsertForm.jsp"'>
			</div>	
			<div class='pagingArea' align='center'>
			<%if(!list.isEmpty()){ %>
			<button onclick="location.href='<%= request.getContextPath() %>/list.pr?currentPage=1'">&lt;&lt;</button>
			<button onclick="location.href='<%= request.getContextPath() %>/list.pr?currentPage=<%= currentPage-1 %>'" id="beforeBtn">&lt;</button>
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
						<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/list.pr?currentPage=<%= p  %>'"><%= p %></button>
					<% } %>
				<% } %>
				
				<!-- 다음 페이지로 가는 버튼 -->
				<button onclick="location.href='<%= request.getContextPath() %>/list.pr?currentPage=<%= currentPage + 1 %>'" id="afterBtn">&gt;</button>
				<script>
					if(<%= currentPage %> >= <%= maxPage %>){
						var after= $("#afterBtn");
						after.attr('disabled','true');
					}
				</script>
				
				<!-- 맨 끝으로 가는 버튼 -->
				<button onclick="location.href='<%= request.getContextPath() %>/list.pr?currentPage=<%= maxPage %>'">&gt;&gt;</button>			
				
				<% } %>
				<!-- 로그인한 사람만 작성하기 할 수 있도록 -->
				<div class='searchArea' align='right'>
					<%-- <% if(loginUser != null){ %> --%>
					<button onclick='location.href="views/board/boardInsertForm.jsp"'>작성하기</button>
					<%-- <% } %> --%>
				</div>
			</div>
			<div class="searchArea">	
				<select id="category">			<!-- 옵션 자체의 값이 들어감 -->
					<option value="제목">제목</option>
					<option value="내용">내용</option>
					<option value="작성자">작성자</option>
				</select>
				<input type="text" id="text" name="title" placeholder= "내용을 입력해주세요."> 
				<input type="button" value="검색" id="searchButton">
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
				location.href='<%= request.getContextPath() %>/detail.pr?postNo=' + postNo;
				// 로그인 한 사람만 상세보기 이용할 수 있게 하기
				<%-- <%if(loginUser != null){ %>
					location.href='<%= request.getContextPath() %>/detail.pr?postNo=' + postNo;
				<%-- <% } else { %>
					alert('회원만 이용할 수 있는 서비스 입니다.');
				<% } %> --%>
			});
		});
	</script>
</body>
</html>