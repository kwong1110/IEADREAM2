<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="account.model.vo.*"%>
<%
	/*
	request.setCharacterEncoding("utf-8");
	UserInfo ui = (UserInfo)request.getAttribute("ui");
	String photoPath = (String)request.getAttribute("pPath");

	int userNo = ui.getUserNo();
	
	String hello = ui.getHello();
	
	int height = ui.getHeight();
		String h1 = null; String h2 = null; String h3 = null;
		String h4 = null; String h5 = null; String h6 = null;
		String h7 = null; String h8 = null;
		switch(height) {
		case 150: h1 = "checked"; break;
		case 155: h2 = "checked"; break;
		case 160: h3 = "checked"; break;
		case 165: h4 = "checked"; break;
		case 170: h5 = "checked"; break;
		case 175: h6 = "checked"; break;
		case 180: h7 = "checked"; break;
		case 185: h8 = "checked"; break;
		}
		
	String shape = ui.getShape();
		String sh1 = null; String sh2 = null; String sh3 = null;
		String sh4 = null; String sh5 = null;
		switch(shape) {
		case "마름": sh1 = "checked"; break;
		case "보통": sh2 = "checked"; break;
		case "통통": sh3 = "checked"; break;
		case "근육질": sh4 = "checked"; break;
		case "글래머": sh5 = "checked"; break;
		}
		
	String style = ui.getStyle();
		String st1 = null; String st2 = null; String st3 = null;
		String st4 = null; String st5 = null; String st6 = null;
		switch(style) {
		case "귀여운": st1 = "checked"; break;
		case "지적인": st2 = "checked"; break;
		case "섹시한": st3 = "checked"; break;
		case "따뜻한": st4 = "checked"; break;
		case "우아한": st5 = "checked"; break;
		case "터프한": st6 = "checked"; break;
		}
		
	String religion = ui.getReligion();
		String rel1 = null; String rel2 = null;	String rel3 = null;
		String rel4 = null; String rel5 = null;
		switch(religion) {
		case "기독교": rel1 = "checked"; break;
		case "천주교": rel2 = "checked"; break;
		case "불교": rel3 = "checked"; break;
		case "무교": rel4 = "checked"; break;
		case "기타": rel5 = "checked"; break; 
		}
		
	int drink = ui.getDrink();
		String d3 = null; String d2 = null; String d1 = null; String d0 = null;
		switch(drink) {
		case 3: d3 = "checked"; break;
		case 2: d2 = "checked"; break;
		case 1: d1 = "checked"; break;
		case 0: d0 = "checked"; break;
		}
		
	int smoke = ui.getSmoke();
		String s1 = null; String s0 = null;
		switch(smoke) {
		case 1: s1 = "checked"; break;
		case 2: s0 = "checked"; break;
		}
		
	String job = ui.getJob();
		String j1 = null; String j2 = null; String j3 = null; String j4 = null;
		String j5 = null; String j6 = null; String j7 = null; String j8 = null;
		switch(job) {
		case "학생": j1 = "checked"; break;
		case "사무직": j2 = "checked"; break;
		case "연구직": j3 = "checked"; break;
		case "교육직": j4 = "checked"; break;
		case "예술" : j5 = "checked"; break;
		case "서비스": j6 = "checked"; break;
		case "전문직": j7 = "checked"; break;
		case "기타" : j8 = "checked"; break;
		}
		
	int scholar = ui.getScholar();
		String sc1 = null; String sc2 = null; String sc3 = null; String sc4 = null; String sc5 = null;
		switch(scholar) {
		case 0: sc1 = "checked"; break;
		case 2: sc2 = "checked"; break;
		case 4: sc3 = "checked"; break;
		case 6: sc4 = "checked"; break;
		case 8: sc5 = "checked"; break;
		}
		
	int region = ui.getRegion();
		String re11 = null; String re42 = null;
		String re12 = null; String re43 = null;
		String re13 = null; String re51 = null;
		String re20 = null; String re52 = null;
		String re31 = null; String re53 = null;
		String re32 = null; String re54 = null;
		String re33 = null; String re55 = null;
		String re41 = null; String re60 = null;
		 switch(region) {
		 case 11: re11 = "checked"; break;
		 case 12: re12 = "checked"; break;
		 case 13: re13 = "checked"; break;
		 case 20: re20 = "checked"; break;
		 case 31: re31 = "checked"; break;
		 case 32: re32 = "checked"; break;
		 case 33: re33 = "checked"; break;
		 case 41: re41 = "checked"; break;
		 case 42: re42 = "checked"; break;
		 case 43: re43 = "checked"; break;
		 case 51: re51 = "checked"; break;
		 case 52: re52 = "checked"; break;
		 case 53: re53 = "checked"; break;
		 case 54: re54 = "checked"; break;
		 case 55: re55 = "checked"; break;
		 case 60: re60 = "checked"; break;
		 }
		 
	 String[] getInter = ui.getInterest(); // 가져온 배열
	 String[] interest = {"movie", "musical", "comic", "picture", "books", "music",
	                      "sing", "instrurment", "cook", "camp", "exercise", "sports",
	                      "vgame", "bgame", "sns", "drink", "beauty", "pet", "diy", "money"}; // 취미20개가 다 저장된 배열
	 String[] check = new String[20];         
	                      
	 for(int k = 0; k < interest.length; k++) {
		 for(int j = 0; j < getInter.length; j++) {
			 if(interest[k].equals(getInter[j])) { //해당 관심분야를 가져왔다면
				 check[k] = "checked";
			 } 
		 }
	 };
	*/
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<meta charset="UTF-8">
<title>내 정보 입력</title>
<style>
	.tableArea th {/* 게시판제목라인 */
		padding:12px 0;
		color:rgb(230, 141, 150); font-size:20px;/* 제목글자크기 */ 
		letter-spacing:0.1em;
		padding: 5px;
		text-align: left;}/* 제목띠어쓰기간격 */ 
	.tableArea td {/* 게시판제목라인 */
		padding:12px 0;
		border-top:1px solid rgb(224, 224, 224); /* 상단라인색 */
		color:rgb(136, 136, 136); font-size:1em;/* 제목글자크기 */ 
		letter-spacing:0.1em;
		line-height: 30px;}/* 제목띠어쓰기간격 */ 
</style>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp" %>

	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1> 내 정보 입력 </h1>
				</div>
				<div class="tableArea">
					<form action="<%= request.getContextPath() %>/update.ui" method="post" enctype="multipart/form-data">
						 <section id="itemProfile" style="width: 100%;">
						 	<table>
						 		<tr>
						 			<th>사진</th>
						 			<th style="text-align: center;">자기소개</th>
						 		</tr>
						 		<tr>
						 			<td>
						             	<article>
											<img src="photoPath" id='output' style="width: 200px; height: 200px;">
						              	</article>
						 			</td>
						 			<td>
						              	<article id="hello" style="text-align:center; margin-left:30px;">
						                	<textarea style="width: 550px; height:200px; margin-top :15px; resize:none;" name="hello"></textarea>
						              	</article>
						 			</td>
						 		</tr>
						 		<tr>
						 			<td>
						              	<input type='file' accept='image/*' onchange='openFile(event)' id="imgInput" name="profileImg">
						 			</td>
						 		</tr>
						 	</table>
			            </section>
			            <br><br>
						<section id="items">
							<table>
								<input type="hidden" name="userNo" id="userNo" value="">
								<tr>
									<th class="itemName" id=""> 키 (cm) </th>
									<td>
										<label><input type="radio" name="height" value="150"> 155이하</label> 
										<label><input type="radio" name="height" value="155"> 155~160</label>
										<label><input type="radio" name="height" value="160"> 160~165</label>
										<label><input type="radio" name="height" value="165"> 165~170</label>
										<label><input type="radio" name="height" value="170"> 170~175</label>
										<label><input type="radio" name="height" value="175"> 175~180</label>
										<label><input type="radio" name="height" value="180"> 180~185</label>
										<label><input type="radio" name="height" value="185"> 185 이상</label>
									</td>
								</tr>
								<tr>
									<th class="itemName" id="">체형</th>
									<td>
									<label><input type="radio" name="shape" value="마름"> 마름</label>
									<label><input type="radio" name="shape" value="보통"> 보통</label>
									<label><input type="radio" name="shape" value="통통"> 통통</label>
									<label><input type="radio" name="shape" value="근육질"> 근육질</label>
									<label><input type="radio" name="shape" value="글래머"> 글래머</label>
									</td>
								</tr>
								<tr>
									<th class="itemName" id="">스타일</th>
									<td><label><input type="radio" name="style" value="귀여움"> 귀여운</label> 
									<label><input type="radio" name="style" value="지적인"> 지적인</label>
									<label><input type="radio" name="style" value="섹시한"> 섹시한</label> 
									<label><input type="radio" name="style" value="따뜻한"> 따뜻한</label> 
									<label><input type="radio" name="style" value="우아한"> 우아한</label>
									<label><input type="radio" name="style" value="터프한"> 터프한</label>
									</td>
								</tr>
								<tr>
									<th class="itemName" id="">종교</th>
									<td>
									<label><input type="radio" name="religion" value="기독교"> 기독교</label> 
									<label><input type="radio" name="religion" value="천주교"> 천주교</label>
									<label><input type="radio" name="religion" value="불교"> 불교</label>
									<label><input type="radio" name="religion" value="무교"> 무교</label>
									<label><input type="radio" name="religion" value="기타"> 기타</label>
									</td>
								</tr>
								<tr>
									<th class="itemName" id="">음주 습관</th>
									<td><label><input type="radio" name="drink" value="3"> 주 3회</label> 
									<label><input type="radio" name="drink" value="2"> 주 1~2회</label> 
									<label><input type="radio" name="drink" value="1"> 월 1회</label> 
									<label><input type="radio" name="drink" value="0"> 안 마심</label>
									</td>
								</tr>
								<tr>
									<th class="itemName" id="">흡연 여부</th>
									<td>
									<label><input type="radio" name="smoke" value="1"> 흡연</label> 
									<label><input type="radio" name="smoke" value="0"> 비흡연</label>
									</td>
								</tr>
								<tr>
									<th class="itemName" id="">직업</th>
									<td>
									<label><input type="radio" name="job" value="학생"> 학생</label> 
									<label><input type="radio" name="job" value="사무직"> 사무직</label>
									<label><input type="radio" name="job" value="연구직"> 연구직</label>
									<label><input type="radio" name="job" value="교육직"> 교육직</label> 
									<label><input type="radio" name="job" value="예술"> 예술</label> 
									<label><input type="radio" name="job" value="서비스"> 서비스</label>
									<label><input type="radio" name="job" value="전문직"> 전문직</label> 
									<label><input type="radio" name="job" value="기타"> 기타</label>
									</td>
								</tr>
								<tr>
									<th class="itemName" id="">최종 학력</th>
									<td>
									<label><input type="radio" name="scholar" value="0"> 고졸</label>
									<label><input type="radio" name="scholar" value="2"> 초대졸</label>
									<label><input type="radio" name="scholar" value="4"> 대졸</label> 
									<label><input type="radio" name="scholar" value="6"> 석사</label> 
									<label><input type="radio" name="scholar" value="8"> 박사</label>
									</td>
								</tr>
								<tr>
									<th class="itemName" id="">거주 지역</th>
									<td>
									<label><input type="radio" name="region"value="11"> 서울</label> 
									<label><input type="radio" name="region" value="12"> 인천</label>
									<label><input type="radio" name="region" value="13"> 경기</label> 
									<label><input type="radio" name="region" value="20"> 강원</label> 
									<label><input type="radio" name="region" value="31"> 충북</label>
									<label><input type="radio" name="region" value="32"> 충남</label> 
									<label><input type="radio" name="region" value="33"> 대전</label> 
									<label><input type="radio" name="region" value="41"> 전북</label><br>
									<label><input type="radio" name="region" value="42"> 전남</label>
									<label><input type="radio" name="region" value="43"> 광주</label> 
									<label><input type="radio" name="region" value="51"> 경북</label>
									<label><input type="radio" name="region" value="52"> 대구</label> 
									<label><input type="radio" name="region" value="53"> 경남</label> 
									<label><input type="radio" name="region" value="54"> 부산</label>
									<label><input type="radio" name="region" value="55"> 울산</label> 
									<label><input type="radio" name="region" value="60"> 제주</label>
									</td>
								</tr>
								<tr>
									<th class="itemName" id="">관심 분야</th>
									<td>
									<label><input type="checkbox" name="interest" value="movie"> 영화&드라마</label>
									<label><input type="checkbox" name="interest" value="musical"> 연극&뮤지컬</label>
									<label><input type="checkbox" name="interest" value="comic"> 만화&서브컬처</label>
									<label><input type="checkbox" name="interest" value="picture"> 사진&영상 촬영</label> 
									<label><input type="checkbox" name="interest" value="books"> 독서</label>
									<label><input type="checkbox" name="interest" value="music"> 음악 감상</label><br> 
									<label><input type="checkbox" name="interest" value="sing"> 노래&춤</label>
									<label><input type="checkbox" name="interest" value="instrument"> 악기 연주</label> 
									<label><input type="checkbox" name="interest" value="cook"> 요리&음식</label>
									<label><input type="checkbox" name="interest" value="camp"> 여행&캠핑</label> 
									<label><input type="checkbox" name="interest" value="exercise"> 운동</label> 
									<label><input type="checkbox" name="interest" value="sports"> 스포츠 경기</label> 
									<label><input type="checkbox" name="interest" value="vgame"> 비디오 게임</label><br> 
									<label><input type="checkbox" name="interest" value="bgame"> 보드게임</label> 
									<label><input type="checkbox" name="interest" value="sns"> SNS</label>
									<label><input type="checkbox" name="interest" value="drink"> 술&모임</label> 
									<label><input type="checkbox" name="interest" value="beauty"> 뷰티&패션</label> 
									<label><input type="checkbox" name="interest" value="pet"> 반려동물</label>
									<label><input type="checkbox" name="interest" value="diy"> DIY</label> 
									<label><input type="checkbox" name="interest" value="money"> 재테크</label>
									</td>
								</tr>
							</table>
						</section>
						<section id="submit" style="text-align: center;">
							<input class="defaultBtn" type="submit" value="수정">
						</section>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script>

	var openFile = function(event) {
    	var input = event.target;
   		var reader = new FileReader();
    	reader.onload = function(){
    		var dataURL = reader.result;
    		var output = document.getElementById('output');
    		output.src = dataURL;
    		};
	reader.readAsDataURL(input.files[0]);

  	};

</script>
</html>