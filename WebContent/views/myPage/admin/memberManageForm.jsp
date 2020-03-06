<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="account.model.vo.*, common.*, java.util.ArrayList" %>
<%
	response.setContentType("text/html; charset=UTF-8");
	
	ArrayList<Account> list = (ArrayList<Account>)request.getAttribute("list");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	String memGrade = request.getParameter("memGrade");
	String sCategory = request.getParameter("sCategory");
	String sWord = request.getParameter("sWord");
	String search = request.getParameter("search");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	String viewGrade = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이어드림 - 회원 관리</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/SelectAll.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp"%>
	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h2>회원 관리</h2>
				</div>
				<div class="contents">
					<form method="get" action="<%= request.getContextPath() %>/manage.mem" id="searchBox">
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
									<input type="hidden" name="search" value="on">
									<button class="defaultBtn searchBtn" type="submit" id="SearchBtn">검색</button>
								</div>
							</div>
						</div>
					</form>
					<form method="get">
						<table class="mainBoard" id="memManageForm">
							<thead>
								<tr>
									<th><input type="checkbox" id="all" onclick="checkAll();"></th>
									<th>회원번호</th>
									<th>아이디</th>
									<th>이름</th>
									<th>연락처</th>
									<th>회원등급</th>
									<th>탈퇴 유무</th>
								</tr>
							</thead>
							<tbody>
								<% if(list.isEmpty()){ %>
								<tr>
									<td colspan="7">조회된 목록이 없습니다.</td>
								</tr>
								<% } else{ 
										for(Account a : list){
								%>		
								<tr>
									<td><input type="checkbox" name="checkselect" value="<%= a.getUserNo() %>,<%= a.getUserName() %>" onclick="checkDetail()"></td>
									<td><%= a.getUserNo() %><input type="hidden" value='<%= a.getUserNo() %>' name='userNo'></td>
									<td><%= a.getId() %><input type="hidden" value='<%= a.getId() %>' name='userId'></td>
									<td><%= a.getUserName() %><input type="hidden" value='<%= a.getUserName() %>' name='userName'></td>
									<td><%= a.getPhone() %></td>
									<td>
										<% switch(a.getGrade()) {
										case 0: viewGrade = "관리자"; break;
										case 1: viewGrade = "준회원"; break;
										case 2: viewGrade = "정회원"; break;
										case 4: viewGrade = "결제 대기"; break;
										} %>
										<%= viewGrade %>
									</td>
									<td><%= a.getDeleted() %></td>
								</tr>			
								<% 		}
									}
								%>
							</tbody>
						</table>
						<div class="btnBox btnC">
							<button type="button" class="defaultBtn" id="updateBtn" onclick="updateMember();">등급 변경</button>
							<button type="button" class="defaultBtn cancelBtn" id="deleteBtn" onclick="deleteMember();">탈퇴 처리</button>
						</div>
					</form>
					
					<div class='pagingArea' align="center">
					<!-- 검색결과 페이징 -->
					<% if(search != null){ %>
						<% if(!list.isEmpty() && maxPage != 1){ %>
							<!-- 맨 처음으로 -->
							<button onclick="location.href='<%= request.getContextPath() %>/manage.mem?currentPage=1&memGrade=<%= memGrade %>&sCategory=<%= sCategory %>&sWord=<%= sWord %>&search=<%= search %>'">&lt;&lt;</button>
					
							<!-- 이전 페이지로 -->
							<button onclick="location.href='<%= request.getContextPath() %>/manage.mem?currentPage=<%= currentPage-1 %>&memGrade=<%= memGrade %>&sCategory=<%= sCategory %>&sWord=<%= sWord %>&search=<%= search %>'" id="beforeBtn">PREV</button>
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
									<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/manage.mem?currentPage=<%= p %>&memGrade=<%= memGrade %>&sCategory=<%= sCategory %>&sWord=<%= sWord %>&search=<%= search %>'"><%= p %></button>
								<% } %>
							<% } %>
							
							<!-- 다음 페이지로 -->
							<button onclick="location.href='<%= request.getContextPath() %>/manage.mem?currentPage=<%= currentPage + 1 %>&memGrade=<%= memGrade %>&sCategory=<%= sCategory %>&sWord=<%= sWord %>&search=<%= search %>'" id="afterBtn">NEXT</button>
							<script>
								if(<%= currentPage %> >= <%= maxPage %>){
									var after = $("#afterBtn");
									after.attr('disabled', 'true');
								}
							</script>			
							
							<!-- 맨 끝으로 -->
							<button onclick="location.href='<%= request.getContextPath() %>/manage.mem?currentPage=<%= maxPage %>&memGrade=<%= memGrade %>&sCategory=<%= sCategory %>&sWord=<%= sWord %>&search=<%= search %>'">&gt;&gt;</button>						
						<% } %>
					<% } else { %>
						<!-- 첫 화면 페이징 -->
						<% if(!list.isEmpty() && maxPage != 1){ %>
							<!-- 맨 처음으로 -->
							<button onclick="location.href='<%= request.getContextPath() %>/manage.mem?currentPage=1'">&lt;&lt;</button>
					
							<!-- 이전 페이지로 -->
							<button onclick="location.href='<%= request.getContextPath() %>/manage.mem?currentPage=<%= currentPage-1 %>'" id="beforeBtn">PREV</button>
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
							<button onclick="location.href='<%= request.getContextPath() %>/manage.mem?currentPage=<%= currentPage + 1 %>'" id="afterBtn">NEXT</button>
							<script>
								if(<%= currentPage %> >= <%= maxPage %>){
									var after = $("#afterBtn");
									after.attr('disabled', 'true');
								}
							</script>			
							
							<!-- 맨 끝으로 -->
							<button onclick="location.href='<%= request.getContextPath() %>/manage.mem?currentPage=<%= maxPage %>'">&gt;&gt;</button>						
						<% } %>
					<% } %>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="../../common/footer.jsp"%>
<script>
	$('#SearchBtn').click(function(){
		if($('input[name="memGrade"]:checked').val() == null){
			event.preventDefault();
			alert("회원등급을 선택해주세요!");
		};
	});
	
	function updateMember(){
		var checkList = [];
		
		if($("input:checkbox[name='checkselect']:checked").val() == null){
			alert("등급을 변경할 회원을 선택해주세요!");
		}else {
			$("input:checkbox[name='checkselect']:checked").each(function() {
				checkList.push($(this).val());			
			});
				// 체크박스 체크된 값의 value를 checkList에 저장한다.
			
				
			// 새로열리는 창 크기 및 위치 설정
			var popLeft = Math.ceil(( window.screen.width - 400 )/2);
			var popTop = Math.ceil(( window.screen.height - 500 )/2);
			
			window.open("views/myPage/admin/memberUpdateForm.jsp?checkList="+checkList, "updateMember", "width=400, height=500, "+ ", left=" + popLeft + ", top="+ popTop); 	
		};
	}
	
	function deleteMember(){
		var checkList = [];
		
		if($("input:checkbox[name='checkselect']:checked").val() == null){
			alert("탈퇴할 회원을 선택해주세요!");
		}else {
			$("input:checkbox[name='checkselect']:checked").each(function() {
				checkList.push($(this).val());			
			});
				// 체크박스 체크된 값의 value를 checkList에 저장한다.
			
				
			// 새로열리는 창 크기 및 위치 설정
			var popLeft = Math.ceil(( window.screen.width - 400 )/2);
			var popTop = Math.ceil(( window.screen.height - 500 )/2);
			
			window.open("views/myPage/admin/memberDeleteForm.jsp?checkList="+checkList, "deleteMember", "width=400, height=500, "+ ", left=" + popLeft + ", top="+ popTop); 	
		};
	}
	<%-- 새로운 HTML이 추가되는 것이 아니기 때문에 비동기 방식을 굳이 할 필요는 없음. --%>
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
	
	$(function(){
		$('#memManageForm td').mouseenter(function(){
			$(this).parent().css({'background':'darkgray','cursor':'pointer'});
		}).mouseout(function(){
			$(this).parent().css('background','none');
		}).click(function(){
			var checkboxYn = $(this).find("input[type='checkbox']").length;
			var postNo = $(this).parent().children().children('input').val();
			
			 if (checkboxYn == 0) {
				<%if(loginUser != null && loginUser.getGrade()!=0){ %>
					location.href='<%= request.getContextPath() %>/detail.qu?postNo=' + postNo;
				<% } else if(loginUser != null && loginUser.getGrade()==0){ %>
					location.href='<%= request.getContextPath() %>/Mdetail.qu?postNo=' + postNo;
				<% } else{%> 
					alert('회원만 이용할 수 있는 서비스 입니다.');
					location.href='<%= request.getContextPath() %>/views/account/accountLoginForm.jsp';
				<% } %> 
			 }
		});
	});
</script>
</html>