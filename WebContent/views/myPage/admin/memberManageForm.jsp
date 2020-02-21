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
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/SelectAll.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
</style>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp"%>
	<div class="outer">
		<div class="wrapper">
			<nav>
				<div class="nav">
					<div class="leftMenuTitle">마이페이지</div>
					<ul>
						<li class="leftMenu memberGradeUp"><a href="<%= request.getContextPath() %>/views/myPage/user/memberGradeUpForm.jsp">정회원 등업</a></li>
						<li class="leftMenu"><a href="">기본정보</a></li>
						<li class="leftMenu"><a href="">나의 프로필</a></li>
						<li class="leftMenu"><a href="">이상형 정보</a></li>
						<li class="leftMenu "><a href="">작성글 조회</a></li>			
						<li class="leftMenu heartHistory"><a href="<%= request.getContextPath() %>/list.hh">하트 히스토리</a></li>
						<br>
						<li class="leftMenu admin memberManage">
							<a href="<%=request.getContextPath()%>/manage.mem">회원 관리</a>
						</li>
						<li class="leftMenu admin boardManage">
							<a href="<%=request.getContextPath()%>/views/myPage/admin/boardManageForm.jsp">게시물 관리</a>
						</li>
						<li class="leftMenu admin partyManage">
							<a href="<%=request.getContextPath()%>/views/myPage/admin/partyManageForm.jsp">파티 관리</a>
						</li>	
					</ul>
				</div>
			</nav>
			<div class="main">
				<div class="pageTitle">
					<h2>회원 관리</h2>
				</div>
				<div class="contents">
					<form method="get" action="<%= request.getContextPath() %>/manage.mem">
						<div class="topBox">
							<div class="midBox">
								<div class="searchMenu">회원 등급</div>
								<div>
									<input type="radio" name="memGrade" value="0,1,2">전체 
									<input type="radio" name="memGrade" value="1">준회원
									<input type="radio" name="memGrade" value="2">정회원 
									<input type="radio" name="memGrade" value="4">등업대기
								</div>
							</div>
							<div class="midBox">
								<div class="searchMenu">검색어</div>
								<div>
									<select class="search" name="sCategory">
										<option value="USER_NAME">이름</option>
										<option value="USER_NO">회원번호</option>
										<option value="ID">아이디</option>
									</select>
									<input placeholder="검색어를 입력하세요!" class="search search2" type="text" name="sWord">
									<button class="defaultBtn searchBtn" type="submit" id="SearchBtn">검색</button>
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
									<td colspan="9">조회된 리스트가 없습니다.</td>
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
									<td><%= a.getDeleted() %></td>
									<td><%= a.getDeleted() %></td>
								</tr>			
								<% 		}
									}
								%>
							</tbody>
						</table>
						<div id="btnBox btnC">
							<button type="submit" class="defaultBtn">등급 변경</button>
							<button type="submit" class="defaultBtn">탈퇴 처리</button>
						</div>
					</form>
					
					<div class='pagingArea' align="center">
					<% if(!list.isEmpty() && maxPage != 1){ %>
					<!-- 맨 처음으로 -->
					<button onclick="location.href='<%= request.getContextPath() %>/manage.mem?currentPage=1'">&lt;&lt;</button>
			
					<!-- 이전 페이지로 -->
					<button onclick="location.href='<%= request.getContextPath() %>/manage.mem?currentPage=<%= currentPage-1 %>'" id="beforeBtn">&lt;</button>
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
							<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/manage.mem?currentPage=<%= p %>'"><%= p %></button>
						<% } %>
					<% } %>
					
					<!-- 다음 페이지로 -->
					<button onclick="location.href='<%= request.getContextPath() %>/manage.mem?currentPage=<%= currentPage + 1 %>'" id="afterBtn">&gt;</button>
					<script>
						if(<%= currentPage %> >= <%= maxPage %>){
							var after = $("#afterBtn");
							after.attr('disabled', 'true');
						}
					</script>			
					
					<!-- 맨 끝으로 -->
					<button onclick="location.href='<%= request.getContextPath() %>/manage.mem?currentPage=<%= maxPage %>'">&gt;&gt;</button>						
					<% } %>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
	<script>
		$(function(){
			$('.memberManage').addClass('on')
		});		
		
		<%-- var searchList;
		
		$('#SearchBtn').click(function(){
				// 검색버튼을 클릭했다는걸 알려주는 변수 (서블릿 전달 용도)
			/* var sBtn = 1;
					// 0일때, 처음 페이지 불러오기!
					// 1일때, 검색 작동! */
		
				// 1.검색범위(회원등급)와 2.검색종류와 3.검색어 받기
			//$('tbody').hide(); - aJax 작동 테스트
			var memGrade = $('input[name="memGrade"]:checked').val();;
			var sCategory = $("#sCategory option:selected").val();
			var sWord = $("#sWord").val();
				
			console.log(memGrade, sCategory, sWord);
			$.ajax({
				url: '<%= request.getContextPath() %>/search.mem',
				type: 'post',
				data: {memGrade: memGrade, sCategory: sCategory, sWord: sWord},
				success: function(data){
					alert('조회 성공했습니다!');
					
				} 
			});
		}); --%>
	</script>
</html>