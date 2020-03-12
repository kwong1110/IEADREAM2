<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String data = (String)request.getAttribute("data");
	String searchlocation = (String)request.getAttribute("searchlocation");
	String searchInterest = (String)request.getAttribute("searchInterest");
	
	String[] array;
	array = data.split("\"");
	String[] title = new String[3];
	String[] link = new String[3];
	String[] description = new String[3];
	String[] bloggername = new String[3];
	String[] bloggerlink = new String[3];
	String[] postdate = new String[3];
	
	int k = 0;
	for (int i = 0; i < array.length; i++) {
	    if (array[i].equals("title"))
	    	title[k] = array[i + 2];
	    if (array[i].equals("link"))
	        link[k] = array[i + 2];
	    if (array[i].equals("description"))
	        description[k] = array[i + 2];
	    if (array[i].equals("bloggername"))
	    	bloggername[k] = array[i + 2];
	    if (array[i].equals("bloggerlink"))
	    	bloggerlink[k] = array[i + 2];
	    if (array[i].equals("postdate")) {
	    	postdate[k] = array[i + 2];
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
<style>
	.recom{
		font-size: 16px; 
		color: pink;
	}
</style>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp"%>
		<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h2>하트 히스토리 - 데이트 추천</h2>
				</div>
					<div class="contents">
						<div class="topBox">
							최대 3개의 검색 결과를 제공 합니다.<br>
							여러분의 공통 관심사는 <span class="recom"><%= searchInterest %></span>, 추천 지역은 <span class="recom"><%= searchlocation %></span>입니다.
						</div>
						<form method="get">
							<table class="mainBoard" id="boManageForm">
								<tbody>
									<tr>
										<th> 블로그 제목 </th>
										<th> 게시일자 </th>
										<th> 링크로 가기 </th>
									</tr>
									<tr>
										<td><%= title[0] %></td>
										<td><%= postdate[0] %></td>
										<td><input type="button" class="defaultBtn subBtn" value="클릭" onclick="link0();"></td>
									</tr>
									<tr>	
										<td><%= title[1] %></td>
										<td><%= postdate[1] %></td>
										<td><input type="button" class="defaultBtn subBtn" value="클릭" onclick="link1();"></td>
									</tr>
									<tr>
										<td><%= title[2] %></td>
										<td><%= postdate[2] %></td>
										<td><input type="button" class="defaultBtn subBtn" value="클릭" onclick="link2();"></td>
									</tr>	
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
<%@ include file="../../common/footer.jsp"%>
<script>
function link0(){
	var popLeft = Math.ceil(( window.screen.width - 1920 )/2);
	var popTop = Math.ceil(( window.screen.height - 1080 )/2);
	window.open('<%= link[0] %>', "goLink", "width=1200, height=600, "+ ", left=" + popLeft + ", top="+ popTop);
}
function link1(){
	var popLeft = Math.ceil(( window.screen.width - 1920 )/2);
	var popTop = Math.ceil(( window.screen.height - 1080 )/2);
	window.open('<%= link[1] %>', "goLink", "width=1200, height=600, "+ ", left=" + popLeft + ", top="+ popTop);
}
function link2(){
	var popLeft = Math.ceil(( window.screen.width - 1920 )/2);
	var popTop = Math.ceil(( window.screen.height - 1080 )/2);
	window.open('<%= link[2] %>', "goLink", "width=1200, height=600, "+ ", left=" + popLeft + ", top="+ popTop);
}
</script>
</html>