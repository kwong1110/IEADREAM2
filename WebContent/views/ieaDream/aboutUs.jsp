<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이어드림 - 회사 소개</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<link rel="styleSheet" href="<%= request.getContextPath() %>/css/board.css">
<style>
	.outer{
      width: 1000px; height: 100%; background: white;
      margin-left: auto; margin-right: auto; margin-top: 50px; margin-bottom: 50px;}
	.pageTitle{margin: 1em auto;}
	.tableArea th {/* 게시판제목라인 */
		padding:20px 0;
		color:rgb(230, 141, 150); font-size:1em;/* 제목글자크기 */ 
		letter-spacing:0.1em;}/* 제목띠어쓰기간격 */ 
	.tableArea td {line-height: 30px; text-align: left;}
	
    #CEO_pic{margin: 10px; width: 400px; border-radius: 20px;}
    
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
					<h1>회사 소개</h1>
				</div>
				<div class="listArea">
					<table class="tableArea">
							<tr>
								<td>
								<div class="article"><img id="CEO_pic" src="../img/IMG_5526.jpg"></div>
								</td>
								<th style="width: 80px;">인사말</th>
								<td style="width: 300px; vertical-align: top;">
									저희 희사는 연애를 어쩌구 쌍방 따봉 어쩌구 념념 강아지 귀엽죠 9살이라는게 안믿겨지죠 내용은 넘어가는게 아니고
									자동으로 본문 크기에 따라 달라진답니다 멋지죠
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