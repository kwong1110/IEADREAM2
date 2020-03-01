<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String title = request.getParameter("title");
	String mName = request.getParameter("mName");
	String fName = request.getParameter("fName");
	String dtPeriod = request.getParameter("dtPeriod");
	String fvDate = request.getParameter("fvDate");
	String content = request.getParameter("content");
	
	String titlePt = request.getParameter("titlePt");
	String detailPt = request.getParameter("detailPt") == null ? "" : "src=" + request.getContextPath() + "/photo_uploadFiles/" + request.getParameter("detailPt");
	//String originName0 = request.getParameter("originName0");
	//String originName1 = request.getParameter("originName1");
	
	ArrayList<String> photoNos = new ArrayList<String>();
	for(int i = 0; i < 2; i++){
		photoNos.add(request.getParameter("detailPhotoId" + i) == null ? "" : request.getParameter("detailPhotoId" + i));
	}
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>이어드림 - 이 달의 베스트커플</title>
<style>

	.outer{
      width: 1000px; height: 1000px; background: white;
      margin-left: auto; margin-right: auto; margin-top: 50px; margin-bottom: 50px;
   }
	
	.pageTitle{
		padding: 60px 0 10px 40px;
		margin: 10px 0 50px 0;
	}
	
	.contents{
		width: 90%;
		height: 750px;
		border: 8px solid pink;
		box-shadow: 3px 3px 3px 3px gray;
		background: white;
		margin: 0 auto; 
		margin-bottom: 30px;
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
	
	.file1{
		margin-bottom: 1%;
	}
	
	button{
		padding: 6px 9px 6px 9px;
		background: pink;
		color: white;
		border-radius: 10px;
		font-weight: bold;
		font-size: 15px;
	    cursor: pointer;
		margin-bottom: 30px;
		text-align: center;
	    display: inline-block;
		text-shadow: 0 1px 1px rgba(0,0,0,.3);
		box-shadow: 0 1px 2px rgba(0,0,0,.2);
	}
	
	.btnBox{
		margin-left: 45%;
		display: inline-block;
	}
	
	#titlePtArea {
		width:370px; 
		height:200px;
		border: 2px solid darkgray;
		text-align:center; 
		/* display:table-cell;
		vertical-align:middle; */
		display: inline-block;
		margin: 0 1.5% 0 3%;
	}
	
	#titlePt{
		width: 370px;
		height: 200px;
	}
	
	#titlePtArea:hover, #contentPtArea:hover {cursor:pointer;}
	
	#contentPtArea {
		width:370px; 
		height:200px; 
		border: 2px solid darkgray; 
		text-align:center; 
/* 		display:table-cell; 
		vertical-align:middle; */
		display: inline-block;
		margin: 0 3% 0 1.5%;
	}
	
	#contentPt{
		width: 370px;
		height: 200px;
	}
	
</style>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp" %>
	<section>
		<div class="outer">
			<div class="wrapper">
				<div class="main">
					<h1 class="pageTitle">이달의 베스트 커플</h1>
					<form action="<%= request.getContextPath() %>/update.bc" method="post" encType="multipart/form-data">
						<div class="contents">
							<div class="subj">
								<div id="subjtitle">제목</div>
								<input type="hidden" name="postNo" value="<%= request.getParameter("pNo") %>">
								<input type="text" name="title" id="subjbox" value="<%= title %>">
							</div>
							
							<div class="contn1">
								<div class="contn1box">
									<div class="label">
										<label>남자 이름 : </label>
									</div>
									<input type="text" name="mName" class="bx" value="<%= mName %>"><br>
									
									<div class="label">
										<label>여자 이름 : </label>
									</div>
									<input type="text" name="fName" class="bx" value="<%= fName %>"><br>
									
									<div class="label">
										<label>연애 기간 : </label>
									</div>
									<input type="number" name="dtPeriod" min="1" value="<%= dtPeriod %>" class="bx">&nbsp;일<br>
									
									<div class="label">
										<label>즐겨하는 데이트 : </label>
									</div>
									<input type="text" name="fvDate" maxlength="12" value="<%= fvDate %>">
								</div>
							</div>
							
							<textarea class="contn2" name="content"><%= content %></textarea>
							
							<div class="file">
								<div id="titlePtArea">
									<img id="titlePt" src="<%= request.getContextPath() %>/photo_uploadFiles/<%= titlePt %>">
									<input type="hidden" id="detailPhotoId0" name="detailPhotoId0" value="<%= photoNos.get(0) %>"> 
									<input type="hidden" id="cTitle" name="cTitle">
								</div>	
								
								<div id="contentPtArea">
									<img id="contentPt" <%= detailPt %>> 
									<input type="hidden" id="detailPhotoId1" name="detailPhotoId1" value="<%= photoNos.get(1) %>"> 
									<input type="hidden" id="cContent" name="cContent">
								</div>
							</div>
							
							
							<%-- <div class="fileUpload" id="fileUpload">
									<input type="button" value="파일 선택">
									<input type="text" id="text" value="<%= originName0 %>">
							</div> --%>
						
							<div id="fileArea">
								<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
								<input type="file" id="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)">
								
							</div>
						
							<script>
							
								/* $(function(){
									$("#fileArea").hide();
								
									$("#fileUpload").click(function(){
										$("#thumbnailImg1").click();
									});
								});
								
								function fileUpload(thumbnailImg1) {
									var str = thumbnailImg1.value;
									$('#text').attr("value", thumbnailImg1.value.substring(str.lastIndexOf("\\")+1));
								} */
							
							
								$(function(){
									$("#fileArea").hide();
								
									$("#titlePtArea").click(function(){
										$("#thumbnailImg1").click();
									});
									$("#contentPtArea").click(function(){
										$("#thumbnailImg2").click();
									});
								});
								
								
								function LoadImg(value, num){
									if(value.files && value.files[0]){
										var reader = new FileReader();
										
										reader.onload = function(e){								
											switch(num){
											case 1: 
												$("#titlePt").attr("src", e.target.result);
												break;
											case 2:
												$("#contentPt").attr("src", e.target.result);
												break;
											}
										}
									
										reader.readAsDataURL(value.files[0]);
									}
								}
								
							</script>
						</div>
						
						<div class="btnBox">
							<button type="button" id="updateBtn">완료</button>
							<button type="reset" onclick="location.href='<%= request.getContextPath() %>/list.bc'">취소</button>
						</div>	
					</form>
				</div>	
			</div>
		</div>
		
		<script>
		$('#updateBtn').click(function(){
			var t = $("#titlePt").attr('src');
			var c = $("#contentPt").attr('src');
			
			if(typeof(t) != 'undefined'){
				$("#cTitle").val($("#titlePt").attr('src').substring(0, 4));
			}
			if(typeof(c) != 'undefined'){
				$("#cContent").val($("#contentPt").attr('src').substring(0, 4));
			}
			
			$('.contents').parent().submit();
		});
		</script>
	</section>
</body>
<%@ include file="../../common/footer.jsp" %>
</html>