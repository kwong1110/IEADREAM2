<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 관리</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../../../js/SelectAll.js"></script>
<link rel="stylesheet" href="../../../css/board.css">
</head>
<body>
	<div>
		<div id="subTitle">
			<h2>게시물 관리</h2>
		</div>
		<div id="contents">
			<form method="get">
				<div id="topBox">
					<div class="midBox">
						<div class="searchMenu">카테고리</div>
						<div>
							<select class="search category">
								<option value="partyReview">파티참여 후기</option>
								<option value="weAreCouple">우리커플됐어요</option>
								<option value="question">1:1문의</option>
							</select>
						</div>
					</div>
					<div class="midBox">
						<div class="searchMenu">검색어</div>
						<div>
							<select class="search">
								<option value="name">이름</option>
								<option value="userNum">회원번호</option>
								<option value="userId">아이디</option>
							</select>
							<input placeholder="검색어를 입력하세요!" class="search search2" type="text">
							<button class="defaultBtn searchBtn" type="button">검색</button>
						</div>
					</div>
				</div>
				<table id="mainBoard">
					<thead>
						<tr>
							<th><input type="checkbox" id="all" onclick="checkAll();"></th>
							<th>No</th>
							<th>회원번호</th>
							<th>아이디</th>
							<th>이름</th>
							<th>카테고리</th>
							<th>글 제목</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="checkbox" name="checkselect"
								onclick="checkDetail()"></td>
							<td>1</td>
							<td>A1000000</td>
							<td>user01</td>
							<td>박소현</td>
							<td>파티참여 후기</td>
							<td>꾸르잼bb</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="checkselect"
								onclick="checkDetail()"></td>
							<td>2</td>
							<td>A2000000</td>
							<td>user02</td>
							<td>임승우</td>
							<td>우리 커플됐어요</td>
							<td>감사합니다.</td>
						</tr>
					</tbody>
				</table>
			</form>
			<div id="buttonBox">
				<button type="submit" class="defaultBtn botBtnC">게시물 삭제</button>
			</div>
		</div>
	</div>
</body>
</html>