<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		font-size: 25px;
		color: white;
		font-weight: bold;
		background: pink;
		height: 50px;
		margin: 65px 1px 20px;
		line-height: 200%;
		box-shadow: 1px 1px 10px red;
		border-radius: 20px;
	}
	
	.text2{
		height: 30px;
		font-size: 17px;
		color: #e75a82;
		line-height: 170%;
		margin: 40px 1px 0;
	}
	.p2{display: inline-block; color: pink;}
	
	.text3{
		height: 30px;
		font-size: 17px;
		color: pink;
		line-height: 170%;
		margin: 0px 1px 0;
	}
	.p3{display: inline-block; color: #e75a82;}
	
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
		margin: 4% auto;
		line-height: 23px;
	}
	.text4{
		text-align: left;
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
	<section>
		<h1 class="title">이달의 베스트 커플</h1>
		
		<div class="main">
			<div class="parag1">
				<div class="img1"><img class="parag1-img" src="../../../images/common/couple1.jpg"></div>
				<div class="contn1">
					<div class="text1"> 윤 한 빈 &#9829; 박 소 현 </div>
					<div class="text2">연애기간 : &nbsp;<p class="p2">12 일</p></div>
					<div class="text3">즐겨하는 데이트 : &nbsp;<p class="p3">영화보기</p></div>
				</div>
			</div>
			
			<div class="parag2">
				<div class="contn2">
					<div class="text4box">
						<p class="text4">안녕하세요.<br>
						저희는 연애한지 12일 된 풋풋한 새내기 커플입니다!<br>
						.<br>.<br>.<br>
						이어드림 덕분에 드디어 운명의 상대를 만난 것 같아요ㅠㅠ<br>
						솔로분들!!<br>
						다들 이어드림하세요~~</p>
					</div>
				</div>
				<div class="img2"><img class="parag2-img" src="../../../images/common/couple2.jpg"></div>
			</div>
		</div>
		
	</section>
</body>
</html>