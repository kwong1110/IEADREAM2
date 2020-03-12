<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.model.vo.*, common.*, java.util.ArrayList" %>
<%
	response.setContentType("text/html; charset=UTF-8");
	
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	String bCategory = request.getParameter("bCategory");
	String sCategory = request.getParameter("sCategory");
	String sWord = request.getParameter("sWord");
	String search = request.getParameter("search");
	String userNo = request.getParameter("userNo");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	String viewBoard = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이어드림 - 작성글 조회</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/SelectAll.js"></script>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp"%>
	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h2>작성글 조회</h2>
				</div>
				<div class="contents">
					<form method="get" action="<%= request.getContextPath() %>/list.mwl" id="searchBox">
						<div class="topBox">
							<div class="midBox">
								<input type="hidden" name="userNo" value="<%= userNo %>">
								<div class="searchMenu">카테고리</div>
								<div>
									<% if(loginUser != null && loginUser.getGrade() == 0){ %>
										<select class="search" name="bCategory" id="bCategoryBox">
											<option value="1,2,3,4,5,6">전체</option>
											<option value="1">베스트커플</option>
											<option value="6">FAQ</option>
										</select>
									<% } else { %>
										<select class="search" name="bCategory" id="bCategoryBox">
											<option value="2,4,5">전체</option>
											<option value="2">우리커플됐어요</option>
											<option value="5">1:1문의</option>
										</select>
									<% } %>
								</div>
							</div>
							<div class="midBox">
								<div class="searchMenu">검색어</div>
								<div>
									<select class="search" name="sCategory" id="sCategoryBox">
										<option value="B_NAME">게시글 제목</option>
										<option value="B_DATE">게시일자</option>
									</select>
									<input placeholder="검색어를 입력하세요!" class="search search2" type="text" name="sWord" id="sWordId">
									<input type="hidden" name="search" value="on">
									<button class="defaultBtn searchBtn" type="submit" id="SearchBtn">검색</button>
								</div>
							</div>
						</div>
					</form>
					<form method="get">
						<div class="tableArea">
							<table class="mainBoard" id="boManageForm">
								<thead>
									<tr>
										<th><input type="checkbox" id="all" onclick="checkAll();"></th>
										<th>게시글번호</th>
										<th>카테고리</th>
										<th>글 제목</th>
										<th>게시일자</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<% if(list.isEmpty()){ %>
									<tr>
										<td colspan="6">조회된 목록이 없습니다.</td>
									</tr>
									<% } else{ 
											for(Board b : list){
									%>		
									<tr>
										<td><input type="checkbox" name="checkselect" value="<%= b.getTitle() %>,<%= b.getPostNo() %>" onclick="checkDetail()"></td>
										<td><%= b.getPostNo() %><input type="hidden" value="<%= b.getPostNo() %>"></td>
										<td>
											<% switch(b.getBoardNo()) {
											case 1: viewBoard = "베스트커플"; break;
											case 2: viewBoard = "우리커플됐어요"; break;
											case 4: viewBoard = "파티참여후기"; break;
											case 5: viewBoard = "1:1문의"; break;
											case 6: viewBoard = "FAQ"; break;
											} %>
											<%= viewBoard %>
											<input type="hidden" value="<%= b.getBoardNo() %>">
										</td>
										<td><%= b.getTitle() %></td>
										<td><%= b.getCreateDate() %></td>
										<td><%= b.getHit() %></td>
									</tr>			
									<% 		}
										}
									%>
								</tbody>
							</table>
						</div>
						<div class="btnBox btnC">
							<button type="button" class="defaultBtn cancelBtn" id="deleteBtn" onclick="deleteBoard();">게시글 삭제</button>
						</div>
					</form>
					
					<div class='pagingArea' align="center">
					<!-- 검색결과 페이징 -->
					<% if(search != null){ %>
						<% if(!list.isEmpty() && maxPage != 1){ %>
							<!-- 맨 처음으로 -->
							<button onclick="location.href='<%= request.getContextPath() %>/list.mwl?currentPage=1&bCategory=<%= bCategory %>&sCategory=<%= sCategory %>&sWord=<%= sWord %>&search=<%= search %>&userNo=<%= userNo %>'">&lt;&lt;</button>
					
							<!-- 이전 페이지로 -->
							<button onclick="location.href='<%= request.getContextPath() %>/list.mwl?currentPage=<%= currentPage-1 %>&bCategory=<%= bCategory %>&sCategory=<%= sCategory %>&sWord=<%= sWord %>&search=<%= search %>&userNo=<%= userNo %>'" id="beforeBtn">PREV</button>
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
									<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/list.mwl?currentPage=<%= p %>&bCategory=<%= bCategory %>&sCategory=<%= sCategory %>&sWord=<%= sWord %>&search=<%= search %>&userNo=<%= userNo %>'"><%= p %></button>
								<% } %>
							<% } %>
							
							<!-- 다음 페이지로 -->
							<button onclick="location.href='<%= request.getContextPath() %>/list.mwl?currentPage=<%= currentPage + 1 %>&bCategory=<%= bCategory %>&sCategory=<%= sCategory %>&sWord=<%= sWord %>&search=<%= search %>&userNo=<%= userNo %>'" id="afterBtn">NEXT</button>
							<script>
								if(<%= currentPage %> >= <%= maxPage %>){
									var after = $("#afterBtn");
									after.attr('disabled', 'true');
								}
							</script>			
							
							<!-- 맨 끝으로 -->
							<button onclick="location.href='<%= request.getContextPath() %>/list.mwl?currentPage=<%= maxPage %>&bCategory=<%= bCategory %>&sCategory=<%= sCategory %>&sWord=<%= sWord %>&search=<%= search %>&userNo=<%= userNo %>'">&gt;&gt;</button>						
						<% } %>
					<% } else { %>
						<!-- 첫 화면 페이징 -->
						<% if(!list.isEmpty() && maxPage != 1){ %>
							<!-- 맨 처음으로 -->
							<button onclick="location.href='<%= request.getContextPath() %>/list.mwl?currentPage=1&userNo=<%= userNo %>'">&lt;&lt;</button>
					
							<!-- 이전 페이지로 -->
							<button onclick="location.href='<%= request.getContextPath() %>/list.mwl?currentPage=<%= currentPage-1 %>&userNo=<%= userNo %>'" id="beforeBtn">PREV</button>
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
									<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/list.mwl?currentPage=<%= p %>&userNo=<%= userNo %>'"><%= p %></button>
								<% } %>
							<% } %>
							
							<!-- 다음 페이지로 -->
							<button onclick="location.href='<%= request.getContextPath() %>/list.mwl?currentPage=<%= currentPage + 1 %>&userNo=<%= userNo %>'" id="afterBtn">NEXT</button>
							<script>
								if(<%= currentPage %> >= <%= maxPage %>){
									var after = $("#afterBtn");
									after.attr('disabled', 'true');
								}
							</script>			
							
							<!-- 맨 끝으로 -->
							<button onclick="location.href='<%= request.getContextPath() %>/list.mwl?currentPage=<%= maxPage %>&userNo=<%= userNo %>'">&gt;&gt;</button>						
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
		if($('#sCategoryBox option:selected').val() == 'B_DATE'){
			if(!$('#sWordId').val().includes("/")){
				event.preventDefault();
				alert("아래와 같은 날짜 형식으로 검색해주세요! \n ex) 20/02/08 ");
			}
		}
		
		if($('#bCategoryBox option:selected').val() == '2' || $('#bCategoryBox option:selected').val() == '5'){
			$('#bCategoryBox').attr('action', '<%= request.getContextPath() %>/manage.bo');
			$('#bCategoryBox').submit();
		}
	});
	
	function deleteBoard(){
		var checkList = [];
		
		if($("input:checkbox[name='checkselect']:checked").val() == null){
			alert("삭제할 게시글을 선택해주세요!");
		}else {
			$("input:checkbox[name='checkselect']:checked").each(function() {
				checkList.push($(this).val());			
			});
				// 체크박스 체크된 값의 value를 checkList에 저장한다.
				
			// 새로열리는 창 크기 및 위치 설정
			var popLeft = Math.ceil(( window.screen.width - 400 )/2);
			var popTop = Math.ceil(( window.screen.height - 500 )/2);
			
			window.open("views/myPage/user/myWritingDeleteForm.jsp?checkList="+checkList, "deleteBoard", "width=400, height=500, "+ ", left=" + popLeft + ", top="+ popTop);	
		};
	}
	
	$(function(){
		$('#boManageForm td').mouseenter(function(){
			$(this).parent().css({'background':'darkgray','cursor':'pointer'});
		}).mouseout(function(){
			$(this).parent().css('background','none');
		}).click(function(){
			var checkboxYn = $(this).find("input[type='checkbox']").length;
			var postNo = $(this).parent().children().eq(1).children('input').val();
			var categoryNo = $(this).parent().children().eq(2).children('input').val();
			
			// console.log("게시글번호 : " + postNo + "/ 카테고리 번호 : " + categoryNo);
			
			var eachLocation = "";
			
			if (checkboxYn == 0) {
				// 사용자
				if(categoryNo == 5){
					<%if(loginUser.getGrade()!=0){ %>
						eachLocation='<%= request.getContextPath() %>/detail.qu?postNo=' + postNo;
					<% } else if(loginUser.getGrade()==0){ %>
						eachLocation='<%= request.getContextPath() %>/Mdetail.qu?postNo=' + postNo;
					<% } %> 
				} else if(categoryNo == 2) {
					eachLocation='<%= request.getContextPath() %>/detail.wac?postNo=' + postNo;
				// 관리자
				} else if(categoryNo == 1) {
					eachLocation='<%= request.getContextPath() %>/detail.bc?pNo=' + postNo;
				} else if(categoryNo == 6) {
					eachLocation='<%=request.getContextPath()%>/faqDetail.faq?no=' + postNo;
				}
				var popLeft = Math.ceil(( window.screen.width - 1920 )/2);
				var popTop = Math.ceil(( window.screen.height - 1080 )/2);
				window.open(eachLocation, "eachBoardDetail", "width=1200, height=600, "+ ", left=" + popLeft + ", top="+ popTop);
			}
		});
	});
</script>
</html>