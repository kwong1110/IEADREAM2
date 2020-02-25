<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" %>
<%
	String title = request.getParameter("title");
	String titleImg = request.getParameter("titleImage");
	
	ArrayList<String> images = new ArrayList<String>();
	for(int i = 1; i < 4; i++){
		images.add(request.getParameter("detailImg" + i) == null ? "" : "src=" + request.getContextPath() + "/photo_uploadFiles/" + request.getParameter("detailImg" + i));
	}
	
	ArrayList<String> photoNos = new ArrayList<String>();
	for(int i = 0; i < 4; i++){
		photoNos.add(request.getParameter("detailImgId" + i) == null ? "" : request.getParameter("detailImgId" + i));
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer {
		width:1000px; height:650px; background: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left:auto; margin-right:auto; margin-top:50px;
	}
	.insertArea {width:500px; height:450px; margin-left:auto; margin-right:auto;}
	.btnArea {width:180px; margin-left:auto; margin-right:auto;}
	#titleImgArea {width:350px; height:200px; border:2px dashed darkgray; text-align:center; display:table-cell; vertical-align:middle;}
	#titleImgArea:hover, #contentImgArea1:hover, #contentImgArea2:hover, #contentImgArea3:hover {cursor:pointer;}
	#contentImgArea1, #contentImgArea2, #contentImgArea3 {
		width:150px; height:100px; border:2px dashed darkgray;
		text-align:center; display:table-cell; vertical-align:middle;
	}
	#updateBtn, #cancelBtn{background: #D1B2FF; width: 80px; height: 25px; color: white; border-radius: 15px; text-align: center; display: inline-block;}
	#cancelBtn{background: #B2CCFF}
	#updateBtn:hover, #cancelBtn:hover{cursor: pointer;}
	#insertThumbTable{margin: auto;}
</style>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp" %>
	<div class="outer">
		<div class="wrapper">
			<div class="main">
			<div class="pageTitle">
				<h1>우리 커플 됐어요</h1>
			</div>
			<form action="<%= request.getContextPath() %>/update.wac" method="post" encType="multipart/form-data"><!-- 파일올리는 거기 때문에 -->
				<div class="insertArea">
					<table id="insertThumbTable">
						<tr>
							<th width="100px">제목</th>
							<td colspan="3">
								<input type="hidden" name="postNo" value="<%= request.getParameter("postNo") %>">
								<input type="text" size="45" name="title" value="<%=title %>">
							</td>
						</tr>
						<tr>
							<th>대표 이미지</th>
							<td colspan="3">
								<div id="titleImgArea">
									<img id="titleImg" width="350" height="200" src="<%= request.getContextPath() %>/photo_uploadFiles/<%= titleImg %>">
									<input type="hidden" id="detailImgId0" name="detailImgId0" value="<%= photoNos.get(0) %>"> 
									<input type="hidden" id="cTitle" name="cTitle">
								</div>
							</td>
						</tr>
						<tr>
							<th>내용 사진</th>
							<% for(int i = 1; i < 4; i++){ %>
							<td>
								<div id="contentImgArea<%=i%>">
									<img id="contentImg<%=i%>" width="120" height="100" <%= images.get(i-1) %>> 
									<input type="hidden" id="detailImgId<%=i%>" name="detailImgId<%=i%>" value="<%= photoNos.get(i) %>"> 
									<input type="hidden" id="cContent<%= i %>" name="cContent<%= i %>">
								</div>
							</td>
							<% } %>
						</tr>
						<tr>
							<th width="100px">사진 메모</th>
							<td colspan="3"><textarea name="content" rows="5" cols="50" style="resize:none;"><%= request.getParameter("memo").equals("null") ? "" : request.getParameter("memo") %></textarea>
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
					<button type="button" id="updateBtn">수정완료</button>
					<div id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/list.wac'">취소하기</div>
				</div>
			</form>
			</div>
		</div>
	</div>
	<script>
		$('#updateBtn').click(function(){
			var t = $("#titleImg").attr('src');
			var c1 = $("#contentImg1").attr('src');
			var c2 = $("#contentImg2").attr('src');
			var c3 = $("#contentImg3").attr('src');
			
			if(typeof(t) != 'undefined'){
				$("#cTitle").val($("#titleImg").attr('src').substring(0, 4));
			}
			if(typeof(c1) != 'undefined'){
				$("#cContent1").val($("#contentImg1").attr('src').substring(0, 4));
			}
			if(typeof(c2) != 'undefined'){
				$("#cContent2").val($("#contentImg2").attr('src').substring(0, 4));
			}
			if(typeof(c3) != 'undefined'){
				$("#cContent3").val($("#contentImg3").attr('src').substring(0, 4));
			}
			
			$('.insertArea').parent().submit();
		});
	</script>
</body>
</html>