<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="account.model.vo.*, common.*, java.util.ArrayList" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
.main{
	display: flex;
  	align-items: center;
  	justify-content: center;
}

.botBox{
	background: #c7eef2;
	padding: 10px;
	border-radius: 10px;
}
.deleteCheck{
	margin: 10px;
	font-weight: bold;
	font-size: 15px;
	color: red;
}
</style>
</head>
<body>
	<div class="main">
		<form method="get">
			<table class="mainBoard">
				<tr>
					<td colspan="2"> 
						<div class="botBox">
							<b>등록할 게시판 카테고리</b>
							<select name="checkCategory" id="sCategoryBox" class="search">
								<option value="BC">베스트커플</option>
								<option value="FAQ">FAQ</option>
							</select>
						</div>
					</td>
				</tr>
			</table>
			<div class="deleteCheck">
				<div>해당 카테고리 등록페이지로 이동합니다.</div>
			</div>
			<div class="btnBox">
				<button class="defaultBtn" type="button" onclick="goInsert();">확인</button>
				<button class="defaultBtn" type="button" onclick="window.close();">취소</button>
			</div>
		</form>
	</div>
	<script>
	function goInsert(){
		
		if($('#sCategoryBox option:selected').val() == 'BC'){
			opener.document.location.href='<%= request.getContextPath()%>/views/coupleStory/bestCouple/bestCoupleInsertForm.jsp';
			self.close();
		} else if($('#sCategoryBox option:selected').val() == 'FAQ'){
			opener.document.location.href='<%= request.getContextPath()%>/views/questionBoard/faq/faqInsertForm.jsp';
			self.close();
		}
	}
		
	</script>
</body>
</html>