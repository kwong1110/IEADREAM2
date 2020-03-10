<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, common.PageInfo, myPage.user.model.vo.*, java.util.*, java.text.*, java.sql.Date" %>
<%
	ArrayList<Match> list = (ArrayList<Match>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String userNo = request.getParameter("userNo");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	String matchStatus = "";
	String inOut = "";
	
	SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
	java.util.Date utilDate = new java.util.Date();
	java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	/* String currentDate = format1.format(currentTime); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이어드림 - 하트 히스토리</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/SelectAll.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	.reception{
		background: url('<%= request.getContextPath() %>/images/myPage/reception.png') no-repeat center center;
		background-size: cover;
	}
	.sent{
		background: url('<%= request.getContextPath() %>/images/myPage/sent.png') no-repeat center center;
		background-size: cover;
	}
	.blinking{
		color: pink;
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
	<%@ include file="../../common/mainmenu.jsp"%>
	<div class="outer">
		<div class="wrapper">
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
						<div class="tableArea">
							<table class="mainBoard" id="boManageForm">
								<thead>
									<tr>
										<th><input type="checkbox" id="all" onclick="checkAll();"></th>
										<th>분류</th>
										<th>회원 이미지</th>
										<th>상태</th>
										<th>데이트 장소 추천</th>
										<th>남은 기간</th>
										<th><input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>"></th>
									</tr>
								</thead>
								<tbody>
									<% if(list.isEmpty()){ %>
									<tr>
										<td colspan="6">조회된 리스트가 없습니다.</td>
									</tr>
									<% } else{ 
											for(Match m : list){
											switch(m.getMatchStatus()){
											case "D": matchStatus = "상대방의 응답을 기다리고 있습니다."; break;
											case "C": matchStatus = "확인 완료"; break;
											case "S": matchStatus = "하트 보냄"; break;
											case "A": matchStatus = "하트 수락"; break;
											}
											if(m.getUserNo() == loginUser.getUserNo()){
												inOut = "발신";
											} else {
												inOut = "수신";
												matchStatus = "하트가 날아왔습니다! 확인해주세요!";
											} 
									%>
									<tr>
										<td><input type="checkbox" id="all" name="checkselect" value="<%= m.getTargetNo() %>,<%= m.getUserNo() %>" onclick="checkDetail();"></td>
										<% if(inOut.equals("수신")){ %>
										<td class="reception"></td>
										<% } else { %>
										<td class="sent"></td>
										<% } %>
										<td>이미지 들어가야함</td>
										<td>
											<ul class="heartState">
												<li>회원번호 <%= m.getTargetNo() %></li>
												<% if(inOut.equals("수신")){ %>
												<li class="blinking"><%= matchStatus %></li>
												<% } else { %>
												<li><%= matchStatus %></li>
												<% } %>
												<li><%= m.getMatchDate() %></li>
											</ul>
										</td>
										<td>
											<% if(matchStatus.equals("하트 수락")){ %>
												<input type="button" class="defaultBtn subBtn" value="데이트 장소 추천" onclick="heartDate()">
												<input type="hidden" id="okTarget" name="okTarget" value="<%= m.getTargetNo() %>">
												<input type="hidden" id="okUser" name="okUser" value="<%= m.getUserNo() %>">
											<% } %>
										</td>
										<% long leftDays = 7 - (sqlDate.getTime() - m.getMatchDate().getTime()) / (24*60*60*1000); %>
										<% if(matchStatus.equals("하트 수락")){ %>
										<td>없음</td>
										<% } else { %>
										<td>
											<%= leftDays %>일
											<% if(leftDays <= 0) {%>
											<input type="hidden" class="leftDays" name="leftDays" value="<%= leftDays %>">
											<input type="hidden" class="autoDTarget" name="autoDTarget" value="<%= m.getTargetNo() %>">
											<input type="hidden" class="autoDUser" name="autoDUser" value="<%= m.getUserNo() %>">
											<% } %>
										</td>
										<% } %>
									</tr>			
									<% 		}
										}
									%>
								</tbody>
							</table>
						</div>
					</form>
					<div class="btnBox btnC" >
					<input type="button" class="defaultBtn cancelBtn" value="삭제" onclick="deleteHeart();">
					</div>
						<!-- 페이징 -->
					<div class='pagingArea' align="center">
						<% if(!list.isEmpty() && maxPage != 1){ %>
						<!-- 맨 처음으로 -->
						<button onclick="location.href='<%= request.getContextPath() %>/list.hh?currentPage=1&userNo=<%= userNo %>'">&lt;&lt;</button>
				
						<!-- 이전 페이지로 -->
						<button onclick="location.href='<%= request.getContextPath() %>/list.hh?currentPage=<%= currentPage-1 %>&userNo=<%= userNo %>'" id="beforeBtn">PREV</button>
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
								<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/list.hh?currentPage=<%= p %>&userNo=<%= userNo %>'"><%= p %></button>
							<% } %>
						<% } %>
						
						<!-- 다음 페이지로 -->
						<button onclick="location.href='<%= request.getContextPath() %>/list.hh?currentPage=<%= currentPage + 1 %>&userNo=<%= userNo %>'" id="afterBtn">NEXT</button>
						<script>
							if(<%= currentPage %> >= <%= maxPage %>){
								var after = $("#afterBtn");
								after.attr('disabled', 'true');
							}
						</script>			
						
						<!-- 맨 끝으로 -->
						<button onclick="location.href='<%= request.getContextPath() %>/list.hh?currentPage=<%= maxPage %>&userNo=<%= userNo %>'">&gt;&gt;</button>
						<% } %>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="../../common/footer.jsp"%>
<script>
	function deleteHeart(){
		var checkList = [];
		
		if($("input:checkbox[name='checkselect']:checked").val() == null){
			alert("삭제할 하트를 선택해주세요!");
		}else {
			$("input:checkbox[name='checkselect']:checked").each(function() {
				checkList.push($(this).val());			
			});
				// 체크박스 체크된 값의 value를 checkList에 저장한다.
				
			// 새로열리는 창 크기 및 위치 설정
			var popLeft = Math.ceil(( window.screen.width - 400 )/2);
			var popTop = Math.ceil(( window.screen.height - 500 )/2);
			
			window.open("views/myPage/user/heartDeleteForm.jsp?checkList="+checkList+"&loginNo="+<%= loginUser.getUserNo() %>, "deleteBoard", "width=400, height=500, "+ ", left=" + popLeft + ", top="+ popTop);	
		};
	}
	
	function heartDate(){
		var okTarget = $('#okTarget').val();
		var okUser = $('#okUser').val();
		
		location.href="<%= request.getContextPath() %>/list.hhd?okTarget="+okTarget+"&okUser="+okUser;
	}
	
	window.onload = function(){
		
		var autoDTargetArr = [];
		var autoDUserArr= [];
		
		$('.autoDTarget').each(function(){
			autoDTargetArr.push($(this).val());
		});
		
		$('.autoDUser').each(function(){
			autoDUserArr.push($(this).val());
		});
		
		$.ajaxSettings.traditional = true;
		$.ajax({
			url: '<%= request.getContextPath() %>/autodelete.hh',
			type: 'get',
			data: {autoDTargetArr:autoDTargetArr, autoDUserArr:autoDUserArr},
			success: function(data){
				window.location.reload();
				alert(data);
			}
		});			
	}
</script>
</html>