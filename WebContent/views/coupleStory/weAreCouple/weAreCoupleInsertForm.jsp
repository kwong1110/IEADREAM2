<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width: 800px; height: 500px; background: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left: auto; margin-right: auto; margin-top: 50px;
	}
	#listArea{text-align: center;}
	.tableArea{width:650px;	height:350px; margin-left:auto;	margin-right:auto;}
	th{border-bottom: 1px solid grey;}
	.pagingArea button{border-radius: 15px; background: #D5D5D5;}
	.searchArea{margin-right: 50px;}
	.searchArea button{background: #D1B2FF; border-radius: 5px; color: white; width: 80px; heigth: 25px; text-align: center;}
	button:hover{cursor: pointer;}
	#titleImgArea:hover, #contentImgArea1:hover{cursor:pointer;}
	#insertThumbTable{margin: auto;}
	
	
	
	#titleImg, #contentImg1{
		width:300px; height:200px; border:2px dashed darkgray;
		text-align:center; display:table-cell; vertical-align:middle;
	}
	#insertBtn{
		border-radius: 10px;
		background:  rgb(123, 164, 213);
		padding: 10px;
		color: white;
		font-size: 15px;
		text-align: center;
		border:none;
	}
	textarea, #title, #category{
		border-radius: 10px;
		font-size:15px;
		font-family:"ON I고딕";
		resize:none;
		outline:none;
	}
	textarea{margin-top:10px;}
	#insertBtn{
		border-radius: 10px;
		background:  rgb(123, 164, 213);
		padding: 10px;
		color: white;
		font-size: 15px;
		text-align: center;
		border:none;
	}
	#cancelBtn{
		border-radius: 10px;
		background:rgb(230, 141, 150);
		padding: 10px;
		color: white;
		font-size: 15px;
		text-align: center;
		border:none;
	}
	.btnArea {width:180px; margin-left:auto; margin-right:auto;}
	.review{
		margin : 40px;
		padding:5px;
	}
	#reviewTable span{color:red;}
	.wac{
		border-radius:10px;
		margin-top: 10px;
		height: 25px;
		outline:none;
	}
	.coupleImg {
    width: 40%;
    height: 50%;
    display: inline;
}
	td{
		margin-top: 10px;
	}
	.titleArea{
		margin-bottom: 10px;
	}
</style>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp" %>
	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>우리 커플됐어요</h1>
				</div>
				<br>
				<form action="<%= request.getContextPath() %>/insert.wac" method="post" encType="multipart/form-data"><!-- 파일올리는 거기 때문에 -->
					<div class="review">
						<div class="titleArea">
							<label>제목</label>
							<input type="text" size="45"  name="title" id="title" >
						</div>
				
					<table id="reviewTable" align=center>
						<tr>
							<td><span>*</span> 남자친구의 이름을 작성해주세요.</td>
							<td><span>*</span> 여자친구의 이름을 작성해주세요.</td>
						</tr>
						<tr>
							<td><input type="text" name="mName" class="wac"></td>
							<td><input type="text" name="fName" class="wac"></td>
						</tr>
							
						<tr>
							<td><span>*</span> 연애 기간</td>
							<td><span>*</span> 즐겨하는 데이트</td>
						</tr>
						
						<tr>
							<td><input type="number" name="dtPeriod" min="1" value="1" class="wac">&nbsp;일</td>
							<td><input type="text" name="fvDate" maxlength="12" class="wac" placeholder="12자이내로 입력하세요."></td>
						</tr>
						
						<tr>
							<td><span>*</span> 이어드림의 서비스 중 가장 만족했던 서비스를  작성해주세요.</td>
						</tr>
						<tr>
							<td colspan=2>
								<textarea cols= 60 rows= 4 name="content1" placeholder="작성해주세요" ></textarea>
							</td>
						</tr>
						<tr>
							<td>후기</td>
						</tr>
						<tr>
							<td colspan=2 width=100%>
								<textarea  cols= 60 rows= 8 name="content2"  placeholder="작성해주세요"></textarea>
							</td>
						</tr>
						<tr>
							<td>커플 사진</td>
						</tr>
						<tr>
							<td><img id="titleImg" width="150" height="200"></td>
							<td><img id="contentImg1" width="150" height="200"></td>
						</tr>
						
					</table>
					<!-- <div class="coupleImg">
						<label>커플 사진</label>
								<img id="titleImg" width="300" height="200">
								<img id="titleImg" width="300" height="200">
					</div> -->
				</div>

				<div id="fileArea">
					<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
					<input type="file" id="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)">
				</div>
				<script>
					// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
					$(function(){
						$("#fileArea").hide();
						
						$("#titleImg").click(function(){
							$("#thumbnailImg1").click();
						});
						$("#contentImg1").click(function(){
							$("#thumbnailImg2").click();
						});
					});
					
					// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
					function LoadImg(value, num){
						if(value.files && value.files[0]){
							var reader = new FileReader();
							
							reader.onload = function(e){								
								switch(num){
								case 1: 
									$("#titleImg").attr("src", e.target.result);
									break;
								case 2:
									$("#contentImg1").attr("src", e.target.result);
									break;
								}
							}
							
							reader.readAsDataURL(value.files[0]);
						}
					}
				</script>

			<br>
			<div class="btnArea">
				<button type="submit" onclick="insert();" id="insertBtn">작성완료</button>
				<input type="button" id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/list.wac'" value="취소">
			</div>
			
			</form>
			</div>
		</div>
	</div>
	
</body>
</html>