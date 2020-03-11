<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String data = (String)request.getAttribute("data");
	
	String[] array;
	array = data.split("\"");
	String[] title = new String[3];
	String[] link = new String[3];
	String[] category = new String[3];
	String[] description = new String[3];
	String[] telephone = new String[3];
	String[] address = new String[3];
	String[] mapx = new String[3];
	String[] mapy = new String[3];
	
	int k = 0;
	for (int i = 0; i < array.length; i++) {
	    if (array[i].equals("title"))
	    	title[k] = array[i + 2];
	    if (array[i].equals("link"))
	        link[k] = array[i + 2];
	    if (array[i].equals("description"))
	        description[k] = array[i + 2];
	    if (array[i].equals("bloggername"))
	        telephone[k] = array[i + 2];
	    if (array[i].equals("bloggerlink"))
	        address[k] = array[i + 2];
	    if (array[i].equals("postdate")) {
	        mapx[k] = array[i + 2];
	        k++;
	    }
	}
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
														<textarea><%= title[0] %><%= title[1] %><%= title[2] %></textarea>
														<div><a href="<%= link[0] %>">하이</a></div>
														<div><%= link[1] %></div>
														<div><%= link[2] %></div>
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