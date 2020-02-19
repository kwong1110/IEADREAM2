<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>이어드림_베스트커플_글작성</title>
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
		margin-bottom: 20px;
	}
	
	.subj{
		height: 70px;
	}
	
	#subjtitle{
		margin: 3%;
		display: inline-block;
	}
	
	#subjbox{
		width: 60%;
		height: 20px;
		background: #f9f2f5;
	}
	
	.contn1{
		width: 95%;
		height: 200px;
		border: 2px solid #f7cee1;
		margin: 0 2% 3%;
	}
	
	.contn1box{
		margin: 1% 0;
	}
	
	.contn2{
		width: 95%;
		height: 200px;
		background: #f9f2f5;
		margin: 0 2%;
		resize: none;
	}
	
	.label{
		display: inline-block;
		margin: 1.5% 3%;
	}
	
	.bx{
		width: 65px;
	}
	
	.file{
		margin: 2%;
	}
	
	#file1{
		margin-bottom: 1%;
	}
	
	.submit{
		width: 5%;
		height: 30px;
		background: pink;
		color: white;
		font-weight: bold;
		border-radius: 10px;
		margin-left: 35%;
		margin-bottom: 30px;
	}
</style>
</head>
<body>
	<section>
		<h1 class="title">이달의 베스트 커플</h1>
		<form>
			<div class="main">
				<div class="subj">
					<div id="subjtitle">제목</div>
					<input type="text" id="subjbox">
				</div>
				
				<div class="contn1">
					<div class="contn1box">
						<div class="label">
							<label>남자 이름 : </label>
						</div>
						<input type="text" class="bx"><br>
						
						<div class="label">
							<label>여자 이름 : </label>
						</div>
						<input type="text" class="bx"><br>
						
						<div class="label">
							<label>연애 기간 : </label>
						</div>
						<input type="number" min="1" value="1" class="bx">&nbsp;일<br>
						
						<div class="label">
							<label>즐겨하는 데이트 : </label>
						</div>
						<input type="text">
					</div>
				</div>
				
				<textarea class="contn2">내용을 자유롭게 입력해주세요.
				</textarea>
				
				<div class="file">
					<input type="file" id="file1"><br>
					<input type="file">
				</div>
			</div>
		</form>	
		
		<button type="submit" class="submit">등록</button>
	</section>
</body>
</html>