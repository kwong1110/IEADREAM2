<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이어드림 - CEO 소개</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<link rel="styleSheet" href="<%= request.getContextPath() %>/css/board.css">

<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<style>
    #CEO_pic{margin: 10px; width: 500px; border-radius: 20px;}
    .outer{
      width: 1000px; height: 100%; background: white;
      margin-left: auto; margin-right: auto; margin-top: 50px; margin-bottom: 50px;}
	.pageTitle{margin: 1em auto;}
	.tableArea th {/* 게시판제목라인 */
		padding:20px 0;
		color:rgb(230, 141, 150); font-size:1em;/* 제목글자크기 */ 
		letter-spacing:0.1em;}/* 제목띠어쓰기간격 */ 
	.tableArea td {line-height: 30px; text-align: left;}
</style>
</head>
<body>
	<div>
		<%@ include file="../../views/common/mainmenu.jsp" %>
	</div>
	
	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>CEO 소개</h1>
				</div>
				<div class="listArea" id="history"> 
					<table class="tableArea">
						<tr>
							<td>
							<div class="article"><img id="CEO_pic" src="../img/IMG_5526.jpg"></div>
							</td>
							<th style="width: 100px;">경력</th>
							<td style="width: 400px; vertical-align: top;">
									1993.04 어쩌구<br>
									1993.11 어쩌구저쩌구<br>
									1994.02 냠냠<br>
									1995.33 냠냠 쩝쩝<br>
									1993.04 어쩌구<br>
									1993.11 어쩌구저쩌구<br>
									1994.02 냠냠<br>
									1995.33 냠냠 쩝쩝<br>
									1993.04 어쩌구<br>
									1993.11 어쩌구저쩌구<br>
									1994.02 냠냠<br>
									1995.33 냠냠 쩝쩝<br>
							</td>
						</tr>
					</table>
					<table class="tableArea">
						<tr>
							<th style="width: 130px;">인사말</th>
							<td style="width: 800px; vertical-align: top;">
								(안랩 배낌)
								안녕하세요 CEO 박소현입니다. 약 30여년 간 국내외 결혼 전문 기업에서 영업과 마케팅 분야를 지휘해왔습니다.
								2011년 이어드림에 입사한 이후 사업을 총괄해 왔으며, 이어드림 입사 전에는 듀오 부사장, 가연 대표이사 등을 지냈습니다.
								2013년 12월부터 이어드림의 CEO를 맡았습니다.
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="../common/footer.jsp" %>
</html>