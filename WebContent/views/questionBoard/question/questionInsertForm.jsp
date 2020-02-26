<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<div class="main">
				<div class="pageTitle">
					<h1>1:1 문의글 수정</h1>
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
								<textarea rows="15" cols="60" name="content" style="resize:none; width: 100%;" ></textarea>
							</td>
						</tr>
					</table>
					<br>
					<div align="center">
						<button type="submit" id="insertBtn">등록하기</button>
						<input type="button" id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/list.qu?userNo=<%= loginUser.getUserNo() %>'" value="취소">
					</div>
					</form>
				</div>	
			</div>	
		</div>	
	</div>

</body>
</html>