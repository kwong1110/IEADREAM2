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
	#titleImgArea:hover, #contentImgArea1:hover, #contentImgArea2:hover, #contentImgArea3:hover {cursor:pointer;}
	#insertThumbTable{margin: auto;}
	#contentImgArea1, #contentImgArea2, #contentImgArea3 {
		width:150px; height:100px; border:2px dashed darkgray;
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
	}
	.btnArea {width:180px; margin-left:auto; margin-right:auto;}
</style>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp" %>
	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h2 align="center">사진 게시판 작성</h2>
				</div>
			<form action="<%= request.getContextPath() %>/insert.wac" method="post" encType="multipart/form-data"><!-- 파일올리는 거기 때문에 -->
			<div class="tableArea">
		
				<table id="insertThumbTable">
					<tr>
						<th width="130px">제목</th>
						<td colspan="3"><input type="text" size="45" name="title" id="title"></td>
					</tr>
					<tr>
						<th>대표 커플 사진</th>
						<td colspan="3">
							<div id="titleImgArea" class="contentImage">
								<img id="titleImg" width="350" height="200">
							</div>
						</td>
					</tr>
						<tr>
						<th width="100px">커플 후기</th>
						<td colspan="3"><textarea name="content" rows="5" cols="50" style="resize:none;"></textarea>
					</tr>
					<tr>
						<th>추가 첨부 사진</th>
						<td>
							<div id="contentImgArea1" class="contentImage">
								<img id="contentImg1" width="120" height="100"> 
							</div>
						</td>
						<td>
							<div id="contentImgArea2" class="contentImage">
								<img id="contentImg2" width="120" height="100"> 
							</div>
						</td>
						<td>
							<div id="contentImgArea3" class="contentImage">
								<img id="contentImg3" width="120" height="100"> 
							</div>
						</td>
					</tr>
				
				</table> 
				
				
				<!-- 파일 업로드 하는 부분 -->
				<div id="fileArea">
					<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
					<input type="file" id="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)">
					<input type="file" id="thumbnailImg3" multiple="multiple" name="thumbnailImg3" onchange="LoadImg(this,3)">
					<input type="file" id="thumbnailImg4" multiple="multiple" name="thumbnailImg4" onchange="LoadImg(this,4)">
				</div>
				<script>
					// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
					$(function(){
						$("#fileArea").hide();
						
						$("#titleImgArea").click(function(){
							$("#thumbnailImg1").click();
						});
						$("#contentImgArea1").click(function(){
							$("#thumbnailImg2").click();
						});
						$("#contentImgArea2").click(function(){
							$("#thumbnailImg3").click();
						});
						$("#contentImgArea3").click(function(){
							$("#thumbnailImg4").click();
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
								case 3: 
									$("#contentImg2").attr("src", e.target.result);
									break;
								case 4:
									$("#contentImg3").attr("src", e.target.result);
									break;
								}
							}
							
							reader.readAsDataURL(value.files[0]);
						}
					}
				</script>
				
			</div>
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