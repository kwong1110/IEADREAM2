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
	
    #CEO_pic{margin: 10px; width: 300px; border-radius: 15px;}
    
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
								<div class="article"><img id="CEO_pic" src="<%= request.getContextPath() %>/images/common/logo.png"></div>
								</td>
								<th style="width: 80px;">인사말</th>
								<td style="width: 310px; vertical-align: top;">
									이어드림은 동종업계 부동의 1위,<br> 현재까지 98,000여건의 커플을 성사시킨<br> 우리나라 최고의 연애전문회사입니다.<br><br>
									타업체에서는 찾아볼 수 없는 트렌디함과<br> 이어드림만의 체계적이고 과학적인 시스템으로<br> 지금 당장 회원님의 짝을 만나보세요.
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