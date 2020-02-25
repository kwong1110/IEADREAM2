<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CEO 소개</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<style>
	a:link { color: black; text-decoration: none}
    a:visited {color: black;}
    a:hover{ color : silver;}
    
	*{box-sizing: border-box;}
	.container{min-width: 1000px;}
	.container .content{padding-left: 200px; padding-right: 200px; overflow: hidden;}
	.container .content>*{float: left; padding-bottom: 200px; margin-bottom: -200px;}
	.container .content main{width: 100%;}
	.container .content nav{width: 200px; margin-left: -100%; left:-200px; position: relative;}
	.container footer{clear: both;}
	
	.menu{background: white;}
	.menu> li{list-style: none; font-size: 30px; left: 150px; 
			  display: inline-block; padding: 10px; position: relative;}
	.menu a{line-height: 75px; color:rgb(51,51,51); display: block;}
	.menu .link{text-decoration: none;}
	
	.subCategory{color: rgb(51, 51, 51); text-decoration: none;}
	.quickmenu> li{list-style: none; font-size: 20px; left: 30px; padding: 5px; position: relative;}
	
    
	.container .content main .article{position: relative; float: left;}
    #CEO_pic{margin: 10px; width: 400px; border-radius: 20px;}
    
    #loginProfile{float: right;}
	#loginPicture{width:80px; height: 80px; border-radius: 100%;}
	#alert{position: relative; top:-60px; left: -20px;}
	#redDot{width:20px; height:20px; border-radius:100%;}
	#loginInfo{display:inline-block; position: relative; top:-20px;
				font-size: 20px; word-spacing: 5px;}
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
</html>