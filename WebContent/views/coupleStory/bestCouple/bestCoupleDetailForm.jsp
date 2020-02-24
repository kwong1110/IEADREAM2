<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*"%>
    
<%
	Board b = (Board)request.getAttribute("b");
	BestCouple bc = (BestCouple)request.getAttribute("bc");
	ArrayList<Photo> pList = (ArrayList<Photo>)request.getAttribute("pList");
	Photo titlePt = pList.get(0);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>이어드림_베스트커플_상세조회</title>
<style>
	.title{
		padding: 10px 0 10px 30px;
		margin: 60px 0 40px 0;
	}
	
	.main{
		width: 70%;
		height: 600px;
		border: 8px solid pink;
		margin-left: 23px;
		margin-bottom: 60px;
	}
	
	.parag1{
		height: 330px;
		padding: 0 0 1px 0;
	}
	
	.img1{
		width: 40%;
		height: 280px;
		float: left;
		border: 3px solid #e75a82;
		box-sizing: border-box;
		margin: 3%;
		display: inline-block;
		border-radius:250px;
		overflow:hidden;
		box-shadow: 1px 1px 25px #ccc;
	}
	
	.img1:hover .parag1-img{ transition:0.2s ease-out; transform: rotate(360deg) translateX(0px) translateY(0px); }
	.img1 > img{
		width: 100%;
		height: 280px;
	}
	
	.contn1{
		width: 47%;
		height: 280px;
		margin: 3%;
		display: inline-block;
		float:right;
		text-align: center;
	}
	
	.text1{
		color: white;
		background: pink;
		height: 50px;
		margin: 65px 1px 20px;
		line-height: 200%;
		box-shadow: 1px 1px 10px red;
		border-radius: 20px;
		text-align: center;
	}
	
	.nameinput{
		background: transparent;
		border: none;
		outline: none;
		font-size: 25px;
		color: white;
		width: 80px;
		font-weight: bold;
	}
	
	#nameinput1{
		text-align: right;
		margin-right: 2%;
	}
	
	#nameinput2{
		text-align: left;
	}
	
	.heart{
		font-size: 25px;
		display: inline-block;
		margin-right: 1%;
	}
	
	.text2{
		height: 30px;
		font-size: 17px;
		color: #e75a82;
		line-height: 170%;
		margin: 40px 1px 0;
	}
	.perinput{
		background: transparent;
		border: none;
		outline: none;
		font-size: 21px;
		color: white;
		width: 50px;
		text-align: right;
		margin: 0 1% 0 4%;
	}
	
	.text3{
		height: 30px;
		font-size: 17px;
		color: white;
		line-height: 170%;
		margin: 0px 1px 0 45px;
		text-align: center;
	}
	
	.dateinput{
		background: transparent;
		border: none;
		outline: none;
		font-size: 17px;
		color: #e75a82;
		text-align: center;
		margin: 0 1% 0 1%;
		color: #e75a82;
	}

	.parag2{
		height: 268px;
		boxing-size: border-box;
	}
	
	.contn2{
		border: 1px solid #e75a82;
		width: 55%;
		height: 240px;
		margin: 1% 2% 1%;
		border-radius: 8px;
		display: inline-block;
	}
	
	.text4box{
		width: 90%;
		height: 200px;
		text-align: center;
		line-height: 23px;
		margin: 3%;
	}
	.text4{
		width: 105%;
		height: 210px;
		text-align: left;
		resize: none;
		background: transparent;
		border: none;
		font-family: 만화진흥원체;
		font-size: 15px;
		outline: none;
	}
	
	.img2{
		width: 36%;
		height: 240px;
		float: right;
		border: 3px solid #e75a82;
		box-sizing: border-box;
		margin: 2% 3% 1% 0;
		display: inline-block;
		border-radius:250px;
		overflow:hidden;
		box-shadow: 1px 1px 25px #ccc;
	}
	
	.img2:hover .parag2-img{ transition:0.2s ease-out; transform: rotate(360deg) translateX(0px) translateY(0px); }
	.img2 > img{
		width: 100%;
		height: 280px;
	}
</style>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp" %>
	<section>
		<h1 class="title">이달의 베스트 커플</h1>
		<form action="<%= request.getContextPath() %>/views/coupleStory/bestCouple/bestCoupleUpdateForm.jsp">
			<div class="main">
				<div class="parag1">
					<input type="hidden" name="title" value="<%= b.getTitle() %>">
					<div class="img1">
						<img class="parag1-img" src="<%= request.getContextPath() %>/photo_uploadFiles/<%= titlePt.getChangeName() %>">
					</div>
					<div class="contn1">
						<div class="text1">
							<input class="nameinput" id="nameinput1" name="mName" value="<%= bc.getmName() %>"><div class="heart">&#9829;</div>
							<input class="nameinput" id="nameinput2" name="fName" value="<%= bc.getfName() %>">
						</div>
						<div class="text2">연애기간 :<input class="perinput" name="dtPeriod" value="<%= bc.getDtPeriod() %>">일</div>
						<div class="text3">즐겨하는 데이트 :<input class="dateinput" name="fvDate" value="<%= bc.getFvDate() %>"></div>
					</div>
				</div>
				
				<div class="parag2">
					<div class="contn2">
						<div class="text4box">
							<textarea class="text4" name="content" readonly><%= b.getContent() %></textarea>
						</div>
					</div>
					<div class="img2">
						<img class="parag2-img detailPhoto" id="detailPhoto" src="<%= request.getContextPath()%>/photo_uploadFiles/<%= pList.get(1).getChangeName() %>">
					</div>
				</div>
			</div>
			
			<div class="btnBox">
				<% if(loginUser != null && loginUser.getUserNo() == b.getUserNo()) { %>
					<button type="submit" id="updateBtn">수정</button>
					<button type="submit" id="deleteBtn" onclick="deletePt();">삭제</button>
				<% } %>
			</div>
			
			
			
			
			
		</form>
	</section>
</body>
</html>