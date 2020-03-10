<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String mes = (String)request.getAttribute("msg"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴 완료</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board.css">
<style>
	.listArea{width: 800px;}
	.tableArea tr { width: -webkit-fill-available;}
	.tableArea td {/* 게시판제목라인 */
		padding:20px 0;
		color:rgb(230, 141, 150); font-size:1em;/* 제목글자크기 */ 
		letter-spacing:0.1em;}/* 제목띠어쓰기간격 */ 
	
	input{font-size: 20px; padding: 2px; width: 30%;}

	.btnBox{border-top: 1px solid rgb(224, 224, 224);}
	
	*:focus { outline:none; }
	.main{margin-top: 200px;}
</style>
</head>
<body>

	<%@ include file="../../common/mainmenu.jsp" %>
	
	<div class="outer">
		<div class="wrapper">
				<div class="main" style="align: center;">
					<h3 style="text-align: center; padding: 5px;">탈퇴가 완료되었습니다.</h3>
					<div class="btnBox">
						<button class="defaultBtn" onclick="ok();">확인</button>
					</div>
				</div>
		</div>
	</div>
</body>
<%@ include file="../../common/footer.jsp" %>
<script>

function ok(){	
	location.href='<%= request.getContextPath() %>/index.jsp';
}

</script>
</html>