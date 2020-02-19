<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<style>
	.tableArea {width:600px; height:350px; margin-left:auto; margin-right:auto;}
	.title{font-size: 15px;}
	.cate{font-size: 15px; text-align: center; background: none; border: none;}
	.select{font-size: 15px; text-align: center;}
	.con{font-size: 15px;}
</style>
</head>
<body>
	
	<%@ include file="../../common/mainmenu.jsp" %>
	
	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>FAQ 작성</h1>
				</div>
				<div class="tableArea">
					<form action="<%= request.getContextPath() %>/insert.faq" method="post">
						<table class="table">
							<tr>
								<td>
									<input type="text" size="50" class="title" name="title" placeholder="제목을 넣어주세요">
								</td>
								<td>
									<div>
										<input type="text" size="10" class="cate" value="카테고리">
									</div>
								</td>
								<td>
									<select class="select" name="category">
										<option value="결제">결제</option>
										<option value="회원">회원</option>
										<option value="서비스">서비스</option>
										<option value="기타">기타</option>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<textarea name="con" cols="100" rows="15"style="resize:none;" placeholder="내용을 입력해주세요"></textarea>
								</td>
							</tr>
						</table>
						
						<br>
						
						<div class="btnBox" align="center">
							<button type="submit" id="insertFaqBtn">등록</button>
							<div onclick="location.href='javaxcript:history.go(-1);'" id="cancelBtn">취소</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


</body>
</html>