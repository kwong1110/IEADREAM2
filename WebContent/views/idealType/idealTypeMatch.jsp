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
	int matchNo = (int)request.getAttribute("matchNo");
	int maxMatchNo = (int)request.getAttribute("maxMatchNo");
	
	String back = null; String next = null;
	if (matchNo == 0){back="hidden";}
	if (matchNo == maxMatchNo){next="hidden";}
	
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
		case 1: sVal = "피움"; break;
		case 2: sVal = "안 피움"; break;
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
  <title>이상형 매칭</title>
  <meta charset="utf-8">
  <style>
    a:link { color: black; text-decoration: none}
    a:visited {color: black;}
    a:hover{ color : silver;}
    .graph { 
      position: relative;
      width: 200px; 
      border: 1px solid #B1D632; 
      font-size:11px;
      margin-bottom:3px;
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
        <section id="summary" style="display: flex">
          <article id="sync" style="text-align: center; margin-left: 40%;">
            <label style="margin:10px;">일치율</label>
            <label><%= sync %>%</label>
            <div class="graph">
                <strong class="bar" style="width: <%= sync %>%;"></strong>
            </div>
          </article>
          <article id="listNo" style="margin-left: 30%;">
            <h3><%= matchNo %> / <%= maxMatchNo %></h3>
          </article>
        </section>
       
        <section id="itemProfile" style="display: flex;">
        <table>
						 		<tr>
						 			<th>사진</th>
						 			<th style="text-align: center;">자기소개</th>
						 		</tr>
						 		<tr>
						 			<td>
						             	<article>
											<img src="<%= photoPath %>" id='output' style="width: 200px; height: 200px;">
						              	</article>
						 			</td>
						 			<td>
						              	<article id="hello" style="text-align:center; margin-left:30px;">
						                	<textarea style="width: 550px; height:200px; margin-top :15px; resize:none;" name="hello"><%= hello %></textarea>
						              	</article>
						 			</td>
						 		</tr>
						 	</table>
        </section>
        
        <section id="items">  
          <article>
            <div class="itemBox">
              <div class="itemName" id="">이름</div>
              <div class="itemValue" id="name"><%= name %></div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">나이</div>
                <div class="itemValue" id="age"><%= ageVal %></div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">키</div>
                <div class="itemValue" id="height"><%= hVal %></div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">체형</div>
                <div class="itemValue" id="shape"><%= shVal %></div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">스타일</div>
                <div class="itemValue" id="style"><%= stVal %></div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">지역</div>
                <div class="itemValue" id="region"><%= reVal %></div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">종교</div>
                <div class="itemValue" id="religion"><%= relVal %></div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">학력</div>
                <div class="itemValue" id="scholar"><%= scVal %></div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">직업</div>
                <div class="itemValue" id="job"><%= jVal %></div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">음주</div>
                <div class="itemValue" id="drink"><%= dVal %></div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">흡연</div>
                <div class="itemValue" id="smoke"><%= sVal %></div>
            </div>
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
            <div class="itemBox">
                <div class="itemName" id="">관심분야</div>
                <div class="itemValue" id="interest[<%= i %>]"><%= interestVal[i] %></div>
            </div>
			<% } %>
			
        </article>
        </section>
        <section id="move" style="display:flex;">
          <div style="text-align:left">
            <img src="<%= request.getContextPath() %>/images/common/back.png" width="50px" height="100px" hidden="<%= back%>" onclick="<%= request.getContextPath()%>/get.mc?matchNo=<%= matchNo -1 %>" ></img>
          </div>
          <div style="margin: 0 auto;">
            <img src="<%= request.getContextPath() %>/images/common/heart.png" width="100px" height="100px" onclick="<%= request.getContextPath()%>/sendHeart.mc?matchNo=<%= matchNo %>"></img>
          </div>
          <div  style="text-align:right">
            <img src="<%= request.getContextPath() %>/images/common/next.png" width="50px" height="100px" hidden="<%= next%>" onclick="<%= request.getContextPath()%>/get.mc?matchNo=<%= matchNo +1 %>"></img>
          </div>
        </section>
      </div>
    </div>
  </div>


<%@ include file="../common/footer.jsp" %>
</body>
</html>
