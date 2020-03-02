<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	#listArea{text-align: center;}
	button:hover, input[type=button]{cursor: pointer;}
	
	#titleImgArea:hover, #contentImgArea1:hover{cursor:pointer;}
	#insertThumbTable{margin: auto;}
	
	#titleImg, #contentImg1{
		width:300px; height:200px; border:2px dashed darkgray;
		text-align:center; display:table-cell; vertical-align:middle;cursor:pointer;
	}
	textarea, #title, #category{
		border-radius: 10px;
		font-size:15px;
		font-family:"ON I고딕";
		resize:none;
		outline:none;
	}
	textarea{margin-top:10px;}
	.btnArea {width:180px; margin-left:auto; margin-right:auto;}
	.review{
		margin : 40px;
		padding:5px;
	}
	#reviewTable span{color:red;}
	/* .wac{
		border-radius:10px;
		margin-top: 10px;
		height: 25px;
		outline:none;
	} */
	.coupleImg {
    width: 40%;
    height: 50%;
    display: inline;
}
	td{
		margin-top: 10px;
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
    vertical-align: middle;
    background:#f9f9f9;  
   }
        
     table>tr>first-child {
	  background:#f9f9f9;  
    }
     #title,.wac{
   	border-radius: 5px;
   	width:80%;
   	padding: 5px;
   	border: 1px solid lightgray;
   	margin: 1%;
   }
   
    .Insertwac{
   	border-radius: 5px;
   	width:100%;
   	height: 100px;
	    border: 1px solid lightgray;
	    resize: none;
   }
   
</style>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp" %>
	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<form action="<%= request.getContextPath() %>/insert.wac" method="post" encType="multipart/form-data"><!-- 파일올리는 거기 때문에 -->
				<div class="pageTitle">
					<h2>우리 커플됐어요</h2>
				</div>
					<div class="tableArea">
						<div class="review">
							<div class="titleArea">
								<label>제목</label>
								<input type="text" size="45"  name="title" id="title" required>
							</div>
					
							<table id="reviewTable" align=center>
								<tr>
									<td width="60px"><span>*</span> 남자친구의 이름을 작성해주세요.</td>
									<td><input type="text" name="mName" class="wac" id="mName" required></td>
								</tr>
								<tr>
								<td>
									<span>*</span> 여자친구의 이름을 작성해주세요.</td>
									<td><input type="text" name="fName" class="wac" id="fName"required></td>
								</tr>
									
								<tr>
									<td><span>*</span> 연애 기간</td>
									<td><input type="number" name="dtPeriod" id="dtPeriod" min="1" value="1" class="wac" style="text-align: right; width: 50px;" required>&nbsp;일</td>
								</tr>
								
								<tr>
									<td><span>*</span> 즐겨하는 데이트</td>
										
									<td><input type="text" name="fvDate" id="fvDate" maxlength="12" class="wac" placeholder="12자이내로 입력하세요." required></td>
								</tr>
								
								<tr>
									<td colspan=2><span>*</span> 이어드림의 서비스 중 가장 만족했던 서비스를  작성해주세요.</td>
								</tr>
								<tr>
									<td colspan=2>
										<textarea cols= 60 rows= 4 name="content1"  class="Insertwac" placeholder="작성해주세요" required></textarea>
									</td>
								</tr>
								<tr>
									<td>후기</td>
								</tr>
								<tr>
									<td colspan=2 width=100%>
										<textarea  cols= 60 rows= 8 name="content2" class="Insertwac" placeholder="작성해주세요" required></textarea>
									</td>
								</tr>
								<tr>
									<td>커플 사진</td>
								</tr>
								<tr>
									<td><img id="titleImg" width="150" height="200" ></td>
									<td><img id="contentImg1" width="150" height="200" ></td>
								</tr>
							</table>
						</div>
	
						<div id="fileArea">
							<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)" required >
							<input type="file" id="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)" required >
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
						<div class="btnArea">
							<button type="submit" class="defaultBtn" id="insertBtn">작성완료</button>
							<input type="button" class="defaultBtn" id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/list.wac'" value="취소">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
<script>
$(function(){
	$('#insertBtn').click(function(){
		if($('#thumbnailImg1').val()== ''){
			alert('첫번째 사진을 첨부 해주세요');
		} else if($('#thumbnailImg2').val()== ''){
			alert('두번째 사진을 첨부 해주세요');
		} else{
			
		}
	});
	
});
</script>
</body>
<%@ include file="../../common/footer.jsp"%> 
</html>









<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<style>
	#listArea{text-align: center;}
	.tableArea{width:650px;	height:350px; margin-left:auto;	margin-right:auto;}
	th{border-bottom: 1px solid grey;}
	button:hover{cursor: pointer;}
	#titleImgArea:hover, #contentImgArea1:hover{cursor:pointer;}
	#insertThumbTable{margin: auto;}
	
	
	.outer {
		width:1000px; height:800px; background:white;
		margin-left:auto; margin-right:auto; margin-top:50px;
	}
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
	.contents{
		background-color: rgb(252, 240, 241);
	}
</style>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp" %>
	<div class="outer">
		<div class="wrapper">
			<!-- <nav></nav> -->
			<div class="main">
				<div class="pageTitle">
					<h1>우리 커플됐어요</h1>
				</div>
				<div class="contents">
					<form action="<%= request.getContextPath() %>/insert.wac" method="post" encType="multipart/form-data"><!-- 파일올리는 거기 때문에 -->
						<div class="review">
							<div class="titleArea">
								<label>제목</label>
								<input type="text" size="45"  name="title" id="title" required>
							</div>
					
							<table id="reviewTable" align=center>
								<tr>
									<td><span>*</span> 남자친구의 이름을 작성해주세요.</td>
									<td><span>*</span> 여자친구의 이름을 작성해주세요.</td>
								</tr>
								<tr>
									<td><input type="text" name="mName" class="wac" id="mName" required></td>
									<td><input type="text" name="fName" class="wac" id="fName"required></td>
								</tr>
									
								<tr>
									<td><span>*</span> 연애 기간</td>
									<td><span>*</span> 즐겨하는 데이트</td>
								</tr>
								
								<tr>
									<td><input type="number" name="dtPeriod" id="dtPeriod" min="1" value="1" class="wac" required>&nbsp;일</td>
									<td><input type="text" name="fvDate" id="fvDate" maxlength="12" class="wac" placeholder="12자이내로 입력하세요." required></td>
								</tr>
								
								<tr>
									<td><span>*</span> 이어드림의 서비스 중 가장 만족했던 서비스를  작성해주세요.</td>
								</tr>
								<tr>
									<td colspan=2>
										<textarea cols= 60 rows= 4 name="content1" placeholder="작성해주세요" required></textarea>
									</td>
								</tr>
								<tr>
									<td>후기</td>
								</tr>
								<tr>
									<td colspan=2 width=100%>
										<textarea  cols= 60 rows= 8 name="content2"  placeholder="작성해주세요" required></textarea>
									</td>
								</tr>
								<tr>
									<td>커플 사진</td>
								</tr>
								<tr>
									<td><img id="titleImg" width="150" height="200" ></td>
									<td><img id="contentImg1" width="150" height="200" ></td>
								</tr>
							</table>
						</div>
	
						<div id="fileArea">
							<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)" required>
							<input type="file" id="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)" required >
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
						<div class="btnArea">
							<button type="submit"  id="insertBtn">작성완료</button>
							<input type="button" id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/list.wac'" value="취소">
						</div>
					
					</form>
				</div>
			</div>
		</div>
	</div>
<script>
$(function(){
	$('#insertBtn').click(function(){
		if($('#thumbnailImg1').val()== ''){
			alert('첫번째 사진을 첨부 해주세요');
		} else if($('#thumbnailImg2').val()== ''){
			alert('두번째 사진을 첨부 해주세요');
		} else{
			
		}
	});
	
});
</script>
</body>
</html> --%>