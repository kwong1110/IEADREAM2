<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파티 관리</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../../../js/SelectAll.js"></script>
<link rel="stylesheet" href="../../../css/board.css">
</head>
<body>
	<div>
		<div id="subTitle">
			<h2>파티 관리</h2>
		</div>
		<div id="contents">
			<form method="get">
				<div id="topBox">
					<div class="midBox">
						<div class="searchMenu">검색어</div>
						<div>
							<select class="search">
								<option value="partyName">파티 이름</option>
								<option value="partyDate">일시</option>
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
							<th>파티번호</th>
							<th>일시</th>
							<th>파티 이름</th>
							<th>참여 인원 (남/여)</th>
							<th>상태</th>
							<th>취소 유무</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="checkbox" name="checkselect"
								onclick="checkDetail()"></td>
							<td>1</td>
							<td>PT00001</td>
							<td>2020.02.20</td>
							<td>와인 파티</td>
							<td>10/10</td>
							<td>진행중</td>
							<td>N</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="checkselect"
								onclick="checkDetail()"></td>
							<td>2</td>
							<td>PT00002</td>
							<td>2020.03.15</td>
							<td>고기 파티</td>
							<td>5/3</td>
							<td>예정</td>
							<td>N</td>
						</tr>
					</tbody>
				</table>
			</form>
			<div id="buttonBox">
				<button type="submit" class="defaultBtn botBtnC">파티 등록</button>
				<button type="button" class="defaultBtn botBtnC">파티 수정</button>
				<button type="button" class="defaultBtn botBtnC">파티 취소</button>
			</div>
		</div>
	</div>
</body>
</html>