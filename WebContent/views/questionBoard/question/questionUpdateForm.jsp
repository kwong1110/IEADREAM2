<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "questionBoard.question.model.vo.Question"%>

<%
	request.setCharacterEncoding("UTF-8");
	String category = request.getParameter("category");
	System.out.println(category);
	String[] selected = new String[5];
	switch(category){
	case "서비스":
		selected[0] = "selected";
		break;
	case "파티":
		selected[1] = "selected";
		break;
	case "결제":
		selected[2] = "selected";
		break;
	case "회원/등급":
		selected[3] = "selected";
		break;
	case "기타":
		selected[4] = "selected";
		break;
	}
	 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판 수정</title>
<link rel="stylesheet" type="text/css" href="../css/board.css" />
<style>
	textarea, #title, #category{
		border-radius: 10px;
		font-size:15px;
		font-family:"ON I고딕";
	}
	textarea{margin-top:10px;}
	#insertBtn{
		border-radius: 10px;
		background:  rgb(123, 164, 213);
		padding: 10px;
		color: white;
		font-size: 15px;
		text-align: center;
		border:none;
	}
	#cancelBtn{
		border-radius: 10px;
		background:rgb(230, 141, 150);
		padding: 10px;
		color: white;
		font-size: 15px;
		text-align: center;
	}
</style>
</head>
<body>
<%@ include file="../../common/mainmenu.jsp" %>
	<div class="outer">
		<div class="wrapper">
		<div class = "main">
			<div class="pageTitle">
				<h1>1:1 문의</h1>
			</div>
			
			<div class="tableArea"> 
				<form id="board" action="<%= request.getContextPath() %>/update.qu" method="post">
					<table>
						<tr>
							<td>
								<input type ="hidden" name ="postNo" value="<%= request.getParameter("postNo") %>">
								<input type="text" id="title"  name="title" size="40" value="<%= request.getParameter("title")%>"></td>
							<th>카테고리</th>
							<td>
							<select name="category" id="category">
									<option>--------</option>
									<option value="서비스" <%= selected[0] %>>서비스</option>
									<option value="파티" <%= selected[1] %>>파티</option>
									<option value="결제" <%= selected[2] %>>결제</option>
									<option value="회원/등급" <%= selected[3] %>>회원/등급</option>
									<option value="기타" <%= selected[4] %>>기타</option>
								</select>
							</td>	
						</tr>
						<tr>
							<td colspan="4">
								<textarea rows="15" cols="60" name="content" style="resize:none; width: 100%;" ><%= request.getParameter("content") %></textarea>
							</td>
						</tr>
					</table>
					<br>
					<div align="center">
						<button type="submit" id="insertBtn">등록하기</button>
						<input type="button" id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/list.qu'" value="취소">
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%-- =======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "questionBoard.question.model.vo.Question"%>
<%
	request.setCharacterEncoding("UTF-8");
	int category = Integer.parseInt(request.getParameter("category"));
	String[] selected = new String[5];
	for(int i =0; i<selected.length; i++){
		if(category == (i+1)*10){
			selected[i] = "selected";
		}else{
			selected[i] = "";
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판 수정</title>
<link rel="stylesheet" type="text/css" href="../css/board.css" />
<style>
		textarea, #title, #category{
		border-radius: 10px;
		font-size:16pt;
		font-family:"ON I고딕";
	}
	textarea{margin-top:10px;}
	#insertBtn{
		border-radius: 10px;
		background:  rgb(123, 164, 213);
		padding: 10px;
		color: white;
		font-size: 15px;
		text-align: center;
		border:none;
	}
	#cancelBtn{
		border-radius: 10px;
		background:rgb(230, 141, 150);
		padding: 10px;
		color: white;
		font-size: 15px;
		text-align: center;
	}
</style>
</head>
<body>
	<div class="outer">
		<div class="wrapper">
		<div class = "main">
			<div class="pageTitle">
				<h1>1:1 문의</h1>
			</div>
			
			<div class="tableArea"> 
				<form id="board" action="<%= request.getContextPath() %>/update.qu" method="post">
					<table>
						<tr>
							<td><input type="text" id="title"  name="title" size="40" value="<%= request.getParameter("title")%>"></td>
							<th>카테고리</th>
							<td>
								<select name="category" id="category">
									<option>--------</option>
									<option value="10" <%= selected[0] %>>서비스</option>
									<option value="20" <%= selected[1] %>>파티</option>
									<option value="30" <%= selected[2] %>>결제</option>
									<option value="40" <%= selected[3] %>>회원/등급</option>
									<option value="50" <%= selected[4] %>>기타</option>
								</select>
							</td>	
						</tr>
						<tr>
							<td colspan="4">
								<textarea rows="15" cols="60" name="content" style="resize:none; width: 100%;" ><%= request.getParameter("content") %></textarea>
							</td>
						</tr>
					</table>
					<br>
					<div align="center">
						<button type="submit" id="insertBtn">등록하기</button>
						<button id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/list.qu'">취소</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
>>>>>>> branch 'master' of https://github.com/kwong1110/IeaDream.git
 --%>