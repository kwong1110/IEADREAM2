<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
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

  <div id ="outer">
    <div class="wrapper">
      <div class ="main">
        <section class="pageTitle">
          <label>이상형 정보 입력</label>
        </section>
        <section>
          <form action="">
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
                  <td class="itemName" id="">체형</tdclass="itemName" id="">
                  <td>
                    <label><input type="radio" name="shape" value="slim">마름</label>
                    <label><input type="radio" name="shape" value="normal">보통</label>
                    <label><input type="radio" name="shape" value="chubby">통통</label>
                    <label><input type="radio" name="shape" value="muscular">근육질</label>
                    <label><input type="radio" name="shape" value="glamour">글래머</label>
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
                  <td class="itemName" id="">스타일</td class="itemName" id="">
                  <td>
                    <label><input type="radio" name="style" value="cute">귀여운</label>
                    <label><input type="radio" name="style" value="intellect">지적인</label>
                    <label><input type="radio" name="style" value="sexy">섹시한</label>
                    <label><input type="radio" name="style" value="warm">따뜻한</label>
                    <label><input type="radio" name="style" value="elegant">우아한</label>
                    <label><input type="radio" name="style" value="tough">터프한</label>
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
                  <td class="itemName" id="">종교</td class="itemName" id="">
                  <td>
                    <label><input type="radio" name="religion" value="christian">기독교</label>
                    <label><input type="radio" name="religion" value="catholic">천주교</label>
                    <label><input type="radio" name="religion" value="buddhism">불교</label>
                    <label><input type="radio" name="religion" value="none">무교</label>
                    <label><input type="radio" name="religion" value="etc">기타</label>
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
                  <td class="itemName" id="">음주 습관</td class="itemName" id="">
                  <td>
                    <label><input type="radio" name="drink" value="3">주 3회</label>
                    <label><input type="radio" name="drink" value="2">주 1회</label>
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
                  <td class="itemName" id="">흡연 여부</td class="itemName" id="">
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
                  <td class="itemName" id="">직업</td class="itemName" id="">
                  <td>
                    <label><input type="radio" name="job" value="student">학생</label>
                    <label><input type="radio" name="job" value="office">사무직</label>
                    <label><input type="radio" name="job" value="research">연구직</label>
                    <label><input type="radio" name="job" value="education">교육직</label>
                    <label><input type="radio" name="job" value="art">예술</label>
                    <label><input type="radio" name="job" value="service">서비스</label>
                    <label><input type="radio" name="job" value="profession">전문직</label>
                    <label><input type="radio" name="job" value="etc">기타</label>
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
                  <td class="itemName" id="">최종 학력</td class="itemName" id="">
                  <td>
                    <label><input type="radio" name="scholar" value="0">고졸</label>
                    <label><input type="radio" name="scholar" value="2">초대졸</label>
                    <label><input type="radio" name="scholar" value="4">대졸</label>
                    <label><input type="radio" name="scholar" value="6">석사</label>
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
                    <label><input type="checkbox" name="interest" value="movie" disabled="disabled">영화&드라마</label>
                    <label><input type="checkbox" name="interest" value="musical" disabled="disabled">연극&뮤지컬</label>
                    <label><input type="checkbox" name="interest" value="comic" disabled="disabled">만화&서브컬처</label>
                    <label><input type="checkbox" name="interest" value="picture" disabled="disabled">사진&영상 촬영</label>
                    <label><input type="checkbox" name="interest" value="books" disabled="disabled">독서</label>
                    <label><input type="checkbox" name="interest" value="music" disabled="disabled">음악 감상</label><br>
                    <label><input type="checkbox" name="interest" value="sing" disabled="disabled">노래&춤</label>
                    <label><input type="checkbox" name="interest" value="instrument" disabled="disabled">악기 연주</label>
                    <label><input type="checkbox" name="interest" value="cook" disabled="disabled">요리&음식</label>
                    <label><input type="checkbox" name="interest" value="camp" disabled="disabled">여행&캠핑</label>
                    <label><input type="checkbox" name="interest" value="exercise" disabled="disabled">운동</label>
                    <label><input type="checkbox" name="interest" value="sports" disabled="disabled">스포츠 경기</label>
                    <label><input type="checkbox" name="interest" value="vgame" disabled="disabled">비디오 게임</label><br>
                    <label><input type="checkbox" name="interest" value="bgame" disabled="disabled">보드게임</label>
                    <label><input type="checkbox" name="interest" value="sns" disabled="disabled">SNS</label>
                    <label><input type="checkbox" name="interest" value="drink" disabled="disabled">술&모임</label>
                    <label><input type="checkbox" name="interest" value="beauty" disabled="disabled">뷰티&패션</label>
                    <label><input type="checkbox" name="interest" value="pet" disabled="disabled">반려동물</label>
                    <label><input type="checkbox" name="interest" value="diy" disabled="disabled">DIY</label>
                    <label><input type="checkbox" name="interest" value="money" disabled="disabled">재테크</label>
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
              <input type="submit" value="제출" style="font-size: 18px; padding:5px 40px;">
            </section>
          </form>
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
