<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IEADREAM - CEO</title>
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
    #company_pic{margin: 10px; width: 400px; border-radius: 20px;}
    
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
					<h1>회사 소개</h1>
				</div>
				<div class="article" style="width: 100%; text-align: center;"><img id="company_pic" src="../img/IMG_5526.jpg"> 로고 넣기 </div>
				<div>
					저희 희사는 연애를 어쩌구 쌍방 따봉 어쩌구 념념 강아지 귀엽죠 9살이라는게 안믿겨지죠 내용은 넘어가는게 아니고
					자동으로 본문 크기에 따라 달라진답니다 멋지죠 <br>가운데정렬<br>이에요
				</div>
			</div>
		</div>
	</div>
</body>
</html>