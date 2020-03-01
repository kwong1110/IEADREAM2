<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이어드림 - 회사 소개</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<style>
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
<%@ include file="../common/footer.jsp" %>
</html>