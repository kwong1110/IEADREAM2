<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이어드림</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/reset.css" />
<style>
	.bigBox{
		text-align: center;
		margin: 20px 150px 20px 150px;
	}
	.indexBox:nth-of-type(1){
		background: salmon;
	}
	.indexBox:nth-of-type(2){
		background: lightyellow;
	}
	.indexBox:nth-of-type(3){
		background: skyblue;
	}
	.indexBox:nth-of-type(4){
		background: powderblue;
	}
	.indexBox:nth-of-type(5){
		background: powderblue;
	}
	.indexBox:nth-of-type(6){
		background: powderblue;
	}
	
	/* 초기 height: 250px */
	.indexBox{
		display: inline-block;
		width: 350px;
		height: 500px;
		margin: 10px;
	}
	
	.firstBox{
		display: inline-block;
		position: relative;
		width: 912px;
		height: 300px;
		margin-bottom: 20px;
		background: pink;
	}
	
	.imageBar{
		position: fixed;
		top: 120px;
		display:inline-block;
		width: 100%;
		height: 400px;
		background: lightyellow;
		opacity: 0.6;
		z-index: -1;
	}
</style>
</head>
<body>
	<!-- 메인 메뉴로 연결  -->
	<div> 
		<%@ include file="views/common/mainmenu.jsp" %>
	</div>
	<div class="imageBar">
	
	</div>
	<div class="bigBox">
		<div>
			<div class="firstBox">
				1번박스
			</div>
		</div>
		<div>
			<div class="indexBox">
				2번박스
			</div>
			<div class="indexBox">
				3번박스
			</div>
			<div class="indexBox">
				4번박스
			</div>
			<div class="indexBox">
				5번박스 (띠가 고정되나 보려고 만든 박스들)
			</div>
			<div class="indexBox">
				6번박스 (띠가 고정되나 보려고 만든 박스들)
			</div>
			<div class="indexBox">
				7번박스 (띠가 고정되나 보려고 만든 박스들)
			</div>
		</div>
	</div>
</body>
</html>