<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, common.PageInfo, myPage.user.model.vo.*" %>
<%
	ArrayList<Recommend> list = (ArrayList<Recommend>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	String MatchStatus = "";
	String inOut = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하트 히스토리</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/SelectAll.js"></script>

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
						<% if(loginUser != null && loginUser.getGrade() == 0){ %>
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
						<% } %>
					</ul>
				</div>
			</nav>
			<div class="main">
				<div class="pageTitle">
					<h2>하트 히스토리</h2>
				</div>
				<div class="information">
					상대방에게 보낸 응답은 7일 동안 유지됩니다. 7일이 지난 후 자동적으로 삭제됩니다.<br>
					매칭이 성사된 응답에서는 데이트 장소를 추천 받을 수 있습니다.<br>
					히스토리 삭제 시, 상대방에게 보낸 응답도 삭제 되고 복구가 되지않습니다.
				</div>
				<div class="contents">
					<form method="get">
						<table class="mainBoard">
								<tr>
									<th><input type="checkbox" id="all" onclick="checkAll();"></th>
									<th>분류</th>
									<th>회원 이미지</th>
									<th>상태</th>
									<th>데이트 장소 추천</th>
									<th>남은 기간</th>
								</tr>
								<% if(list.isEmpty()){ %>
								<tr>
									<td colspan="6">조회된 리스트가 없습니다.</td>
								</tr>
								<% } else{ 
										for(Recommend r : list){
										switch(r.getMatchStatus()){
										case "D": MatchStatus = "상대방의 응답을 기다리고 있습니다."; break;
										case "C": MatchStatus = "확인 완료"; break;
										case "S": MatchStatus = "하트 보냄"; break;
										case "A": MatchStatus = "하트 수락"; break;
										}
										/* if(r.getUserNo() == loginUser.getUserNo){
											inOut = "발신";
										} else {
											inOut = "수신";
										} */
								%>		
								<tr>
									<td><input type="checkbox" id="all" name="checkselect" onclick="checkDetail();"></td>
									<td>수신/발신</td>
									<td>이미지 들어가야함</td>
									<td>
										<ul class="heartState">
											<li><%= r.getTargetNo() %></li>
											<li><%= MatchStatus %></li>
											<li><%= r.getMatchDate() %></li>
										</ul>
									</td>
									<td>
										<input type="button" class="defaultBtn subBtn" value="데이트 장소 추천" onclick="">
									</td>
									<td>남은 기간 표시</td>
								</tr>			
								<% 		}
									}
								%>
						</table>
					</form>
				</div>
				<div class="btnBox btnC" >
				<input type="button" class="defaultBtn" value="게시물 삭제">
				</div>
					<!-- 페이징 -->
				<div class='pagination' align="center">
					<% if(!list.isEmpty() && maxPage != 1){ %>
					<!-- 맨 처음으로 -->
					<button onclick="location.href='<%= request.getContextPath() %>/list.hh?currentPage=1'">&lt;&lt;</button>
			
					<!-- 이전 페이지로 -->
					<button onclick="location.href='<%= request.getContextPath() %>/list.hh?currentPage=<%= currentPage-1 %>'" id="beforeBtn">&lt;</button>
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
							<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/list.hh?currentPage=<%= p %>'"><%= p %></button>
						<% } %>
					<% } %>
					
					<!-- 다음 페이지로 -->
					<button onclick="location.href='<%= request.getContextPath() %>/list.hh?currentPage=<%= currentPage + 1 %>'" id="afterBtn">&gt;</button>
					<script>
						if(<%= currentPage %> >= <%= maxPage %>){
							var after = $("#afterBtn");
							after.attr('disabled', 'true');
						}
					</script>			
					
					<!-- 맨 끝으로 -->
					<button onclick="location.href='<%= request.getContextPath() %>/list.hh?currentPage=<%= maxPage %>'">&gt;&gt;</button>
					<% } %>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	<%-- $(function(){
			<% if(loginUser != null){ %>
				location.href='<%= request.getContextPath() %>/detail.bo?bid=' + bid;
			<% } else{ %>
				alert('회원만 이용할 수 있는 서비스입니다.');
			<% } %>
		});
	}); --%>
	
	$(function(){
		$('.heartHistory').addClass('on')
	});
</script>
</html>