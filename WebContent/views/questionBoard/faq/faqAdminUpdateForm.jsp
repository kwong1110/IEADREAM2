<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*"%>
<%
	request.setCharacterEncoding("utf-8");
	Board board = (Board)request.getAttribute("board");
	
	
	String category = board.getCategory();
	String[] selected = new String[4];

		if(category.equals("결제")) {
			selected[0] = "selected";
			selected[1] = "";
			selected[2] = "";
			selected[3] = "";
		} else if(category.equals("서비스")) {
			selected[0] = "";
			selected[1] = "selected";
			selected[2] = "";
			selected[3] = "";
		} else if(category.equals("회원/등급")) {
			selected[0] = "";
			selected[1] = "";
			selected[2] = "selected";
			selected[3] = "";
		} else {
			selected[0] = "";
			selected[1] = "";
			selected[2] = "";
			selected[3] = "selected";
		 } 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이어드림 - FAQ 수정</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<link rel="styleSheet" href="<%= request.getContextPath() %>/css/board.css">
<style>
	.outer{
      width: 1000px; height: 100%; background: white;
      margin-left: auto; margin-right: auto; margin-top: 50px; margin-bottom: 50px;
   }
	.main{width: 80%; height: 100%;}
	.pageTitle{margin: 1em auto;}
	/* .tableArea{margin: auto; padding: auto;} */
	.listArea{width: 800px;}
	.tableArea {table-layout:fixed;}
	.tableArea tr { width: -webkit-fill-available;}
	.tableArea td {/* 게시판제목라인 */
		padding:12px 0;
		border-top:1px solid rgb(136, 136, 136); /* 상단라인색 */
		border-bottom:1px solid rgb(224, 224, 224); /* 하단라인색 */
		background:#f9f9f9;  /* 제목배경색 */ 
		color:rgb(51, 51, 51); font-size:1em;/* 제목글자크기 */ 
		letter-spacing:0.1em;
		line-height: 10px;}/* 제목띠어쓰기간격 */ 
		
	#th_title {width:10%; text-align:rigth;}
	#th_title_input {width:50%;text-align:left;}
	#th_cate {width:20%;text-align: center;}
	#th_cate_select{width: 20%;}
	
	.select {
			width: 80px;
			padding: .8em .5em;
			border: 1px solid rgb(136, 136, 136);
			border-radius: 0;
			background: url('<%= request.getContextPath() %>/images/arrow.jpg') no-repeat 95% 50%;
			background-color: white;
			-webkit-appearance: none;
			}
	#title {
		padding: .8em .5em;
		border: 1px solid rgb(136, 136, 136);
	}
	#con {
		font-size: 15px;
		width: 100%
	}
	
	
	*:focus { outline:none; }
</style>
</head>
<body>
	
	<%@ include file="../../common/mainmenu.jsp" %>
	
	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>FAQ 수정</h1>
				</div>
				<div class="listArea">
					<form action="<%= request.getContextPath() %>/faqUpdate.faq" method="post">
						<table class="tableArea">
							<tr>
								<td id="th_title">제목</td>
								<td id="th_title_input">
									<input type="hidden" name = postNo value="<%= board.getPostNo() %>">
									<input type="text" size="80%" class="title" name="title" id="title" value="<%= board.getTitle() %>">
								</td>
								<td id="th_cate">카테고리</td>
								<td id="th_cate_input">
									<div class="cateCss" style="width: 20px;">
										<select class="select" name="category">
											<option value="결제" <%= selected[0] %>>결제</option>
											<option value="서비스" <%= selected[1] %>>서비스</option>
											<option value="회원/등급" <%= selected[2] %>>회원/등급</option>
											<option value="기타" <%= selected[3] %>>기타</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<textarea id="con" name="con" cols="100%" rows="20"style="resize:none;"><%= board.getContent() %></textarea>
								</td>
							</tr>
						</table>
						
						<br>
						
						<div class="btnBox" align="center">
							<button class="defaultBtn" type="submit" id="updateFaqBtn" onclick="editcom();">수정</button>
							<button  class="defaultBtn menuBtn" type="button" onclick="location.href='javascript:history.go(-1);'" id="cancelBtn">취소</button>
							<button class="defaultBtn cancelBtn" type="button" onclick="deleteFaq();" id="deleteBtn">삭제</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		function deleteFaq() {
			var del = confirm("해당 FAQ를 삭제하시겠습니까?");
			if(del) {
				location.href='<%= request.getContextPath() %>/delete.faq?no=' +'<%= board.getPostNo() %>';
			}
		}
		
		function editcom() {
			alert('수정이 완료되었습니다.');
		}
	</script>
	
</body>
<%@ include file="../../common/footer.jsp" %>
</html>