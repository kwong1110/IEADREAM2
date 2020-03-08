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
    #CEO_pic{margin: 8px; width: 300px; height: 300px; border-radius: 20px; background-size: contain;}
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
							<div class="article"><img id="CEO_pic" src="<%= request.getContextPath() %>/images/common/CEO.PNG"></div>
							</td>
							<th style="width: 100px;">프로필</th>
							<td style="width: 400px; vertical-align: top;">
									- 연새대학교 심리학과 졸업<br>
									- 사울대학교 연애학 박사<br>
									- 연애와삶의질학회 부회장<br>
									- 독신주의와혼족사회위원회<br>&nbsp;&nbsp; 민간위원 역임<br>
									- 사울대 연애과학 연구소 연구원<br>
									- 現 이어드림(주) CEO<br>
							</td>
						</tr>
					</table>
					<table class="tableArea">
						<tr>
							<th style="width: 130px;">인사말</th>
							<td style="width: 800px; vertical-align: top;">
								안녕하세요? 연애전문회사 이어드림의 대표이사 박소현입니다.<br><br>
								이어드림이 추구하는 본질적 가치는 '사랑'입니다.<br>
								서로 다른 남녀가 만나 사랑을 하고 연애를 하는 것은 인생에서 더할 나위 없이 아름답고 행복한 일입니다.
								이어드림은 그 소중한 인연을 찾아드리기 위해 최상의 시스템은 물론, 진실된 마음으로 고객님께 다가갑니다.
								이어드림을 믿고 함께 해주시는 회원님 한 분 한 분께 과학적이고 체계적인 시스템을 바탕으로 회원님과 가장
								잘 맞는 인연을 만나게 해드리는 데 최선의 노력을 다하겠습니다.<br><br>
								365일 따뜻한 봄, 이어드림에서 당신에게 가장 설레는 오늘을 선물해드리겠습니다.
								<br>
								감사합니다.
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