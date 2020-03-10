<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	StringBuffer searchDate = (StringBuffer)request.getAttribute("searchDate");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이어드림 - 하트 히스토리(데이트 추천)</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board.css">
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp"%>
		<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h2>하트 히스토리 - 데이트 추천</h2>
				</div>
					<div class="information">
						이미지 클릭 시, 네이버 검색 결과로 이동 합니다.<br>
						최대 3개의 검색 결과 까지 추천 제공 합니다.
					</div>
					<div class="contents">
						<form method="get">
							<div class="tableArea">
								<table class="mainBoard" id="boManageForm">
									<tbody>
										<tr>
											<td><img src="" alt="블로그 메인 사진"/></td>
											<td>
												<ul>
													<li>
														<textarea><%= searchDate %></textarea>
													</li>
												</ul>
											</td>
										</tr>				
									</tbody>
								</table>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
<%@ include file="../../common/footer.jsp"%>
</html>