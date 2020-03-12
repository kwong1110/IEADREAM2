<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" 

import="account.model.vo.*"
import="account.model.service.*"
import="idealType.model.vo.*"
import="idealType.model.service.*"

%>
<%

	Account ac = new Account();
	ac = (Account)request.getAttribute("ta");
	UserInfo ui = new UserInfo();
	ui = (UserInfo)request.getAttribute("ti");	
	String photoPath = (String)request.getAttribute("pPath");
	int sync = (int)request.getAttribute("sync");
	int maxMatchNo = (int)request.getAttribute("maxMatchNo");
	UserPhoto p = (UserPhoto)request.getAttribute("p");
	
	String back = null; String next = null;
	
	String name = ac.getUserName();
	String hello = ui.getHello();
	
	int height = ui.getHeight();
		String hVal = null;
		switch(height) {
		case 150: hVal = "155 이하"; break;
		case 155: hVal = "155~160"; break;
		case 160: hVal = "160~165"; break;
		case 165: hVal = "165~170"; break;
		case 170: hVal = "170~175"; break;
		case 175: hVal = "175~180"; break;
		case 180: hVal = "180~185"; break;
		case 185: hVal = "185 이상"; break;
		}
		
	String shape = ui.getShape();
		String shVal = null; 
		switch(shape) {
		case "마름": shVal = "마름"; break;
		case "보통": shVal = "보통"; break;
		case "통통": shVal = "통통"; break;
		case "근육질": shVal = "근육질"; break;
		case "글래머": shVal = "글래머"; break;
		}
		
	String style = ui.getStyle();
		String stVal = null;
		switch(style) {
		case "귀여운": stVal = "귀여운"; break;
		case "지적인": stVal = "지적인"; break;
		case "섹시한": stVal = "섹시한"; break;
		case "따뜻한": stVal = "따뜻한"; break;
		case "우아한": stVal = "우아한"; break;
		case "터프한": stVal = "터프한"; break;
		}
	
	int age = ui.getAge();
		String ageVal = "만 " + ui.getAge() + "세";
		
	String religion = ui.getReligion();
		String relVal = null;
		switch(religion) {
		case "기독교": relVal = "기독교"; break;
		case "천주교": relVal = "천주교"; break;
		case "불교": relVal = "불교"; break;
		case "무교": relVal = "무교"; break;
		case "기타": relVal = "기타"; break; 
		}
		
	int drink = ui.getDrink();
		String dVal = null;
		switch(drink) {
		case 3: dVal = "주 3회 이상"; break;
		case 2: dVal = "주 1~2회"; break;
		case 1: dVal = "월 1회"; break;
		case 0: dVal = "안 마심"; break;
		}
		
	int smoke = ui.getSmoke();
		String sVal = null;
		switch(smoke) {
		case 0: sVal = "피움"; break;
		case 1: sVal = "안 피움"; break;
		}
		
	String job = ui.getJob();
		String jVal = null;
		switch(job) {
		case "학생": jVal = "학생"; break;
		case "사무직": jVal = "사무직"; break;
		case "연구직": jVal = "연구직"; break;
		case "교육직": jVal = "교육직"; break;
		case "예술": jVal = "예술"; break;
		case "서비스": jVal = "서비스"; break;
		case "전문직": jVal = "전문직"; break;
		case "기타": jVal = "기타"; break;
		}
		
	int scholar = ui.getScholar();
		String scVal = null;
		switch(scholar) {
		case 0: scVal = "고졸"; break;
		case 2: scVal = "초대졸"; break;
		case 4: scVal = "대졸"; break;
		case 6: scVal = "석사"; break;
		case 8: scVal = "박사"; break;
		}
		
	int region = ui.getRegion();
		String reVal = null;
		 switch(region) {
		 case 11: reVal = "서울"; break;
		 case 12: reVal = "인천"; break;
		 case 13: reVal = "경기"; break;
		 case 20: reVal = "강원"; break;
		 case 31: reVal = "충북"; break;
		 case 32: reVal = "충남"; break;
		 case 33: reVal = "대전"; break;
		 case 41: reVal = "전북"; break;
		 case 42: reVal = "전남"; break;
		 case 43: reVal = "광주"; break;
		 case 51: reVal = "경북"; break;
		 case 52: reVal = "대구"; break;
		 case 53: reVal = "경남"; break;
		 case 54: reVal = "부산"; break;
		 case 55: reVal = "울산"; break;
		 case 60: reVal = "제주"; break;
		 }
		 
	 String[] interestList = ui.getInterest();

%>    
    
    
<!doctype html>
<html>
<head>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board.css">
  <title>이상형 매칭</title>
  <meta charset="utf-8">
  <style>
    a:link { color: black; text-decoration: none}
    a:visited {color: black;}
    a:hover{ color : silver;}
    .outer{
    	min-height = 800px;
    }
    .graph { 
      position: relative;
      width: 200px; 
      border: 1px solid #B1D632; 
      font-size:11px;
      margin-bottom:5%;
      border-radius: 25px 25px;
    }
    .graph .bar { 
      display: block;
      position: relative;
      background: #B1D632; 
      text-align: center; 
      color: #333; 
      height: 1em; 
      line-height: 2em;    
      border-radius: 25px 25px;        
    }
    .graph .bar span { position: absolute; left: 1em; }
    #items{margin-left : 40px;}
    .itemBox{
      display : inline-block;
      height : 30px;
      width : 175px;
      border : 1px solid silver;
      margin : 10px;
    }
    .itemName{
      float : left;
      margin : 5px 5px auto;
    }
    .itemValue{
      text-align : right;
      margin : 5px  5px auto;
    }
    
    .img{
    	width: 50%;
    	height: 50%;
    }
    
    .pageTitle{
    	margin-bottom: 30px;
    }
  </style>
</head>
<body>
	<%@ include file="../common/mainmenu.jsp" %>
  <div class ="outer">
    <div class="wrapper">
      <div class="main">
		<div class="pageTitle">
			<h1> 이상형 추천 </h1>
		</div>
        <section id="summary" style="display: flex;">
          <article id="sync" style="text-align: center; margin-left: 40%;">
            <label style="margin:5%;">일치율</label>
            <label><%= sync %>%</label>
            <div class="graph">
                <strong class="bar" style="width: <%= sync %>%; font-size: 15px;"></strong>
            </div>
          </article>
          <article id="listNo" style="margin-left: 30%; font-size: 13px;" >
            <h3>1 / <%= maxMatchNo %></h3>
          </article>
        </section>       
        <table>
		 	<tr>
	 			<th>사진</th>
	 			<th style="text-align: center;">자기소개</th>
		 	</tr>
		 	<tr>
	 		<td>
             	<article>
					<img src="<%= request.getContextPath() %>/photo_uploadFiles/<%= p.getChangeName() %>" id='output' style="width: 200px; height: 200px;">
              	</article>
	 		</td>
	 		<td>
              	<article id="hello" style="text-align:center; margin-left:30px;">
                	<textarea style="width: 550px; height:200px; margin-top :15px; resize:none;" name="hello" readonly><%= hello %></textarea>
              	</article>
 			</td>
	 		</tr>
	 	</table>
        <table class="mainBoard" id="boManageForm">
        	<tbody>
        	<tr>
        		<th>이름</th>
        		<td><%= name %></td>
        		<th>나이</th>
        		<td><%= ageVal %></td>
        		<th>키</th>
        		<td><%= hVal %></td>
        		<th>체형</th>
        		<td><%= shVal %></td>
        	</tr>
        	<tr>
        		<th>스타일</th>
        		<td><%= stVal %></td>
        		<th>지역</th>
        		<td><%= reVal %></td>
        		<th>종교</th>
        		<td><%= relVal %></td>
        		<th>학력</th>
        		<td><%= scVal %></td>
        	</tr>
        	<tr>
        		<th>직업</th>
        		<td><%= jVal %></td>
        		<th>음주</th>
        		<td><%= dVal %></td>
        		<th>흡연</th>
        		<td><%= sVal %></td>
        		<th>회원번호</th>
        		<td><%= ac.getUserNo() %></td>
        	</tr>
        	<tr>
        	<th>관심분야</th>
			<%
			String[] interestVal = new String[interestList.length];
			for(int i = 0; i < interestList.length; i++){
				switch(interestList[i]){
				case "movie": interestVal[i] = "영화&드라마"; break;
				case "musical": interestVal[i] = "연극&뮤지컬"; break;
				case "comic": interestVal[i] = "만화&서브컬처"; break;
				case "picture": interestVal[i] = "사진&영상 촬영"; break;
				case "books": interestVal[i] = "독서"; break;
				case "music": interestVal[i] = "음악 감상"; break;
				case "sing": interestVal[i] = "노래&춤"; break;
				case "instrument": interestVal[i] = "악기 연주"; break;
				case "cook": interestVal[i] = "요리&음식"; break;
				case "camp": interestVal[i] = "여행&캠핑"; break;
				case "exercise": interestVal[i] = "운동"; break;
				case "sports": interestVal[i] = "스포츠 경기"; break;
				case "vgame": interestVal[i] = "비디오 게임"; break;
				case "bgame": interestVal[i] = "보드게임"; break;
				case "sns": interestVal[i] = "SNS"; break;
				case "drink": interestVal[i] = "술&모임"; break;
				case "beauty": interestVal[i] = "뷰티&패션"; break;
				case "pet": interestVal[i] = "반려동물"; break;
				case "diy": interestVal[i] = "DIY"; break;
				case "money": interestVal[i] = "재테크"; break;
				
				}
				
			%>
            <td><%= interestVal[i] %><td>
			<% } %>
			</tbody>
        </table>
        <section id="move" style="display:flex; margin: 5%; text-align: center; 
	vertical-align: middle;">
          <div style="margin: 0 auto; width: 100px; height:100px;">
          	<a href="<%= request.getContextPath()%>/sendHeart.mc">
            <img src="<%= request.getContextPath() %>/images/common/heart.png">
            </a>
          </div>
          <div  style="margin: 0 auto; text-align:right; width: 100px; height:100px;">
          	<a href="<%= request.getContextPath()%>/disband.mc">
            <img src="<%= request.getContextPath() %>/images/common/next.png" hidden="<%= next%>">
            </a>
          </div>
        </section>
      </div>
    </div>
  </div>

<%@ include file="../common/footer.jsp" %>
</body>
</html>
