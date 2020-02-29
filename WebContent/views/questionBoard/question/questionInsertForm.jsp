<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의글 작성</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<style>

	textarea, #title, #category{
		border-radius: 10px;
		font-size:15px;
		font-family:"ON I고딕";
	}
	textarea{margin-top:10px;}
	.outer{
		width:1000px; height: 500px; background: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left: auto; margin-right: auto; margin-top: 50px;
	}
</style>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp" %>
	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>1:1 문의</h1>
				</div>
				<div class="tableArea">
					<form action="<%= request.getContextPath() %>/insert.qu" method="post">
					<table>
						<tr>
							<td><input type="text" id="title"  name="title" size="40" placeholder="제목을 입력해주세요"></td>
							<th>카테고리</th>
							<td>
								<select name="category" id="category">
									<option>--------</option>
									<option value="결제">결제</option>
									<option value="서비스">서비스</option>
									<option value="회원/등급">회원/등급</option>
									<option value="기타">기타</option>
								</select>
							</td>	
						</tr>
						<tr>
							<td colspan="4">
								<textarea rows="15" cols="60" name="content" style="resize:none; width: 100%;" placeholder="문의글을 작성해주세요." ></textarea>
							</td>
						</tr>
					</table>
					<br>
					<div align="center">
						<button type="submit" class="defaultBtn" id="insertBtn">등록하기</button>
						<input type="button"  class="defaultBtn" id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/list.qu?userNo=<%= loginUser.getUserNo() %>'" value="취소">
					</div>
					</form>
				</div>	
			</div>	
		</div>	
	</div>

</body>
</html>