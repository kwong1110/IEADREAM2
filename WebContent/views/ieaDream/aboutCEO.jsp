<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이어드림 - CEO 소개</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<style>
    #CEO_pic{margin: 10px; width: 400px; border-radius: 20px;}
</style>
</head>
<body>
	<div>
		<%@ include file="../../views/common/mainmenu.jsp" %>
	</div>
	
	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>CEO 소개</h1>
				</div>
				<div class="article"><img id="CEO_pic" src="../img/IMG_5526.jpg"></div>
				<div class="article" id="history"> 
					<p style="padding: 5px;">
						<h3>경력</h3>
						1993.04 어쩌구<br>
						1993.11 어쩌구저쩌구<br>
						1994.02 냠냠<br>
						1995.33 냠냠 쩝쩝<br>
						1993.04 어쩌구<br>
						1993.11 어쩌구저쩌구<br>
						1994.02 냠냠<br>
						1995.33 냠냠 쩝쩝<br>
						1993.04 어쩌구<br>
						1993.11 어쩌구저쩌구<br>
						1994.02 냠냠<br>
						1995.33 냠냠 쩝쩝<br>
					</p>
				</div>
				<div class="article" id="hi" style="clear: both; padding: 5px;"> 
					<h3> CEO의 인사말 </h3>
					안녕하세요 여기에 인사말을 써주세요
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="../common/footer.jsp" %>
</html>