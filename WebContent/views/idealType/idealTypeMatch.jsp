<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" 

import="account.model.vo.*"
import="account.model.service.*"
import="idealType.model.vo.*"
import="idealType.model.service.*"

%>
<%
	
	MatchService ms = new MatchService();
	UserService us = new UserService();
	
	int targetNo = ms.getMatchList(userNo)[matchNo].getTargetNo();
	
	Account ac = us.selectAccount(targetNo);
	UserInfo ui = us.selectUserInfo(targetNo); 
	
	String name = ac.getUserName();
		String nameVal = null;
		
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
		 
	 String[] interestVal = ui.getInterest(); // 가져온 배열

%>    
    
    
<!doctype html>
<html>
<head>
  <title>이상형 매칭</title>
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
    header {
      background-color: white;
      text-align:center;
      height:120px;
    }
    #logo{
      min-width : 175px;
      float:left;
    }
    ul, ol, li {
      list-style: none;
      margin:0;
      padding:0;
    }
    ul.mainMenu > li {
      display : inline-block;
      font-size :18pt;
      font-weight : 500;
      width: 130px;
      height: 35px;
      padding: 5px;
      padding-top: 10px;
      margin: 50px 0px -5px -6px;
      background-color: white;
      text-align: center;
      position:relative;
    }
    ul.mainMenu > li ul.subMenu{
      visibility: hidden;
      position:absolute;
      top:50px;
      left:0;
    }
    ul.mainMenu > li ul.subMenu > li{
      display : inline-block;
      font-size :14pt;
      font-weight : 400;
      width: 130px;
      margin: -3px 0px -5px 0px;
      padding: 5px;
      background-color: white;
      text-align: center;
    }
    ul.mainMenu > li:hover ul.subMenu > li{
      visibility :visible;
    }
    ul.mainMenu > li ul.subMenu > li:hover{
      color:slategray
    }
    #profile {
      text-align: right;
    }

    .outer{
      background-color: white;
      text-align: center;
      display:block;
    }
    nav{
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
    }
    .main{
      background-color: whites;
      text-align: left;
      max-width:1025px;
      min-height: 775px;
      margin:0 auto;
      padding: 0px;
      float : left;
      border-left: 1px solid darkgray;
    }
    .pageTitle{
      font-weight: 550;
      font-size: 16pt;
      margin: 30px;
    }
    section {padding: 15px;}
    footer {
      clear : left;
      background-color: gray;
      height: 120px;
      text-align: center;
    }
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
<body style="height:100%; margin:0 auto;">
  <header>
    <div class="wrapper">
      <div id="logo">
        <img src="logo.png" width="150px" height="120px" style="float:left;">
      </div>
      <div id="profile">
        <a href="">로그인</a>
        <a href="">회원 가입</a>
      </div>
      <div>
        <ul class="mainMenu">
          <li><a href="">이어드림</a>
            <ul class="subMenu">
              <li><a href="">회사 소개</a></li>
              <li><a href="">CEO 소개</a></li>
              <li><a href="">오시는 길</a></li>
            </ul>
          </li>
          <li><a href="">이상형 매칭</a>
            <ul class="subMenu">
              <li><a href="">이상형 추천</a></li>
              <li><a href="">이상형의<br>이상형 찾기</a></li>
            </ul>
          </li>
          <li><a href="">러브 파티</a>
            <ul class="subMenu">
              <li><a href="">러브 파티</a></li>
              <li><a href="">파티 후기</a></li>
            </ul>
          </li>
          <li><a href="">커플 이야기</a>
            <ul class="subMenu">
              <li><a href="">이달의 커플</a></li>
              <li><a href="">커플 후기</a></li>
            </ul>
          </li>
          <li><a href="">고객 문의</a>
            <ul class="subMenu">
              <li><a href="">1:1 문의</a></li>
              <li><a href="">FAQ</a></li>
            </ul>
          </li>
          <li><a href="">마이 페이지</a>
            <ul class="subMenu">
              <li><a href="">정회원 등업</a></li>
              <li><a href="">계정 정보</a></li>
              <li><a href="">나의 정보</a></li>
              <li><a href="">이상형 정보</a></li>
              <li><a href="">작성글 조회</a></li>
              <li><a href="">하트<br>히스토리</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </header>

  <div class ="outer">
    <div class="wrapper">
      <nav>
        <div  class="mainCategory">
          <a href="">이상형</a>
        </div>
        <div class="subCategory">
          <a href="">이상형 추천</a>
        </div>
        <div class="subCategory">
          <a href="">이상형의 이상형</a>
        </div>
      </nav>
      <div class="main">
        <section class="pageTitle">
          <label>이상형 추천</label>
        </section>
        <section id="summary" style="display: flex">
          <article id="sync" style="text-align: center; margin-left: 40%;">
            <label style="margin:10px;">일치율</label>
            <label>65%</label>
            <div class="graph">
                <strong class="bar" style="width: 65%;"></strong>
            </div>
          </article>
          <article id="listNo" style="margin-left: 30%;">
            <h3>1 / 5</h3>
          </article>
        </section>
        <section id="itemProfile" style="display: flex;">
          <article id="thumb" style="margin-left:50px;">
            <img width="250px" height="250px"></img>
          </article>
          <article id="hello" style="text-align:center; margin-left:30px;">
            <label>소갯말</label><br>
            <textarea style="width: 500px; height:200px; margin-top :15px; resize:none;;" readonly>
            
            </textarea>
          </article>
        </section>
        <section id="items">  
          <article>
            <div class="itemBox">
              <div class="itemName" id="">이름</div>
              <div class="itemValue" id="name"><%= nameVal %></div>
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
            
            <div class="itemBox">
                <div class="itemName" id="">관심분야</div>
                <div class="itemValue" id="interest1"><%=interestVal[0] %></div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">관심분야</div>
                <div class="itemValue" id="interest2"><%=interestVal[1] %></div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">관심분야</div>
                <div class="itemValue" id="interest3"><%=interestVal[2] %></div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">관심분야</div>
                <div class="itemValue" id="interest1"><%=interestVal[3] %></div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">관심분야</div>
                <div class="itemValue" id="interest1"><%=interestVal[4] %></div>
            </div>
			

        </article>
        </section>
        <section id="move" style="display:flex;">
          <div style="text-align:left">
            <image width="50px" height="100px"></image>
          </div>
          <div style="margin: 0 auto;">
            <image width="100px" height="100px"></image>
          </div>
          <div  style="text-align:right">
            <image width="50px" height="100px"></image>
          </div>
        </section>
      </div>
    </div>
  </div>

  <footer>
    <div class="wrapper" style="display:inline-block;">
      <div style="float:left; margin:20px;">
        <img src="logo.png" width="100px" height="80px">
      </div>
      <div style="margin:5px;">
        <p> 
          대표이사 박소현 | 사업자 111-11-111111 | TEL 02)0202-0202<br>
          본사 | 서울 특별시 연애하구 사랑동 행복로 잘되길 12-3<br>
          E-MAIL love_manager@naver.com<br>
          Copyright c 1998-2019 Couple Matching Service 
        </p>
      </div>
    </div>      
  </footer>
</body>
</html>
