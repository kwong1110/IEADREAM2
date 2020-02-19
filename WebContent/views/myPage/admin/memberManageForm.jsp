<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="account.model.vo.*, common.*, java.util.ArrayList" %>
<%
	ArrayList<Account> list = (ArrayList<Account>)request.getAttribute("list");
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
<title>회원 관리</title>
<link rel="stylesheet" type="text/html" href="<%= request.getContextPath() %>/css/common.css">
<link rel="stylesheet" type="text/html" href="<%= request.getContextPath() %>/css/board.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/SelectAll.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp"%>
	<div class="outer">
		<div class="wrapper">
		<nav>
		
		</nav>
		<div class="main">
			<div class="pageTitle">
				<h2>회원 관리</h2>
			</div>
		</div>
			<div class="contents">
				<form method="get">
					<div class="topBox">
						<div class="midBox">
							<div class="searchMenu">회원 등급</div>
							<div>
								<input type="checkbox" name="allMember">전체 <input type="checkbox" name="member1">준회원
								<input type="checkbox" name="member2">정회원 <input type="checkbox" name="gradeWaiting">등업대기
							</div>
						</div>
						<div class="midBox">
							<div class="searchMenu">검색어</div>
							<div>
								<select class="search">
									<option value="name">이름</option>
									<option value="userNum">회원번호</option>
									<option value="userId">아이디</option>
								</select>
								<input placeholder="검색어를 입력하세요!" class="search search2" type="text">
								<button class="defaultBtn searchBtn" type="button">검색</button>
							</div>
						</div>
					</div>
					<table class="mainBoard">
						<thead>
							<tr>
								<th><input type="checkbox" id="all" onclick="checkAll();"></th>
								<th>No</th>
								<th>회원번호</th>
								<th>아이디</th>
								<th>이름</th>
								<th>연락처</th>
								<th>회원등급</th>
								<th>가입비 유무</th>
								<th>탈퇴 유무</th>
							</tr>
						</thead>
						<tbody>
							<% if(list.isEmpty()){ %>
							<tr>
								<td colspan="6">조회된 리스트가 없습니다.</td>
							</tr>
							<% } else{ 
									for(Account a : list){
							%>		
							<tr>
								<td><input type="checkbox" name="checkselect"
									onclick="checkDetail()"></td>
								<td><%= a.getUserNo() %><input type="hidden" value='<%= a.getUserNo() %>'></td>
								<td><%= a.getUserNo() %></td>
								<td><%= a.getId() %></td>
								<td><%= a.getUserName() %></td>
								<td><%= a.getPhone() %></td>
								<td><%= a.getGrade() %></td>
								<td><%= a.getGrade() %></td>
								<td><%= a.getDeleted() %></td>
							</tr>			
							<% 		}
								}
							%>
							<tr>
								<td><input type="checkbox" name="checkselect"
									onclick="checkDetail()"></td>
								<td>2</td>
								<td>A2000000</td>
								<td>user02</td>
								<td>임승우</td>
								<td>010-1111-3333</td>
								<td>정회원</td>
								<td>Y</td>
								<td>N</td>
							</tr>
						</tbody>
					</table>
				</form>
				
				<div class='pagingArea' align="center">
			<% if(!list.isEmpty()){ %>
			<!-- 맨 처음으로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/list.bo?currentPage=1'">&lt;&lt;</button>
	
			<!-- 이전 페이지로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/list.bo?currentPage=<%= currentPage-1 %>'" id="beforeBtn">&lt;</button>
			<script>
				if(<%= currentPage %> <= 1){
					var before = $('#beforeBtn');
					before.attr('disabled', 'true');
				}
			</script>
			
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = startPage; p <= endPage; p++){ %>
				<% if(p == currentPage){%>
					<button id="choosen" disabled><%= p %></button>
				<% } else{ %>
					<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/list.bo?currentPage=<%= p %>'"><%= p %></button>
				<% } %>
			<% } %>
			
			<!-- 다음 페이지로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/list.bo?currentPage=<%= currentPage + 1 %>'" id="afterBtn">&gt;</button>
			<script>
				if(<%= currentPage %> >= <%= maxPage %>){
					var after = $("#afterBtn");
					after.attr('disabled', 'true');
				}
			</script>			
			
			<!-- 맨 끝으로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/list.bo?currentPage=<%= maxPage %>'">&gt;&gt;</button>
			
				
			<% } %>
			<div class='searchArea' align='right'>
				<%-- <% if(loginUser != null){ %>
				<button onclick='location.href="views/board/boardInsertForm.jsp"'>작성하기</button>
				<% } %> --%>
			</div>
		</div>
				<div id="btnBox btnC">
					<button type="submit" class="defaultBtn">등급 변경</button>
					<button type="submit" class="defaultBtn">탈퇴 처리</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>