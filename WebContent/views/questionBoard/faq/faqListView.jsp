<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.model.vo.*, java.util.ArrayList" %>

<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	
		ArrayList<Board> cate1 = new ArrayList<Board>();
		ArrayList<Board> cate2 = new ArrayList<Board>();
		ArrayList<Board> cate3 = new ArrayList<Board>();
		ArrayList<Board> cate4 = new ArrayList<Board>();
	if(list.isEmpty()) {
		System.out.println("비어있음");
	} else {
		for (Board board : list) {
			switch (board.getCategory()) {
			case "결제":
				cate1.add(board);
				break;
			case "서비스":
				cate2.add(board);
				break;
			case "회원/등급":
				cate3.add(board);
				break;
			case "기타":
				cate4.add(board);
				break;
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<style>
	.tableArea{width:700px;	height:100%; margin:auto; box-sizing: border-box;}
	.category{cursor: pointer; font-size:20px; text-align: center; padding: 10px;}
	.faq{text-align: center; cursor: pointer; display: none; font-size: 15px; padding: 2px;}
	.con{height: 200px; display: none; text-align: left;
		 border-top: 1px solid black; border-bottom: 1px solid black; margin: 0 0 10px;}
</style>
</head>
<body>
	
	<%@ include file="../../common/mainmenu.jsp" %>
	
	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>FAQ</h1>
				</div>
				<br>
				<div class="tableArea">
					<% if(list.isEmpty()) { %>
							조회된 FAQ가 없습니다.
					<% } else { %>		
						<div class="category" id="cate1"><label>결제</label>
							<% for(Board board : cate1) { %>
							<div class="faq" id="faq1"><%= board.getTitle() %>
								<div class="con"><%= board.getContent() %></div>
							</div>
							
							<% } %>
						</div>
						<div class="category" id="cate2"><label>서비스</label>
							<% for(Board board : cate2) { %>
							<div class="faq"><%= board.getTitle() %>
								<div class="con"><%= board.getContent() %></div>
							</div>
							<% } %>
						</div>
						<div class="category" id="cate3"><label>회원/등급</label>
							<% for(Board board : cate3) { %>
							<div class="faq"><%= board.getTitle() %>
								<div class="con"><%= board.getContent() %></div>
							</div>
							<% } %>
						</div>
						<div class="category" id="cate4"><label>기타</label>
							<% for(Board board : cate4) { %>
							<div class="faq"><%= board.getTitle() %>
								<div class="con"><%= board.getContent() %></div>
							</div>
							<% } %>
						</div>
					<% } %>
				</div>
			</div>
		</div>
	</div>

	<script>
		$('.category').click(function() {
			$(this).children().slideDown();
		});
		
		$('.faq').slideDown(function() {
			$(this).children().slideUp();
		});
		
		$('.faq').click(function() {
			$(this).children().slideToggle();			
		});
	</script>
</body>
</html>