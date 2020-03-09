<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="account.model.vo.*"%>
<%
	UserInfo ui = (UserInfo)request.getAttribute("ui");

	int userNo = ui.getUserNo();
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
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <title>이상형 정보 입력</title>
  <meta charset="utf-8">
  <style>
  
	.tableArea th {/* 게시판제목라인 */
		padding:12px 0;
		color:rgb(230, 141, 150); font-size:20px;/* 제목글자크기 */ 
		letter-spacing:0.1em;
		padding: 5px;
		padding-right: 50px;
		text-align: left;}/* 제목띠어쓰기간격 */ 
	.tableArea td {/* 게시판제목라인 */
		padding:12px 0;
		border-top:1px solid rgb(224, 224, 224); /* 상단라인색 */
		color:rgb(136, 136, 136); font-size:1em;/* 제목글자크기 */ 
		letter-spacing:0.1em;
		line-height: 30px;}/* 제목띠어쓰기간격 */ 
	.tableArea{margin-top: 40px; margin-bottom: 40px;}
	.itemPriority{
		margin-left: 40px;
		padding: 3px 7px 6px 7px;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		box-shadow: 0 1px 2px rgba(0,0,0,.2);
	}
  </style>
</head>
<body>
	<%@ include file="../common/mainmenu.jsp" %>
<section>
  <div id ="outer">
    <div class="wrapper">
      <div class ="main">
        <div class="pageTitle"><h1>이상형 정보 입력</h1></div>
          <form action="<%= request.getContextPath() %>/insert.up" method="post">
            	<div class="tableArea">
	              <input type="hidden" name="userNo" id="userNo" value="<%= userNo %>">
	              <table>
	                <tr class="itemBox">
	                  <th class="itemName" id="">키 (cm)</th>
	                  <td>
	                    <label><input type="radio" name="height" value="150">155이하</label>
	                    <label><input type="radio" name="height" value="155">155~160</label>
	                    <label><input type="radio" name="height" value="160">160~165</label>
	                    <label><input type="radio" name="height" value="165">165~170</label>
	                    <label><input type="radio" name="height" value="170">170~175</label>
	                    <label><input type="radio" name="height" value="175">175~180</label>
	                    <label><input type="radio" name="height" value="180">180~185</label>
	                    <label><input type="radio" name="height" value="185">185 이상</label>
	                  </td>
	                  <td>
	                    <select class="itemPriority" name="heightPri">
	                      <option value="2">중요</option>
	                      <option value="1" selected="selected">보통</option>
	                      <option value="0">무관</option>
	                    </select>
	                  </td>
	                </tr>
	                <tr class="itemBox">
	                  <th class="itemName" id="">체형</th>
	                  <td>
	                    <label><input type="radio" name="shape" value="마름">마름</label>
	                    <label><input type="radio" name="shape" value="보통">보통</label>
	                    <label><input type="radio" name="shape" value="통통">통통</label>
	                    <label><input type="radio" name="shape" value="근육질">근육질</label>
	                    <label><input type="radio" name="shape" value="글래머">글래머</label>
	                  </td>
	                  <td>
	                    <select class="itemPriority" name="shapePri">
	                      <option value="2">중요</option>
	                      <option value="1" selected="selected">보통</option>
	                      <option value="0">무관</option>
	                    </select>
	                  </td>
	                </tr>
	                <tr class="itemBox">
	                  <th class="itemName" id="">스타일</th>
	                  <td>
	                    <label><input type="radio" name="style" value="귀여운">귀여운</label>
	                    <label><input type="radio" name="style" value="지적인">지적인</label>
	                    <label><input type="radio" name="style" value="섹시한">섹시한</label>
	                    <label><input type="radio" name="style" value="따뜻한">따뜻한</label>
	                    <label><input type="radio" name="style" value="우아한">우아한</label>
	                    <label><input type="radio" name="style" value="터프한">터프한</label>
	                  </td>
	                  <td>
	                    <select class="itemPriority" name="stylePri">
	                      <option value="2">중요</option>
	                      <option value="1" selected="selected">보통</option>
	                      <option value="0">무관</option>
	                    </select>
	                  </td>
	                </tr>
	                <tr class="itemBox">
	                  <th class="itemName" id="">나이(만)</th>
	                  <td>
	                    <label><input type="radio" name="age" value="-2">연하</label>
	                    <label><input type="radio" name="age" value="-1">1~3년 연하</label>
	                    <label><input type="radio" name="age" value="0">동갑</label>
	                    <label><input type="radio" name="age" value="1">1~3년 연상</label>
	                    <label><input type="radio" name="age" value="2">연상</label>
	                  </td>
	                  <td>
	                    <select class="itemPriority" name="agePri">
	                      <option value="2">중요</option>
	                      <option value="1" selected="selected">보통</option>
	                      <option value="0">무관</option>
	                    </select>
	                  </td>
	                </tr>
	                <tr class="itemBox">
	                  <th class="itemName" id="">종교</th>
	                  <td>
	                    <label><input type="radio" name="religion" value="기독교">기독교</label>
	                    <label><input type="radio" name="religion" value="천주교">천주교</label>
	                    <label><input type="radio" name="religion" value="불교">불교</label>
	                    <label><input type="radio" name="religion" value="무교">무교</label>
	                    <label><input type="radio" name="religion" value="기타">기타</label>
	                  </td>
	                  <td>
	                    <select class="itemPriority" name="religionPri">
	                      <option value="2">중요</option>
	                      <option value="1" selected="selected">보통</option>
	                      <option value="0">무관</option>
	                    </select>
	                  </td>
	                </tr>
	                <tr class="itemBox">
	                  <th class="itemName" id="">음주 습관</th>
	                  <td>
	                    <label><input type="radio" name="drink" value="3">주 3회</label>
	                    <label><input type="radio" name="drink" value="2">주 1~2회</label>
	                    <label><input type="radio" name="drink" value="1">월 1회</label>
	                    <label><input type="radio" name="drink" value="0">안 마심</label>
	                  </td>
	                  <td>
	                    <select class="itemPriority" name="drinkPri">
	                      <option value="2">중요</option>
	                      <option value="1" selected="selected">보통</option>
	                      <option value="0">무관</option>
	                    </select>
	                  </td>
	                </tr>
	                <tr class="itemBox">
	                  <th class="itemName" id="">흡연 여부</th>
	                  <td>
	                    <label><input type="radio" name="smoke" value="1">흡연</label>
	                    <label><input type="radio" name="smoke" value="0">비흡연</label>
	                  </td>
	                  <td>
	                    <select class="itemPriority" name="smokePri">
	                      <option value="2">중요</option>
	                      <option value="1" selected="selected">보통</option>
	                      <option value="0">무관</option>
	                    </select>
	                  </td>
	                </tr>
	                <tr class="itemBox">
	                  <th class="itemName" id="">직업</th>
	                  <td>
	                    <label><input type="radio" name="job" value="학생">학생</label>
	                    <label><input type="radio" name="job" value="사무직">사무직</label>
	                    <label><input type="radio" name="job" value="연구직">연구직</label>
	                    <label><input type="radio" name="job" value="교육직">교육직</label>
	                    <label><input type="radio" name="job" value="예술">예술</label>
	                    <label><input type="radio" name="job" value="서비스">서비스</label>
	                    <label><input type="radio" name="job" value="전문직">전문직</label>
	                    <label><input type="radio" name="job" value="기타">기타</label>
	                  </td>
	                  <td>
	                    <select class="itemPriority" name="jobPri">
	                      <option value="2">중요</option>
	                      <option value="1" selected="selected">보통</option>
	                      <option value="0">무관</option>
	                    </select>
	                  </td>
	                </tr>
	                <tr class="itemBox">
	                  <th class="itemName" id="">최종 학력</th>
	                  <td>
	                    <label><input type="radio" name="scholar" value="0">고등학교</label>
	                    <label><input type="radio" name="scholar" value="2">전문대</label>
	                    <label><input type="radio" name="scholar" value="4">대학교</label>
	                    <label><input type="radio" name="scholar" value="6">대학원</label>
	                    <label><input type="radio" name="scholar" value="8">박사</label>
	                  </td>
	                  <td>
	                    <select class="itemPriority" name="scholarPri">
	                      <option value="2">중요</option>
	                      <option value="1" selected="selected">보통</option>
	                      <option value="0">무관</option>
	                    </select>
	                  </td>
	                </tr>
	                <tr class="itemBox">
	                  <th class="itemName" id="">거주 지역</th>
	                  <td>
	                    <label><input type="radio" name="region" value="11" disabled="disabled">서울</label>
	                    <label><input type="radio" name="region" value="12" disabled="disabled">인천</label>
	                    <label><input type="radio" name="region" value="13" disabled="disabled">경기</label>
	                    <label><input type="radio" name="region" value="20" disabled="disabled">강원</label>
	                    <label><input type="radio" name="region" value="31" disabled="disabled">충북</label>
	                    <label><input type="radio" name="region" value="32" disabled="disabled">충남</label>
	                    <label><input type="radio" name="region" value="33" disabled="disabled">대전</label>
	                    <label><input type="radio" name="region" value="41" disabled="disabled">전북</label><br>
	                    <label><input type="radio" name="region" value="42" disabled="disabled">전남</label>
	                    <label><input type="radio" name="region" value="43" disabled="disabled">광주</label>
	                    <label><input type="radio" name="region" value="51" disabled="disabled">경북</label>
	                    <label><input type="radio" name="region" value="52" disabled="disabled">대구</label>
	                    <label><input type="radio" name="region" value="53" disabled="disabled">경남</label>
	                    <label><input type="radio" name="region" value="54" disabled="disabled">부산</label>
	                    <label><input type="radio" name="region" value="55" disabled="disabled">울산</label>
	                    <label><input type="radio" name="region" value="60" disabled="disabled">제주</label>
	                  </td>
	                  <td>
	                    <select class="itemPriority" name="regionPri">
	                      <option value="2">중요</option>
	                      <option value="1" selected="selected">보통</option>
	                      <option value="0">무관</option>
	                    </select>
	                  </td>
	                </tr>
	                <tr class="itemBox">
	                  <th class="itemName" id="">관심 분야</th>
	                  <td>
		                    <label><input type="checkbox" name="interest" value="movie"  	disabled="disabled">영화&드라마</label>
							<label><input type="checkbox" name="interest" value="musical"  	disabled="disabled">연극&뮤지컬</label>
							<label><input type="checkbox" name="interest" value="comic"  	disabled="disabled">만화&서브컬처</label>
							<label><input type="checkbox" name="interest" value="picture"  	disabled="disabled">사진&영상 촬영</label> 
							<label><input type="checkbox" name="interest" value="books"  	disabled="disabled">독서</label>
							<label><input type="checkbox" name="interest" value="music"  	disabled="disabled">음악 감상</label><br> 
							<label><input type="checkbox" name="interest" value="sing"  	disabled="disabled">노래&춤</label>
							<label><input type="checkbox" name="interest" value="instrument"disabled="disabled">악기 연주</label> 
							<label><input type="checkbox" name="interest" value="cook"  	disabled="disabled">요리&음식</label>
							<label><input type="checkbox" name="interest" value="camp"  	disabled="disabled">여행&캠핑</label> 
							<label><input type="checkbox" name="interest" value="exercise"  disabled="disabled">운동</label> 
							<label><input type="checkbox" name="interest" value="sports"  	disabled="disabled">스포츠 경기</label> 
							<label><input type="checkbox" name="interest" value="vgame" 	disabled="disabled">비디오 게임</label><br> 
							<label><input type="checkbox" name="interest" value="bgame"  	disabled="disabled">보드게임</label> 
							<label><input type="checkbox" name="interest" value="sns"  		disabled="disabled">SNS</label>
							<label><input type="checkbox" name="interest" value="drink"  	disabled="disabled">술&모임</label> 
							<label><input type="checkbox" name="interest" value="beauty"  	disabled="disabled">뷰티&패션</label> 
							<label><input type="checkbox" name="interest" value="pet"  		disabled="disabled">반려동물</label>
							<label><input type="checkbox" name="interest" value="diy"  		disabled="disabled">DIY</label> 
							<label><input type="checkbox" name="interest" value="money" 	disabled="disabled">재테크</label>
	              		</td>
	                  <td>
	                    <select class="itemPriority" name="interestPri">
	                      <option value="2">중요</option>
	                      <option value="1" selected="selected">보통</option>
	                      <option value="0">무관</option>
	                    </select>
	                  </td>
	                </tr>
	               </table> 
               </div>
            <div class="btnBox">
				<button type="submit" id="joinBtn" class="defaultBtn" value="2단계">제출</button>
				<button type="reset" id="goMain" class="defaultBtn cancelBtn" onclick='location.href="<%= request.getContextPath() %>/views/common/mainmenu.jsp"'>취소</button>
            </div>
          </form>
      </div>
    </div>
  </div>
 </section>
</body>
<%@ include file="../common/footer.jsp" %>
</html>




<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="account.model.vo.*"%>
<%
	UserInfo ui = (UserInfo)request.getAttribute("ui");

	int userNo = ui.getUserNo();
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

%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <title>이상형 정보 입력</title>
  <meta charset="utf-8">
  <style>
    a:link { color: black; text-decoration: none}
    a:visited {color: black;}
    a:hover{ color : silver;}
    .wrapper{
      text-align: left;
      width: 1200px;
      margin:0 auto;
      padding:0;
      display : block;
    }
    .outer{
      background-color: white;
      text-align: center;
      display:block;
    }
    /*nav{
      background-color: white;
      text-align: center;
      width: 170px;
      height: 100%;
      margin: 0 auto;
      padding:0;
      float : left;
    }
    .mainCategory{
      font-size : 15pt;
      font-weight : 500;
      padding-top: 20px;
      padding-bottom: 20px;
      border-bottom: 1px solid darkgray;
    }
    .subCategory{
      font-size : 13pt;
      font-weight : 400;
      padding-top: 20px;
    }*/
    .main{
      background-color: whites;
      text-align: left;
      max-width:1200px;
      min-height: 775px;
      margin:0 auto;
      padding:0;
    /*  border-left: 1px solid darkgray; */
    }
    .pageTitle{
      font-weight: 550;
      font-size: 16pt;
      margin: 30px;
    }
    section {
      padding: 15px;
    }
    footer {
      clear : left;
      background-color: gray;
      height: 120px;
      text-align: center;
    }
    #itemProfile, #items{
      margin-left : 15%;
    }
    .itemBox{
      height : 40px;
    }
    .itemName{
      margin : 10px 5px auto;
      width : 120px;
      height : 30px;
      font-size : 14pt;
      text-align: center;
    }
    .itemValue{
      text-align : right;
      margin : 5px  5px auto;
    }
    .itemPriority{
      margin-left:15px;
      background-color: lightgray;
      width : 60px;
      border-color: white;
    }

  </style>
</head>
<body>
	<%@ include file="../common/mainmenu.jsp" %>

  <div id ="outer">
    <div class="wrapper">
      <div class ="main">
        <section class="pageTitle">
          <label>이상형 정보 입력</label>
        </section>
        <section>
          <form action="<%= request.getContextPath() %>/insert.up" method="post">
          <input type="number" name="userNo" hidden="hidden"><%= userNo %>
            <section id="items">
              <table>
                <tr class="itemBox">
                  <td class="itemName" id="">키 (cm)</td>
                  <td>
                    <label><input type="radio" name="height" value="150">155이하</label>
                    <label><input type="radio" name="height" value="155">155~160</label>
                    <label><input type="radio" name="height" value="160">160~165</label>
                    <label><input type="radio" name="height" value="165">165~170</label>
                    <label><input type="radio" name="height" value="170">170~175</label>
                    <label><input type="radio" name="height" value="175">175~180</label>
                    <label><input type="radio" name="height" value="180">180~185</label>
                    <label><input type="radio" name="height" value="185">185 이상</label>
                  </td>
                  <td>
                    <select class="itemPriority" name="heightPri">
                      <option value="2">중요</option>
                      <option value="1" selected="selected">보통</option>
                      <option value="0">무관</option>
                    </select>
                  </td>
                </tr>
                <tr class="itemBox">
                  <td class="itemName" id="">체형</td>
                  <td>
                    <label><input type="radio" name="shape" value="마름">마름</label>
                    <label><input type="radio" name="shape" value="보통">보통</label>
                    <label><input type="radio" name="shape" value="통통">통통</label>
                    <label><input type="radio" name="shape" value="근육질">근육질</label>
                    <label><input type="radio" name="shape" value="글래머">글래머</label>
                  </td>
                  <td>
                    <select class="itemPriority" name="shapePri">
                      <option value="2">중요</option>
                      <option value="1" selected="selected">보통</option>
                      <option value="0">무관</option>
                    </select>
                  </td>
                </tr>
                <tr class="itemBox">
                  <td class="itemName" id="">스타일</td>
                  <td>
                    <label><input type="radio" name="style" value="귀여운">귀여운</label>
                    <label><input type="radio" name="style" value="지적인">지적인</label>
                    <label><input type="radio" name="style" value="섹시한">섹시한</label>
                    <label><input type="radio" name="style" value="따뜻한">따뜻한</label>
                    <label><input type="radio" name="style" value="우아한">우아한</label>
                    <label><input type="radio" name="style" value="터프한">터프한</label>
                  </td>
                  <td>
                    <select class="itemPriority" name="stylePri">
                      <option value="2">중요</option>
                      <option value="1" selected="selected">보통</option>
                      <option value="0">무관</option>
                    </select>
                  </td>
                </tr>
                <tr class="itemBox">
                  <td class="itemName" id="">나이(만)</td>
                  <td>
                    <label><input type="radio" name="age" value="-2">연하</label>
                    <label><input type="radio" name="age" value="-1">1~3년 연하</label>
                    <label><input type="radio" name="age" value="0">동갑</label>
                    <label><input type="radio" name="age" value="1">1~3년 연상</label>
                    <label><input type="radio" name="age" value="2">연상</label>
                  </td>
                  <td>
                    <select class="itemPriority" name="agePri">
                      <option value="2">중요</option>
                      <option value="1" selected="selected">보통</option>
                      <option value="0">무관</option>
                    </select>
                  </td>
                </tr>
                <tr class="itemBox">
                  <td class="itemName" id="">종교</td>
                  <td>
                    <label><input type="radio" name="religion" value="기독교">기독교</label>
                    <label><input type="radio" name="religion" value="천주교">천주교</label>
                    <label><input type="radio" name="religion" value="불교">불교</label>
                    <label><input type="radio" name="religion" value="무교">무교</label>
                    <label><input type="radio" name="religion" value="기타">기타</label>
                  </td>
                  <td>
                    <select class="itemPriority" name="religionPri">
                      <option value="2">중요</option>
                      <option value="1" selected="selected">보통</option>
                      <option value="0">무관</option>
                    </select>
                  </td>
                </tr>
                <tr class="itemBox">
                  <td class="itemName" id="">음주 습관</td>
                  <td>
                    <label><input type="radio" name="drink" value="3">주 3회</label>
                    <label><input type="radio" name="drink" value="2">주 1~2회</label>
                    <label><input type="radio" name="drink" value="1">월 1회</label>
                    <label><input type="radio" name="drink" value="0">안 마심</label>
                  </td>
                  <td>
                    <select class="itemPriority" name="drinkPri">
                      <option value="2">중요</option>
                      <option value="1" selected="selected">보통</option>
                      <option value="0">무관</option>
                    </select>
                  </td>
                </tr>
                <tr class="itemBox">
                  <td class="itemName" id="">흡연 여부</td>
                  <td>
                    <label><input type="radio" name="smoke" value="1">흡연</label>
                    <label><input type="radio" name="smoke" value="0">비흡연</label>
                  </td>
                  <td>
                    <select class="itemPriority" name="smokePri">
                      <option value="2">중요</option>
                      <option value="1" selected="selected">보통</option>
                      <option value="0">무관</option>
                    </select>
                  </td>
                </tr>
                <tr class="itemBox">
                  <td class="itemName" id="">직업</td>
                  <td>
                    <label><input type="radio" name="job" value="학생">학생</label>
                    <label><input type="radio" name="job" value="사무직">사무직</label>
                    <label><input type="radio" name="job" value="연구직">연구직</label>
                    <label><input type="radio" name="job" value="교육직">교육직</label>
                    <label><input type="radio" name="job" value="예술">예술</label>
                    <label><input type="radio" name="job" value="서비스">서비스</label>
                    <label><input type="radio" name="job" value="전문직">전문직</label>
                    <label><input type="radio" name="job" value="기타">기타</label>
                  </td>
                  <td>
                    <select class="itemPriority" name="jobPri">
                      <option value="2">중요</option>
                      <option value="1" selected="selected">보통</option>
                      <option value="0">무관</option>
                    </select>
                  </td>
                </tr>
                <tr class="itemBox">
                  <td class="itemName" id="">최종 학력</td>
                  <td>
                    <label><input type="radio" name="scholar" value="0">고등학교</label>
                    <label><input type="radio" name="scholar" value="2">전문대</label>
                    <label><input type="radio" name="scholar" value="4">대학교</label>
                    <label><input type="radio" name="scholar" value="6">대학원</label>
                    <label><input type="radio" name="scholar" value="8">박사</label>
                  </td>
                  <td>
                    <select class="itemPriority" name="scholarPri">
                      <option value="2">중요</option>
                      <option value="1" selected="selected">보통</option>
                      <option value="0">무관</option>
                    </select>
                  </td>
                </tr>
                <tr class="itemBox">
                  <td class="itemName" id="">거주 지역</td>
                  <td>
                    <label><input type="radio" name="region" value="11" disabled="disabled">서울</label>
                    <label><input type="radio" name="region" value="12" disabled="disabled">인천</label>
                    <label><input type="radio" name="region" value="13" disabled="disabled">경기</label>
                    <label><input type="radio" name="region" value="20" disabled="disabled">강원</label>
                    <label><input type="radio" name="region" value="31" disabled="disabled">충북</label>
                    <label><input type="radio" name="region" value="32" disabled="disabled">충남</label>
                    <label><input type="radio" name="region" value="33" disabled="disabled">대전</label>
                    <label><input type="radio" name="region" value="41" disabled="disabled">전북</label><br>
                    <label><input type="radio" name="region" value="42" disabled="disabled">전남</label>
                    <label><input type="radio" name="region" value="43" disabled="disabled">광주</label>
                    <label><input type="radio" name="region" value="51" disabled="disabled">경북</label>
                    <label><input type="radio" name="region" value="52" disabled="disabled">대구</label>
                    <label><input type="radio" name="region" value="53" disabled="disabled">경남</label>
                    <label><input type="radio" name="region" value="54" disabled="disabled">부산</label>
                    <label><input type="radio" name="region" value="55" disabled="disabled">울산</label>
                    <label><input type="radio" name="region" value="60" disabled="disabled">제주</label>
                  </td>
                  <td>
                    <select class="itemPriority" name="regionPri">
                      <option value="2">중요</option>
                      <option value="1" selected="selected">보통</option>
                      <option value="0">무관</option>
                    </select>
                  </td>
                </tr>
                <tr class="itemBox">
                  <td class="itemName" id="">관심 분야</td>
                  <td>
	                    <label><input type="checkbox" name="interest" value="movie"  	disabled="disabled"<%= check[0] %>>영화&드라마</label>
						<label><input type="checkbox" name="interest" value="musical"  	disabled="disabled"<%= check[1] %>>연극&뮤지컬</label>
						<label><input type="checkbox" name="interest" value="comic"  	disabled="disabled"<%= check[2] %>>만화&서브컬처</label>
						<label><input type="checkbox" name="interest" value="picture"  	disabled="disabled"<%= check[3] %>>사진&영상 촬영</label> 
						<label><input type="checkbox" name="interest" value="books"  	disabled="disabled"<%= check[4] %>>독서</label>
						<label><input type="checkbox" name="interest" value="music"  	disabled="disabled"<%= check[5] %>>음악 감상</label><br> 
						<label><input type="checkbox" name="interest" value="sing"  	disabled="disabled"<%= check[6] %>>노래&춤</label>
						<label><input type="checkbox" name="interest" value="instrument"disabled="disabled"<%= check[7] %>>악기 연주</label> 
						<label><input type="checkbox" name="interest" value="cook"  	disabled="disabled"<%= check[8] %>>요리&음식</label>
						<label><input type="checkbox" name="interest" value="camp"  	disabled="disabled"<%= check[9] %>>여행&캠핑</label> 
						<label><input type="checkbox" name="interest" value="exercise"  disabled="disabled"<%= check[10] %>>운동</label> 
						<label><input type="checkbox" name="interest" value="sports"  	disabled="disabled"<%= check[11] %>>스포츠 경기</label> 
						<label><input type="checkbox" name="interest" value="vgame" 	disabled="disabled"<%= check[12] %>>비디오 게임</label><br> 
						<label><input type="checkbox" name="interest" value="bgame"  	disabled="disabled"<%= check[13] %>>보드게임</label> 
						<label><input type="checkbox" name="interest" value="sns"  		disabled="disabled"<%= check[14] %>>SNS</label>
						<label><input type="checkbox" name="interest" value="drink"  	disabled="disabled"<%= check[15] %>>술&모임</label> 
						<label><input type="checkbox" name="interest" value="beauty"  	disabled="disabled"<%= check[16] %>>뷰티&패션</label> 
						<label><input type="checkbox" name="interest" value="pet"  		disabled="disabled"<%= check[17] %>>반려동물</label>
						<label><input type="checkbox" name="interest" value="diy"  		disabled="disabled"<%= check[18] %>>DIY</label> 
						<label><input type="checkbox" name="interest" value="money" 	disabled="disabled"<%= check[19] %>>재테크</label>
              		</td>
                  <td>
                    <select class="itemPriority" name="interestPri">
                      <option value="2">중요</option>
                      <option value="1" selected="selected">보통</option>
                      <option value="0">무관</option>
                    </select>
                  </td>
                </tr>
               </table> 
            </section>
            <section id="submit" style="text-align: center;">
				<button type="submit" id="joinBtn" class="defaultBtn" value="2단계">제출</button>
				<button type="reset" id="goMain" class="defaultBtn cancelBtn" onclick='location.href="<%= request.getContextPath() %>/views/common/mainmenu.jsp"'>취소</button>
            </section>
          </form>
        </section>
      </div>
    </div>
  </div>
  
<%@ include file="../common/footer.jsp" %>
</body>
</html>
 --%>