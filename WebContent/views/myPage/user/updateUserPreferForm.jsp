<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="account.model.vo.*"%>
<%
	UserInfo ui = (UserInfo)request.getAttribute("ui");
	UserPrefer up = (UserPrefer)request.getAttribute("up");

	int userNo = up.getUserNo();
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
	int heightPri = up.getHeightPri();
		String hp1 = null; String hp2 = null; String hp3 = null;
		switch(heightPri) {
		case 2: hp1 = "checked"; break;
		case 1: hp2 = "checked"; break;
		case 0: hp3 = "checked"; break;
		}
		
	String shape = up.getShape();
		String sh1 = null; String sh2 = null; String sh3 = null;
		String sh4 = null; String sh5 = null;
		switch(shape) {
		case "마름": sh1 = "checked"; break;
		case "보통": sh2 = "checked"; break;
		case "통통": sh3 = "checked"; break;
		case "근육질": sh4 = "checked"; break;
		case "글래머": sh5 = "checked"; break;
		}
	int shapePri = up.getShapePri();
		String shp1 = null; String shp2 = null; String shp3 = null;
		switch(shapePri) {
		case 2: shp1 = "checked"; break;
		case 1: shp2 = "checked"; break;
		case 0: shp3 = "checked"; break;
		}
		
	String style = up.getStyle();
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
	int stylePri = up.getStylePri();
		String stp1 = null; String stp2 = null; String stp3 = null;
		switch(stylePri) {
		case 2: stp1 = "checked"; break;
		case 1: stp2 = "checked"; break;
		case 0: stp3 = "checked"; break;
		}	
	int age = up.getAge();
		String ag1 = null; String ag2 = null; String ag3 = null;
		String ag4 = null; String ag5 = null; String ag6 = null;
		switch(age) {
		case -2: ag1 = "checked"; break;
		case -1: ag2 = "checked"; break;
		case 0: ag3 = "checked"; break;
		case 1: ag4 = "checked"; break;
		case 2: ag5 = "checked"; break;
		}
	int agePri = up.getAgePri();
		String agp1 = null; String agp2 = null; String agp3 = null;
		switch(agePri) {
		case 2: agp1 = "checked"; break;
		case 1: agp2 = "checked"; break;
		case 0: agp3 = "checked"; break;
		}
		
	String religion = up.getReligion();
		String rel1 = null; String rel2 = null;	String rel3 = null;
		String rel4 = null; String rel5 = null;
		switch(religion) {
		case "기독교": rel1 = "checked"; break;
		case "천주교": rel2 = "checked"; break;
		case "불교": rel3 = "checked"; break;
		case "무교": rel4 = "checked"; break;
		case "기타": rel5 = "checked"; break; 
		}
	int religionPri = up.getReligionPri();
		String relp1 = null; String relp2 = null; String relp3 = null;
		switch(religionPri) {
		case 2: relp1 = "checked"; break;
		case 1: relp2 = "checked"; break;
		case 0: relp3 = "checked"; break;
		}
		
	int drink = up.getDrink();
		String d3 = null; String d2 = null; String d1 = null; String d0 = null;
		switch(drink) {
		case 3: d3 = "checked"; break;
		case 2: d2 = "checked"; break;
		case 1: d1 = "checked"; break;
		case 0: d0 = "checked"; break;
		}
	int drinkPri = up.getDrinkPri();
		String dp1 = null; String dp2 = null; String dp3 = null;
		switch(drinkPri) {
		case 2: dp1 = "checked"; break;
		case 1: dp2 = "checked"; break;
		case 0: dp3 = "checked"; break;
		}
		
	int smoke = up.getSmoke();
		String s1 = null; String s0 = null;
		switch(smoke) {
		case 1: s1 = "checked"; break;
		case 2: s0 = "checked"; break;
		}
	int smokePri = up.getSmokePri();
		String sp1 = null; String sp2 = null; String sp3 = null;
		switch(smokePri) {
		case 2: sp1 = "checked"; break;
		case 1: sp2 = "checked"; break;
		case 0: sp3 = "checked"; break;
		}
		
	String job = up.getJob();
		String j1 = null; String j2 = null; String j3 = null; String j4 = null;
		String j5 = null; String j6 = null; String j7 = null; String j8 = null;
		switch(job) {
		case "학생": j1 = "checked"; break;
		case "사무직": j2 = "checked"; break;
		case "연구직": j3 = "checked"; break;
		case "교육직": j4 = "checked"; break;
		case "예술": j5 = "checked"; break;
		case "서비스": j6 = "checked"; break;
		case "전문직": j7 = "checked"; break;
		case "기타": j8 = "checked"; break;
		}
	int jobPri = up.getJobPri();
		String jp1 = null; String jp2 = null; String jp3 = null;
		switch(jobPri) {
		case 2: jp1 = "checked"; break;
		case 1: jp2 = "checked"; break;
		case 0: jp3 = "checked"; break;
		}
		
	int scholar = up.getScholar();
		String sc1 = null; String sc2 = null; String sc3 = null; String sc4 = null; String sc5 = null;
		switch(scholar) {
		case 0: sc1 = "checked"; break;
		case 2: sc2 = "checked"; break;
		case 4: sc3 = "checked"; break;
		case 6: sc4 = "checked"; break;
		case 8: sc5 = "checked"; break;
		}
	int scholarPri = up.getScholarPri();
		String scp1 = null; String scp2 = null; String scp3 = null;
		switch(scholarPri) {
		case 2: scp1 = "checked"; break;
		case 1: scp2 = "checked"; break;
		case 0: scp3 = "checked"; break;
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
	int regionPri = up.getRegionPri();
			String rep1 = null; String rep2 = null; String rep3 = null;
			switch(regionPri) {
			case 2: rep1 = "checked"; break;
			case 1: rep2 = "checked"; break;
			case 0: rep3 = "checked"; break;
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
	 }
	int interestPri = up.getInterestPri();
		String ip1 = null; String ip2 = null; String ip3 = null;
		switch(interestPri) {
		case 2: ip1 = "checked"; break;
		case 1: ip2 = "checked"; break;
		case 0: ip3 = "checked"; break;
		}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp" %>

	 <div id ="outer">
    <div class="wrapper">
      <div class ="main">
        <section class="pageTitle">
          <label>이상형 정보 입력</label>
        </section>
        <section>
          <form action="<%= request.getContextPath() %>/update.up" method="post">
            <section id="items">
              <table>
                <tr>
					<td><input type="hidden" name="userNo" id="userNo" value="<%= userNo %>"></td>
					<td class="itemName" id="">키 (cm)</td>
					<td><label><input type="radio" name="height" value="150" <%= h1 %>>155이하</label> 
						<label><input type="radio" name="height" value="155" <%= h2 %>>155~160</label>
						<label><input type="radio" name="height" value="160" <%= h3 %>>160~165</label>
						<label><input type="radio" name="height" value="165" <%= h4 %>>165~170</label>
						<label><input type="radio" name="height" value="170" <%= h5 %>>170~175</label>
						<label><input type="radio" name="height" value="175" <%= h6 %>>175~180</label>
						<label><input type="radio" name="height" value="180" <%= h7 %>>180~185</label>
						<label><input type="radio" name="height" value="185" <%= h8 %>>185 이상</label>
					</td>
	                <td>
	                    <select class="itemPriority" name="smokePri">
	                      <option value="2" <%= hp1%>>중요</option>
	                      <option value="1" <%= hp2%>>보통</option>
	                      <option value="0" <%= hp3%>>무관</option>
	                    </select>
	                </td>
				</tr>
				<tr>
					<td class="itemName" id="">체형</td>
					<td><label><input type="radio" name="shape" value="마름" <%= sh1 %>>마름</label>
						<label><input type="radio" name="shape" value="보통" <%= sh2 %>>보통</label>
						<label><input type="radio" name="shape" value="통통" <%= sh3 %>>통통</label>
						<label><input type="radio" name="shape" value="근육질" <%= sh4 %>>근육질</label>
						<label><input type="radio" name="shape" value="글래머" <%= sh5 %>>글래머</label>
					</td>
	                <td>
                    <select class="itemPriority" name="smokePri">
                      <option value="2" <%= shp1%>>중요</option>
                      <option value="1" <%= shp2%>>보통</option>
                      <option value="0" <%= shp3%>>무관</option>
                    </select>
	                </td>
				</tr>
				<tr>
					<td class="itemName" id="">스타일</td>
					<td><label><input type="radio" name="style" value="귀여운" <%= st1 %>>귀여운</label> 
						<label><input type="radio" name="style" value="지적인" <%= st2 %>>지적인</label>
						<label><input type="radio" name="style" value="섹시한" <%= st3 %>>섹시한</label> 
						<label><input type="radio" name="style" value="따뜻한" <%= st4 %>>따뜻한</label> 
						<label><input type="radio" name="style" value="우아한" <%= st5 %>>우아한</label>
						<label><input type="radio" name="style" value="터프한" <%= st6 %>>터프한</label>
					</td>
	                <td>
                    <select class="itemPriority" name="smokePri">
                      <option value="2" <%= stp1%>>중요</option>
                      <option value="1" <%= stp2%>>보통</option>
                      <option value="0" <%= stp3%>>무관</option>
                    </select>
	                </td>
				</tr>
                <tr class="itemBox">
                  <td class="itemName" id="">나이(만)</td>
                  <td>
                    <label><input type="radio" name="age" value="-2" <%= ag1 %>>연하</label>
                    <label><input type="radio" name="age" value="-1" <%= ag2 %>>1~3년 연하</label>
                    <label><input type="radio" name="age" value="0" <%= ag3 %>>동갑</label>
                    <label><input type="radio" name="age" value="1" <%= ag4 %>>1~3년 연상</label>
                    <label><input type="radio" name="age" value="2" <%= ag5 %>>연상</label>
                  </td>
                  <td>
                    <select class="itemPriority" name="smokePri">
                      <option value="2" <%= agp1%>>중요</option>
                      <option value="1" <%= agp2%>>보통</option>
                      <option value="0" <%= agp3%>>무관</option>
                    </select>
                  </td>
                </tr>
                <tr class="itemBox">
                  <td class="itemName" id="">종교</td>
                  	<td>
						<label><input type="radio" name="religion" value="기독교" <%=rel1%>>기독교</label> 
						<label><input type="radio" name="religion" value="천주교" <%=rel2%>>천주교</label>
						<label><input type="radio" name="religion" value="불교" <%=rel3%>>불교</label>
						<label><input type="radio" name="religion" value="무교" <%=rel4%>>무교</label>
						<label><input type="radio" name="religion" value="기타" <%=rel5%>>기타</label>
					</td>
				`	<td>
	                    <select class="itemPriority" name="smokePri">
	                      <option value="2" <%= relp1%>>중요</option>
	                      <option value="1" <%= relp2%>>보통</option>
	                      <option value="0" <%= relp3%>>무관</option>
	                    </select>
                	</td>
                </tr>
                <tr class="itemBox">
                	<td class="itemName" id="">음주 습관</td>
					<td class="itemName" id="">음주 습관</td>
					<td>
						<label><input type="radio" name="drink" value="3" <%= d3 %>>주 3회</label> 
						<label><input type="radio" name="drink" value="2" <%= d2 %>>주 1~2회</label> 
						<label><input type="radio" name="drink" value="1" <%= d1 %>>월 1회</label> 
						<label><input type="radio" name="drink" value="0" <%= d0 %>>안 마심</label>
					</td>
                  <td>
                    <select class="itemPriority" name="drinkPri">
                      <option value="2" <%= dp1%>>중요</option>
                      <option value="1" <%= dp2%>>보통</option>
                      <option value="0" <%= dp3%>>무관</option>
                    </select>
                    </select>
                  </td>
                </tr>
                <tr class="itemBox">
					<td class="itemName" id="">흡연 여부</td>
					<td>
						<label><input type="radio" name="smoke" value="1" <%= s1 %>>흡연</label> 
						<label><input type="radio" name="smoke" value="0" <%= s0 %>>비흡연</label>
					</td>
                  <td>
                    <select class="itemPriority" name="smokePri">
                      <option value="2" <%= sp1%>>중요</option>
                      <option value="1" <%= sp2%>>보통</option>
                      <option value="0" <%= sp3%>>무관</option>
                    </select>
                  </td>
                </tr>
                <tr class="itemBox">
                	<td class="itemName" id="">직업</td>
                 	<td>
						<label><input type="radio" name="job" value="학생" <%= j1 %>>학생</label> 
						<label><input type="radio" name="job" value="사무직" <%= j2 %>>사무직</label>
						<label><input type="radio" name="job" value="연구직" <%= j3 %>>연구직</label>
						<label><input type="radio" name="job" value="교육직" <%= j4 %>>교육직</label> 
						<label><input type="radio" name="job" value="예술" <%= j5 %>>예술</label> 
						<label><input type="radio" name="job" value="서비스" <%= j6 %>>서비스</label>
						<label><input type="radio" name="job" value="전문직" <%= j7 %>>전문직</label> 
						<label><input type="radio" name="job" value="기타" <%= j8 %>>기타</label>
					</td>
                  	<td>
                    <select class="itemPriority" name="jobPri">
                      <option value="2" <%= jp1%>>중요</option>
                      <option value="1" <%= jp2%>>보통</option>
                      <option value="0" <%= jp3%>>무관</option>
                    </select>
                  </td>
                </tr>
                <tr class="itemBox">
                  	<td class="itemName" id="">최종 학력</td class="itemName" id="">
                  	<td>
						<label><input type="radio" name="scholar" value="0" <%= sc1 %>>고졸</label>
						<label><input type="radio" name="scholar" value="2" <%= sc2 %>>초대졸</label>
						<label><input type="radio" name="scholar" value="4" <%= sc3 %>>대졸</label> 
						<label><input type="radio" name="scholar" value="6" <%= sc4 %>>석사</label> 
						<label><input type="radio" name="scholar" value="8" <%= sc5 %>>박사</label>
					</td>
                 	<td>
                    	<select class="itemPriority" name="scholarPri">
	                      <option value="2" <%= scp1%>>중요</option>
	                      <option value="1" <%= scp2%>>보통</option>
	                      <option value="0" <%= scp3%>>무관</option>
                   	 	</select>
                  	</td>
                </tr>
                <tr class="itemBox">
                  <td class="itemName" id="">거주 지역</td>
                  <td>
                    <label><input type="radio" name="region"value="11"   disabled="disabled"<%= re11 %>>서울</label> 
					<label><input type="radio" name="region" value="12"  disabled="disabled"<%= re12 %>>인천</label>
					<label><input type="radio" name="region" value="13"  disabled="disabled"<%= re13 %>>경기</label> 
					<label><input type="radio" name="region" value="20"  disabled="disabled"<%= re20 %>>강원</label> 
					<label><input type="radio" name="region" value="31"  disabled="disabled"<%= re31 %>>충북</label>
					<label><input type="radio" name="region" value="32"  disabled="disabled"<%= re32 %>>충남</label> 
					<label><input type="radio" name="region" value="33"  disabled="disabled"<%= re33 %>>대전</label> 
					<label><input type="radio" name="region" value="41"  disabled="disabled"<%= re41 %>>전북</label><br>
					<label><input type="radio" name="region" value="42"  disabled="disabled"<%= re42 %>>전남</label>
					<label><input type="radio" name="region" value="43"  disabled="disabled"<%= re43 %>>광주</label> 
					<label><input type="radio" name="region" value="51"  disabled="disabled"<%= re51 %>>경북</label>
					<label><input type="radio" name="region" value="52"  disabled="disabled"<%= re52 %>>대구</label> 
					<label><input type="radio" name="region" value="53"  disabled="disabled"<%= re53 %>>경남</label> 
					<label><input type="radio" name="region" value="54"  disabled="disabled"<%= re54 %>>부산</label>
					<label><input type="radio" name="region" value="55"  disabled="disabled"<%= re55 %>>울산</label> 
					<label><input type="radio" name="region" value="60"  disabled="disabled"<%= re60 %>>제주</label>
                  </td>
                  <td>
                    <select class="itemPriority" name="regionPri">
                      <option value="2" <%= rep1%>>중요</option>
                      <option value="1" <%= rep2%>>보통</option>
                      <option value="0" <%= rep3%>>무관</option>
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
                      <option value="2" <%= ip1%>>중요</option>
                      <option value="1" <%= ip2%>>보통</option>
                      <option value="0" <%= ip3%>>무관</option>
                    </select>
                  </td>
                </tr>
               </table> 
            </section>
            <section id="submit" style="text-align: center;">
              <input type="submit" value="제출" style="font-size: 18px; padding:5px 40px;">
            </section>
          </form>
        </section>
      </div>
    </div>
  </div>
</body>
</html>