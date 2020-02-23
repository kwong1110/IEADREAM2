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
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>이어드림_베스트커플_목록</title>
<style>
	.pageTitle{
		padding: 10px 0 10px 30px;
		margin: 60px 0 20px 0;
	}
	
	.option{
		padding: 3px 7px 6px 7px;
		background: #e75a82;
		border: none;
		color: white;
		font-weight: border;
		border-radius: 5px;
		cursor: pointer;
		text-shadow: 0 1px 1px rgba(0,0,0,.3);
		box-shadow: 0 1px 2px rgba(0,0,0,.2);
	}
	
	.optiondiv{
		display: inline-block;
	}
	
	.optionbox{
		margin-left: 61.3%;
		margin-bottom: .4%;
	}
	
	.contents{
		width: 70%;
		height: 470px;
		border: 8px solid white;
		background: rgba(255, 255, 255, 0.4);
		box-shadow: 3px 3px 3px 3px gray;
		margin-left: 23px;
		margin-bottom: 60px;
	}
	
	.contn{
		margin-top: 40px;
		margin-left: 2%; 
		margin-right: 2%;
		width: 29.33333333333333%;
		float: left;
		margin-bottom: 55px;
	}
	
	.img{
		width: 100%;
		height: 200px;
		background-size: cover;
		position: relative;
		margin-bottom: 20px;
		cursor: pointer;
	}
	
	#img1{
		background-image: url("../../../images/common/flower1.PNG");
	}
	#img2{
		background-image: url("../../../images/common/flower2.PNG");
	}
	#img3{
		background-image: url("../../../images/common/flower3.PNG");
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
	
	.sc-footer{
		width: 100%; 
	}
	
	.button{
		width: 50%;
		text-align:center;
		margin: 0 auto;
	}
	
	/* 관리자용 업로드 버튼 */
	/* .uploadbtn{
		width: 9%;
		height: 28px;
		margin-left: 89%;
		background: #e75a82;
		color: white;
		font-weight: border;
	} */
	
	.pagingArea button{border-radius: 15px; background: #D5D5D5;}
	.searchArea{margin-right: 50px;}
	.searchArea button{background: #D1B2FF; border-radius: 5px; color: white; width: 80px; heigth: 25px; text-align: center;}
	button:hover{cursor: pointer;}
	#numBtn{background: #B2CCFF;}
	#choosen{background: #FFD8D8;}
	#listArea{margin: auto;}
	
</style>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp" %>
	<section>
		<div class="outer">
			<div class="wrapper">
				<div class="main">
					<div class="pageTitle"><h1>이달의 베스트 커플</h1></div>
					
					<div class="optionbox">
						<div class="optiondiv">
							<select  class="option">
								<option>-----</option>
								<option>2019년</option>
								<option>2020년</option>
								<option>2021년</option>
								<option>2022년</option>
							</select>					
						</div>
						
						<div class="optiondiv">
							<select class="option">
								<option>-----</option>
								<option>1월</option>
								<option>2월</option>
								<option>3월</option>
								<option>4월</option>
								<option>5월</option>
								<option>6월</option>
								<option>7월</option>
								<option>8월</option>
								<option>9월</option>
								<option>10월</option>
								<option>11월</option>
								<option>12월</option>
							</select>
						</div>
					</div>
					
					<div class="contents">
					<% 
						for(int i = 0; i < bcList.size(); i++){
							Board bc = bcList.get(i);
					%>
						<div class="contn" id="contn1">
							<div class="img" id="img1">
								<% 
									for(int j = 0; j < pList.size(); j++){
										Photo p = pList.get(j);		
								%>
									<% if(bc.getPostNo() == p.getPhotoNo()){ %>
										<img src="<%= request.getContextPath() %>/photo_uploadFiles/<%= p.getChangeName() %>" style="width:inherit; height:inherit;">
									<% } %>
								<% } %>
							</div>
							<div class="text">
								<input type="hidden" value="<%= bc.getPostNo() %>">
								<p id="text1"><%= bc.getTitle() %></p>
								<p id="text2">박보검</p>
								<p id="text3"><%= bc.getCreateDate() %></p>
							</div>
						</div>
							
						<% } %>
						<div class="clear-both"></div>
						
						 <div class="sc-footer">
						 	<% if(!bcList.isEmpty()) { %> <!-- && !pList.isEmpty() -->
								<div class="button">
									<button onclick="location.href='<%= request.getContextPath() %>/list.bc?currentPage=1'">&lt;&lt;</button>
									
									<button onclick="location.href='<%= request.getContextPath() %>/list.bc?currentPage=<%= currentPage-1 %>'" id="beforeBtn">&lt;</button>
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
									
									<button onclick="location.href='<%= request.getContextPath() %>/list.bc?currentPage=<%= currentPage + 1%>'" id="afterBtn">&gt;</button>
									<script>
										if(<%= currentPage %> >= <%= maxPage %>){
											var after = $("#afterBtn");
											after.attr('disabled', 'true');
										}
									</script>
								
									<button onclick="location.href='<%= request.getContextPath() %>/list.bc?currentPage=<%= maxPage %>'">&gt;&gt;</button>
								</div>
							<% } %>
						</div>
						
						<!-- 관리자용 업로드 버튼 -->
					<!-- <div>
							<a href="#"><button class="uploadbtn">UPLOAD</button></a>
						</div> -->
					
					</div>
				</div>	
			</div>
		</div>
	</section>
</body>
</html>