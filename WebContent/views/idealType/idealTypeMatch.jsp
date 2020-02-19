<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    #bodyer{
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
    main{
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

  <div id ="bodyer">
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
      <main>
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
            <image width="250px" height="250px"></image>
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
              <div class="itemValue" id="name">고윤하</div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">나이</div>
                <div class="itemValue" id="age">31</div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">지역</div>
                <div class="itemValue" id="region">서울</div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">키</div>
                <div class="itemValue" id="height">155~160</div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">체형</div>
                <div class="itemValue" id="shape">보통</div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">스타일</div>
                <div class="itemValue" id="style">우아함</div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">직업</div>
                <div class="itemValue" id="job">예술</div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">종교</div>
                <div class="itemValue" id="religion">천주교</div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">학력</div>
                <div class="itemValue" id="scholar">대졸</div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">흡연</div>
                <div class="itemValue" id="smoke">안 핌</div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">음주</div>
                <div class="itemValue" id="drink">월 1회 이상</div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">관심분야</div>
                <div class="itemValue" id="interest">영화</div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">관심분야</div>
                <div class="itemValue" id="interest">음악</div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">관심분야</div>
                <div class="itemValue" id="interest">악기</div>
            </div>
            <div class="itemBox">
                <div class="itemName" id="">관심분야</div>
                <div class="itemValue" id="interest">외국어</div>
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
      </main>
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
