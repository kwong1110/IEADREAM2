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
		background: white;
		margin-left: 23px;
		margin-bottom: 20px;
		font-family: "만화진흥원체";
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
	
	button{
		padding: 6px 9px 6px 9px;
		background: pink;
		color: white;
		border-radius: 10px;
		font-weight: bold;
		font-size: 15px;
		font-family: "만화진흥원체";
	    cursor: pointer;
		margin-bottom: 30px;
		text-align: center;
	    display: inline-block;
		text-shadow: 0 1px 1px rgba(0,0,0,.3);
		box-shadow: 0 1px 2px rgba(0,0,0,.2);
	}
	
	.btnBox{
		margin-left: 33%;
	}
	
</style>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp" %>
	<section>
		<div class="outer">
			<div class="wrapper">
				<h1 class="title">이달의 베스트 커플</h1>
				<form action="<%= request.getContextPath() %>/insert.bc" method="post" encType="multipart/form-data">
					<div class="main">
						<div class="subj">
							<div id="subjtitle">제목</div>
							<input type="text" name="title" id="subjbox">
						</div>
						
						<div class="contn1">
							<div class="contn1box">
								<div class="label">
									<label>남자 이름 : </label>
								</div>
								<input type="text" name="mName" class="bx"><br>
								
								<div class="label">
									<label>여자 이름 : </label>
								</div>
								<input type="text" name="fName" class="bx"><br>
								
								<div class="label">
									<label>연애 기간 : </label>
								</div>
								<input type="number" name="dtPeriod" min="1" value="1" class="bx">&nbsp;일<br>
								
								<div class="label">
									<label>즐겨하는 데이트 : </label>
								</div>
								<input type="text" name="fvDate">
							</div>
						</div>
						
						<textarea class="contn2" name="content">내용을 자유롭게 입력해주세요.
						</textarea>
						
						<div class="file">
							<input type="file" name="photo1" multiple="multiple" id="file1"><br>
							<input type="file" name="photo2" multiple="multiple">
						</div>
					</div>
					
					<div class="btnBox">
						<button type="submit" class="submit">등록</button>
						<button type="reset" onclick="location.href='<%= request.getContextPath() %>/list.bc'">취소</button>
					</div>	
				</form>
			</div>
		</div>
	</section>
</body>
</html>