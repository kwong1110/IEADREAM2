<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "board.model.vo.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	 String category = request.getParameter("category");
	System.out.println(category);
	String[] selected = new String[4];
	switch(category){
	case "결제":
		selected[0] = "selected";
		break;
	case "서비스":
		selected[1] = "selected";
		break;
	case "회원/등급":
		selected[2] = "selected";
		break;
	case "기타":
		selected[3] = "selected";
		break;
	} 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이어드림 - 1:1문의</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<style>
	.outer{
		width: 1000px; height: 500px; background: white;
		margin-left: auto; margin-right: auto; margin-top: 50px;
	}
	button, input[type=button]{cursor: pointer;}
	.tableArea{width:670px;	height:350px;}
	textarea, #title, #category{
		border-radius: 5px;
		font-size:15px;
		font-family:"ON I고딕";
		border: none;
	}
	textarea{margin:20px;}
	.qUpdateTableArea{background: #f9f9f9}
	.qUpdateTableArea td{
		border-top:1px solid rgb(136, 136, 136);
		border-bottom:1px solid rgb(224, 224, 224); 
	}
	.qUpdateTableArea th {/* 게시판제목라인 */
		padding:12px 0;
		border-top:1px solid rgb(136, 136, 136); /* 상단라인색 */
		border-bottom:1px solid rgb(224, 224, 224); /* 하단라인색 */
		background:#f9f9f9;  /* 제목배경색 */ 
		color:rgb(51, 51, 51); font-size:1em;/* 제목글자크기 */ 
		letter-spacing:0.1em}/
</style>
</head>
<body>
<%@ include file="../../common/mainmenu.jsp" %>
	<div class="outer">
		<div class="wrapper">
			<div class = "main">
				<div class="pageTitle">
					<h2>1:1 문의</h2>
				</div>
			
				<div class="tableArea"> 
					<form id="board" action="<%= request.getContextPath() %>/update.qu" method="post">
						<table  class="qUpdateTableArea">
							<tr>
								<th  width=10%>제목</th>
								<td  width=30%>
									<input type ="hidden" name ="postNo" value="<%= request.getParameter("postNo") %>">
									<input type="text" id="title"  name="title" size="40" value="<%= request.getParameter("title")%>"></td>
								<th  width=20% >카테고리</th>
								<td>
								<select name="category" id="category">
										<option></option>
										<option value="결제" <%= selected[0] %>>결제</option>
										<option value="서비스" <%= selected[1] %>>서비스</option>
										<option value="회원/등급" <%= selected[2] %>>회원/등급</option>
										<option value="기타" <%= selected[3] %>>기타</option>
								</select>
								</td>	
							</tr>
							<tr>
								<td colspan="4">
									<textarea rows="15" cols="60" id="content"  name="content" style="resize:none; width: 94%;" ><%= request.getParameter("content") %></textarea>
								</td>
							</tr>
						</table>
						<br>
						<div align="center">
							<button type="submit" class="defaultBtn">등록하기</button>
							<button type="button" class="defaultBtn cancelBtn" id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/list.qu?userNo='+<%= loginUser.getUserNo() %>">취소</button> 
							<%-- <input type="button"  class="defaultBtn" id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/list.qu?userNo='+<%= loginUser.getUserNo() %>" value="취소"> --%>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
<%@ include file="../../common/footer.jsp" %>
</html>