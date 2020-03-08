<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.model.vo.*, common.*" %>    
    
<%
	ArrayList<Board> bcList = (ArrayList<Board>)request.getAttribute("bcList");
	ArrayList<Photo> pList = (ArrayList<Photo>)request.getAttribute("pList");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	String year = (String)request.getAttribute("year");
	String month = (String)request.getAttribute("month");
	String search = (String)request.getAttribute("search");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>이어드림 - 이 달의 베스트커플</title>
<style>
	
	.option{
		padding: 3px 7px 6px 7px;
		border: none;
		font-weight: border;
		border-radius: 5px;
		cursor: pointer;
		text-shadow: 0 1px 1px rgba(0,0,0,.3);
		box-shadow: 0 1px 2px rgba(0,0,0,.2);
	}
	
	.go{
		display: inline-block;
	}
	
	.optiondiv{
		display: inline-block;
	}
	
	.optionbox{
		margin-left: 770px;
		margin-bottom: .8%;
	}
	
	.main{
		display: inline-block;
		float:left;
		width: 960px;
		height: 670px;
	}
	
	.contents{
		/* width: 900px;
		height: 470px; */
		border: 8px solid pink;
		box-shadow: 3px 3px 3px 3px gray;
		/* margin: 0 4% 0 4%; */
		margin-bottom: 15px; 
	}
	
	.contns{
		width: 100%;
		height: 400px;
	}
	
	.contn{
		margin-top: 40px;
		margin-left: 2%; 
		margin-right: 2%;
		width: 29.33333333333333%;
		float: left;
		margin-bottom: 55px;
	}
	
	.hit{
		margin: 0 0 2% 80%;
		font-size: 12px;
		cursor: default;
	}
	
	.img{
		width: 100%;
		height: 200px;
		background-size: cover;
		position: relative;
		margin-bottom: 20px;
		cursor: pointer;
		border: 1px solid darkgray;
	}
		
	.peoNum > p {
		background: #000; color: #fff;
		margin-bottom: 3px;
		padding: 3px 8px;
		font-size: 10px;
		border-radius: 5px;
	}
	
	.peoNum > p:hover{
		background: yellow;
		color:#000;
		transition: 0.5s;
		cursor: default;
	}
	
	.text{
		width: 100%;
		text-align: center;
	}
	
	#text1{
		font-size: 15px;
		font-weight: bold;
		margin: 5%;
	}
	
	#text2{
		font-size: 14px;
		margin: 4%;
	}
	
	#text3{
		font-size: 13px;
	}
	
	.date > p{
		text-align: center;
	}
	
	.clear-both{
		height: 10px;
	}
	
	button:hover{cursor: pointer;}
	
</style>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp" %>
	<section>
		<div class="outer">
			<div class="wrapper">
				<div class="main">
					<div class="pageTitle"><h1>이달의 베스트 커플</h1></div>
					
					<form action="<%= request.getContextPath()%>/search.bc" method="post" id="searchForm">
						<div class="optionbox">
							<div class="optiondiv">
								<select class="option" id="year" name="year">
									<option value="2020">2020년</option>
									<option value="2021">2021년</option>
									<option value="2022">2022년</option>
								</select>					
							</div>
							
							<div class="optiondiv">
								<select class="option" id="month" name="month">
									<option value="00">-----</option>
									<option value="01">1월</option>
									<option value="02">2월</option>
									<option value="03">3월</option>
									<option value="04">4월</option>
									<option value="05">5월</option>
									<option value="06">6월</option>
									<option value="07">7월</option>
									<option value="08">8월</option>
									<option value="09">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
								</select>
							</div>
							<div class="go">
								<input type="hidden" name="search" value="on">
								<input type="submit" class="defaultBtn searchBtn" id="search" value="Go">
							</div>
						</div>
					</form>
					
					<div class="contents">
						<div class="contns">
							<% 
								for(int i = 0; i < bcList.size(); i++){
									Board bc = bcList.get(i);
							%>
								<div class="contn">
									<p class="hit">HIT : <%= bc.getHit() %></p>
									<div class="img">
										<input type="hidden" value="<%= bc.getPostNo() %>">
										<% 
											for(int j = 0; j < pList.size(); j++){
												Photo p = pList.get(j);		
										%>
											<% if(bc.getPostNo() == p.getPostNo()){ %>
												<img src="<%= request.getContextPath() %>/photo_uploadFiles/<%= p.getChangeName() %>" style="width:inherit; height:inherit;">
											<% } %>
										<% } %>
									</div>
									<div class="text">
										<p id="text1"><%= bc.getTitle() %></p>
										<p id="text2"><%= bc.getUserId() %></p>
										<p id="text3"><%= bc.getCreateDate() %></p>
									</div>
								</div>
									
								<% } %>
							</div>
							
						 <div class="clear-both"></div>
						
						 <div class="pagingArea">
						 	<% if(search != null){ %><!-- 검색을 한 상태의 페이징 -->
						 	<!-- 검색결과 페이징 -->
						 	<% if(!bcList.isEmpty() && maxPage != 1) { %> <!-- 전체 페이지가 1개면 페이징 기능 없애기 -->
								<div class="button">
									<button onclick="location.href='<%= request.getContextPath() %>/search.bc?currentPage=1&year=<%= year %>&month=<%= month %>'">&lt;&lt;</button>
									<button onclick="location.href='<%= request.getContextPath() %>/search.bc?currentPage=<%= currentPage-1 %>&year=<%= year %>&month=<%= month %>'" id="beforeBtn">PREV</button>
								
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
											<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/search.bc?currentPage=<%= p %>&year=<%= year %>&month=<%= month %>'"><%= p %></button>
										<% } %>
									<% } %>
								
								<!-- 다음 페이지로 가는 버튼 -->
								<button onclick="location.href='<%= request.getContextPath() %>/search.bc?currentPage=<%= currentPage + 1 %>&year=<%= year %>&month=<%= month %>'" id="afterBtn">NEXT</button>
								<script>
									if(<%= currentPage %> >= <%= maxPage %>){
										var after= $("#afterBtn");
										after.attr('disabled','true');
									}
								</script>
								
								<!-- 맨 끝으로 가는 버튼 -->
								<button onclick="location.href='<%= request.getContextPath() %>/search.bc?currentPage=<%= maxPage %>&year=<%= year %>&month=<%= month %>'">&gt;&gt;</button>			
								
							<% } %>
								
							<% } else { %>
								<% if(!bcList.isEmpty() && maxPage != 1) { %>
									<button onclick="location.href='<%= request.getContextPath() %>/list.bc?currentPage=1'">&lt;&lt;</button>
									<button onclick="location.href='<%= request.getContextPath() %>/list.bc?currentPage=<%= currentPage-1 %>'" id="beforeBtn">PREV</button>
									
									<script>
										if(<%= currentPage %> <= 1){
											var before = $('#beforeBtn');
											before.attr('disabled', 'true');
										}
									</script>
									
									<% for(int p = startPage; p <= endPage; p++) { %>
										<% if(p == currentPage) { %>
											<button id="choosen" disabled><%= p %></button>
										<% } else{ %>
											<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/list.bc?currentPage=<%= p %>'"><%= p %></button>
										<% } %>	
									<% } %>
									
									<button onclick="location.href='<%= request.getContextPath() %>/list.bc?currentPage=<%= currentPage + 1%>'" id="afterBtn">NEXT</button>
									<script>
										if(<%= currentPage %> >= <%= maxPage %>){
											var after = $("#afterBtn");
											after.attr('disabled', 'true');
										}
									</script>
								
									<button onclick="location.href='<%= request.getContextPath() %>/list.bc?currentPage=<%= maxPage %>'">&gt;&gt;</button>
								</div>
								<% } %>
							<% } %>
						</div>
					</div>
					
					<div class="btnBox">
						<% if(loginUser != null && loginUser.getGrade() == 0) { %>
							<button class="defaultBtn" onclick='location.href="views/coupleStory/bestCouple/bestCoupleInsertForm.jsp"'>작성하기</button>
						<% } %>
					</div>
				</div>	
			</div>
		</div>
		
		<script>
			$(function(){
				$('.contn').click(function(){
					var pNo = $(this).children().children().eq(0).val();
					location.href="<%= request.getContextPath() %>/detail.bc?pNo=" + pNo;
				});
			});
		</script>
		
	</section>
</body>
<%@ include file="../../common/footer.jsp" %>
</html>