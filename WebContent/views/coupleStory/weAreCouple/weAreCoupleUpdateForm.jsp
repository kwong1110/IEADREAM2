 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*" %>
<%
	String title = request.getParameter("title");
	String titleImg = request.getParameter("titleImage");
	
	BestCouple bc = (BestCouple)request.getAttribute("bc");
	
	 String mName = request.getParameter("mName");
	 String fName = request.getParameter("fName");
	 
	 String dtPeriod =request.getParameter("dtPeriod");
	String fvDate = request.getParameter("fvDate"); 
	String content = request.getParameter("content");
	ArrayList<String> images = new ArrayList<String>();
	for(int i = 1; i < 4; i++){
		images.add(request.getParameter("detailImg" + i) == null ? "" : "src=" + request.getContextPath() + "/photo_uploadFiles/" + request.getParameter("detailImg" + i));
	}
	
	ArrayList<String> photoNos = new ArrayList<String>();
	for(int i = 0; i < 4; i++){
		photoNos.add(request.getParameter("detailImgId" + i) == null ? "" : request.getParameter("detailImgId" + i));
	}
	
	String content1 =request.getParameter("content1");
	String content2 = request.getParameter("content2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이어드림 - 우리커플됐어요</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<style>
	.outer {
		width:1000px; height:800px; background:white;
		margin-left:auto; margin-right:auto; margin-top:50px;
	}

	.btnArea {width:180px; margin-left:auto; margin-right:auto;}
	#titleImgArea {width:350px; height:200px; border:2px dashed darkgray; text-align:center; display:table-cell; vertical-align:middle;}
	#titleImgArea:hover, #contentImgArea1:hover, #contentImgArea2:hover, #contentImgArea3:hover {cursor:pointer;}
	#contentImgArea1, #contentImgArea2, #contentImgArea3 {
		width:150px; height:100px; border:2px dashed darkgray;
		text-align:center; display:table-cell; vertical-align:middle;
	}
	#updateBtn:hover, #cancelBtn:hover{cursor: pointer;}
	#insertThumbTable{margin: auto;}
	#titleImg,#contentImg1{width:400px; height:300px;}
	 table>thead>tr>th {
	  background:#f9f9f9;  
    }
     table>tbody>tr>th {
     	background:#f9f9f9;  
     }
	
	textarea{
		resize: none;
	}
	.must{
		color:red;
	}
	#updateTitle, .updateWac{
   	border-radius: 5px;
   	width:80%;
   	padding: 5px;
   	border:1px solid lightgray;
   	height: 18px;
   	vertical-align: middle;
   	margin-bottom: 10px;
   }
   .updateRwac{
   margin: 10px;
   	border-radius: 5px;
   	width:80%;
   height: 100px;
	    border: 1px solid lightgray
   }
     .tableArea{
   	border: 5px solid  rgb(230, 141, 150);
   	    margin: 30px;
    padding: 15px;
   }
   #reviewTable{
   margin-top: 10px;
   }
   table >tr> th,td {
    padding: 5px;
        vertical-align: middle;}
</style>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp" %>
	<div class="outer">
		<div class="wrapper">
			<div class="main">
			<div class="pageTitle">
				<h2>우리 커플 됐어요</h2>
			</div>
			<form action="<%= request.getContextPath() %>/update.wac" method="post" encType="multipart/form-data"><!-- 파일올리는 거기 때문에 -->
				<div class="tableArea">
					<div class="review">
						<div class="titleArea">
							<label style="background:#f9f9f9; ">제목</label><input type="hidden" name="postNo" value="<%= request.getParameter("postNo") %>">
								<input type="text" size="45" name="title" id="updateTitle" value="<%=title %>">
						</div>
				 
					<table id="reviewTable" align=center>
						<tr>
							<th width="260px"><span class="must">*</span> 남자친구의 이름을 작성해주세요.</th>
							<td>
								<textarea name ="mName" class="updateWac" ><%= mName %></textarea>
							</td>
						</tr>
						<tr>
							<th><span class="must">*</span> 여자친구의 이름을 작성해주세요.</th>
							<td><textarea name ="fName" class="updateWac" ><%= fName %></textarea></td>
						</tr>
							
						<tr>
							<th><span class="must">*</span> 연애 기간</th>
							<td><input type="number" name="dtPeriod" min="1"  style="text-align: right; width: 60px" class="updateWac" value="<%= request.getParameter("dtPeriod") %>">&nbsp;일</td>
						</tr>
						
						<tr>
							<th><span class="must">*</span> 즐겨하는 데이트</th>
							<td><input type="text" name="fvDate" maxlength="12" class="updateWac" placeholder="12자이내로 입력하세요."  value="<%= request.getParameter("fvDate") %>"></td>
						</tr>
						
						<tr>
							<td colspan="4"><span class="must">*</span> 이어드림의 서비스 중 가장 만족했던 서비스를  작성해주세요.</td>
						</tr>
						<tr>
							<td colspan=6>
								<textarea cols= 60 rows= 4 name="content1" placeholder="작성해주세요" class="updateRwac"> <%=content1 %></textarea>
							</td>
						</tr>
						<tr>
							<td>후기</td>
						</tr>
						<tr>
							<td colspan=6 >
								<textarea  cols= 60 rows= 4 name="content2"  placeholder="작성해주세요" class="updateRwac" ><%=content2 %></textarea>
								<input type="hidden" name="content" value="content1+content2">
							</td>
						</tr>
						<tr>
							<td>커플 사진</td>
						</tr>
						<tr>
								<td colspan="2">
								<img id="titleImg" src="<%= request.getContextPath() %>/photo_uploadFiles/<%= titleImg %>">
									<input type="hidden" id="detailImgId0" name="detailImgId0" value="<%= photoNos.get(0) %>"> 
									<input type="hidden" id="cTitle" name="cTitle">
							</td>
							<td>
								<img id="contentImg1" <%= images.get(0) %>> 
									<input type="hidden" id="detailImgId1" name="detailImgId1" value="<%= photoNos.get(1) %>"> 
									<input type="hidden" id="cContent1" name="cContent1">
						</td>
						</tr>
						
					</table>
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
				</div>
				<br>
				<div class="btnArea">
					<button class="defaultBtn" id="updateBtn">수정완료</button>
					<input type="button" id="cancelBtn" class="defaultBtn" onclick="location.href='<%= request.getContextPath() %>/list.wac'" value="취소">
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
			
			$('.tableArea').parent().submit();
		});
	</script>
</body>
<%@ include file="../../common/footer.jsp"%> 
</html>



<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*" %>
<%
	String title = request.getParameter("title");
	String titleImg = request.getParameter("titleImage");
	
	BestCouple bc = (BestCouple)request.getAttribute("bc");
	
	 String mName = request.getParameter("mName");
	 String fName = request.getParameter("fName");
	 
	 String dtPeriod =request.getParameter("dtPeriod");
	String fvDate = request.getParameter("fvDate"); 
	String content = request.getParameter("content");
	ArrayList<String> images = new ArrayList<String>();
	for(int i = 1; i < 4; i++){
		images.add(request.getParameter("detailImg" + i) == null ? "" : "src=" + request.getContextPath() + "/photo_uploadFiles/" + request.getParameter("detailImg" + i));
	}
	
	ArrayList<String> photoNos = new ArrayList<String>();
	for(int i = 0; i < 4; i++){
		photoNos.add(request.getParameter("detailImgId" + i) == null ? "" : request.getParameter("detailImgId" + i));
	}
	
	String content1 =request.getParameter("content1");
	String content2 = request.getParameter("content2");
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
	#titleImg,#contentImg1{width:500px; height:300px;}
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
					<div class="review">
						<div class="titleArea">
							<label>제목</label><input type="hidden" name="postNo" value="<%= request.getParameter("postNo") %>">
								<input type="text" size="45" name="title" value="<%=title %>">
						</div>
				
					<table id="reviewTable" align=center>
						<tr>
							<td><span>*</span> 남자친구의 이름을 작성해주세요.</td>
							<td><span>*</span> 여자친구의 이름을 작성해주세요.</td>
						</tr>
						<tr>
							<td><input type="text" name="mName" class="wac"  value="<%= mName %>"></td>
							<td><input type="text" name="fName" class="wac"  value="<%= fName %>"></td>
						</tr>
							
						<tr>
							<td><span>*</span> 연애 기간</td>
							<td><span>*</span> 즐겨하는 데이트</td>
						</tr>
						
						<tr>
							<td><input type="number" name="dtPeriod" min="1"  class="wac" value="<%= request.getParameter("dtPeriod") %>">&nbsp;일</td>
							<td><input type="text" name="fvDate" maxlength="12" class="wac" placeholder="12자이내로 입력하세요."  value="<%= request.getParameter("fvDate") %>"></td>
						</tr>
						
						<tr>
							<td><span>*</span> 이어드림의 서비스 중 가장 만족했던 서비스를  작성해주세요.</td>
						</tr>
						<tr>
							<td colspan=2>
								<textarea cols= 60 rows= 4 name="content1" placeholder="작성해주세요"> <%=content1 %></textarea>
							</td>
						</tr>
						<tr>
							<td>후기</td>
						</tr>
						<tr>
							<td colspan=2 width=100%>
								<textarea  cols= 60 rows= 8 name="content2"  placeholder="작성해주세요"  ><%=content2 %></textarea>
								<input type="hidden" name="content" value="content1+content2">
							</td>
						</tr>
						<tr>
							<td>커플 사진</td>
						</tr>
						<tr>
								<td colspan="4">
								<img id="titleImg" src="<%= request.getContextPath() %>/photo_uploadFiles/<%= titleImg %>">
									<input type="hidden" id="detailImgId0" name="detailImgId0" value="<%= photoNos.get(0) %>"> 
									<input type="hidden" id="cTitle" name="cTitle">
							</td>
							<td>
								<img id="contentImg1" <%= images.get(0) %>> 
									<input type="hidden" id="detailImgId1" name="detailImgId1" value="<%= photoNos.get(1) %>"> 
									<input type="hidden" id="cContent1" name="cContent1">
						</td>
						</tr>
						
					</table>
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
</html> --%>