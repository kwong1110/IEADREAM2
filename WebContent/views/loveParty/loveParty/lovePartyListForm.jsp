<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>이어드림_러브파티_목록</title>
<style>
	.title{
		padding: 10px 0 10px 30px;
		margin: 60px 0 40px 0;
	}
	
	.contents{
		width: 70%;
		height: 450px;
		border: 8px solid lightblue;
		margin-left: 23px;
		margin-bottom: 60px;
	}
	
	.contn{
		margin-top:70px;
		margin-left: 2%; 
		margin-right: 2%;
		width: 29.33333333333333%;
		float: left;
		margin-bottom: 80px;
	}
	
	.img{
		width: 100%;
		height: 200px;
		background-size: cover;
		position: relative;
		margin-bottom: 20px;
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
	
	.peoNum{
		text-align: center;
		position: absolute;
		bottom: 6%;
		left: 38%;
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
	
	.date{
		width: 70%;
		margin: 0 auto;
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
</style>
</head>
<body>
	<section>
		<h1 class="title">러브파티</h1>
		
		<div class="contents">
			<div class="contn" id="contn1">
				<div class="img" id="img1">
					<a href="#" style="width:inherit; height:inherit;"></a>
						<div class="peoNum">
							<p>참여 인원</p>
							<p>남 12/15</p>
							<p>여 14/15</p>
						</div>
				</div>
				<div class="date" id="date1">
					<p>2020-01-18</p>
				</div>
			</div>
			<div class="contn" id="contn2">
				<div class="img" id="img2">
					<a href="#" style="width:inherit; height:inherit;"></a>
						<div class="peoNum">
							<p>참여 인원</p>
							<p>남 12/15</p>
							<p>여 15/15</p>
						</div>
				</div>
				<div class="date" id="date2">
					<p>2020-01-18</p>
				</div>
			</div>
			<div class="contn" id="contn3">
				<div class="img" id="img3">
					<a href="#" style="width:inherit; height:inherit;"></a>
						<div class="peoNum">
							<p>참여 인원</p>
							<p>남 12/15</p>
							<p>여 14/15</p>
						</div>
				</div>
				<div class="date" id="date3">
					<p>2020-01-18</p>
				</div>
			</div>
			
			
			<div class="clear-both"></div>
			
			<div class="sc-footer">
				<div class="button">
					<button>&lt;</button>
					<button>1</button>
					<button>2</button>
					<button>3</button>
					<button>&gt;</button>
				</div>
			</div>
		</div>
	</section>
</body>
</html>