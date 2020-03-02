<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <title>내 정보 입력</title>
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
      display : inline-block;
      height : 30px;
      width : 175px;
      border : 1px solid silver;
      margin : 10px;
    }
    .itemName{
      margin : 10px 5px auto;
      width : 120px;
      height : 30px;
      font-size : 15pt;
      text-align: center;
    }
    .itemValue{
      text-align : right;
      margin : 5px  5px auto;
    }
  </style>
</head>
<body style="height:100%; margin:0 auto;">
  <div class ="outer">
    <div class="wrapper">
      <div class ="main">
        <section class="pageTitle">
          <label>내 정보 입력</label>
        </section>
        <section>
          <form action="<%= request.getContextPath() %>/insert.ui" method="post" enctype="multipart/form-data">
            <section id="itemProfile" style="display:flex">
              <article style="width: 400px; height: 250px;" >
				<img id='output' width="250" height="250"><br>
              	<input type='file' accept='image/*' onchange='openFile(event)' id="imgInput" name="profileImg">
              </article>
              <article id="hello" style="text-align:center; margin-left:30px;">
                <label>소갯말</label><br>
                <textarea style="width: 400px; height:150px; margin-top :15px; resize:none;" name="hello">
                </textarea>
              </article>
            </section>
            <section id="items">
              <table>
                <tr>
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
                </tr>
                <tr>
                  <td class="itemName" id="">체형</td>
                  <td>
                    <label><input type="radio" name="shape" value="마름">마름</label>
                    <label><input type="radio" name="shape" value="보통">보통</label>
                    <label><input type="radio" name="shape" value="통통">통통</label>
                    <label><input type="radio" name="shape" value="근육질">근육질</label>
                    <label><input type="radio" name="shape" value="글래머">글래머</label>
                  </td>
                </tr>
                <tr>
                  <td class="itemName" id="">스타일</td>
                  <td>
                    <label><input type="radio" name="style" value="귀여운">귀여운</label>
                    <label><input type="radio" name="style" value="지적인">지적인</label>
                    <label><input type="radio" name="style" value="섹시한">섹시한</label>
                    <label><input type="radio" name="style" value="따뜻한">따뜻한</label>
                    <label><input type="radio" name="style" value="우아한">우아한</label>
                    <label><input type="radio" name="style" value="터프한">터프한</label>
                  </td>
                </tr>
                <tr>
                  <td class="itemName" id="">종교</td>
                  <td>
                    <label><input type="radio" name="religion" value="기독교">기독교</label>
                    <label><input type="radio" name="religion" value="천주교">천주교</label>
                    <label><input type="radio" name="religion" value="불교">불교</label>
                    <label><input type="radio" name="religion" value="무교">무교</label>
                    <label><input type="radio" name="religion" value="기타">기타</label>
                  </td>
                </tr>
                <tr>
                  <td class="itemName" id="">음주 습관</td>
                  <td>
                    <label><input type="radio" name="drink" value="3">주 3회</label>
                    <label><input type="radio" name="drink" value="2">주 1~2회</label>
                    <label><input type="radio" name="drink" value="1">월 1회</label>
                    <label><input type="radio" name="drink" value="0">안 마심</label>
                  </td>
                </tr>
                <tr>
                  <td class="itemName" id="">흡연 여부</td>
                  <td>
                    <label><input type="radio" name="smoke" value="1">흡연</label>
                    <label><input type="radio" name="smoke" value="0">비흡연</label>
                  </td>
                </tr>
                <tr>
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
                </tr>
                <tr>
                  <td class="itemName" id="">최종 학력</td>
                  <td>
                    <label><input type="radio" name="scholar" value="0">고등학교</label>
                    <label><input type="radio" name="scholar" value="2">전문대</label>
                    <label><input type="radio" name="scholar" value="4">대학교</label>
                    <label><input type="radio" name="scholar" value="6">대학원</label>
                    <label><input type="radio" name="scholar" value="8">박사</label>
                  </td>
                </tr>
                <tr>
                  <td class="itemName" id="">거주 지역</td>
                  <td>
                    <label><input type="radio" name="region" value="11">서울</label>
                    <label><input type="radio" name="region" value="12">인천</label>
                    <label><input type="radio" name="region" value="13">경기</label>
                    <label><input type="radio" name="region" value="20">강원</label>
                    <label><input type="radio" name="region" value="31">충북</label>
                    <label><input type="radio" name="region" value="32">충남</label>
                    <label><input type="radio" name="region" value="33">대전</label>
                    <label><input type="radio" name="region" value="41">전북</label><br>
                    <label><input type="radio" name="region" value="42">전남</label>
                    <label><input type="radio" name="region" value="43">광주</label>
                    <label><input type="radio" name="region" value="51">경북</label>
                    <label><input type="radio" name="region" value="52">대구</label>
                    <label><input type="radio" name="region" value="53">경남</label>
                    <label><input type="radio" name="region" value="54">부산</label>
                    <label><input type="radio" name="region" value="55">울산</label>
                    <label><input type="radio" name="region" value="60">제주</label>
                  </td>
                </tr>
                <tr>
                  <td class="itemName" id="">관심 분야</td>
                  <td>
                    <label><input type="checkbox" name="interest" value="movie" >영화&드라마</label>
                    <label><input type="checkbox" name="interest" value="musical" >연극&뮤지컬</label>
                    <label><input type="checkbox" name="interest" value="comic" >만화&서브컬처</label>
                    <label><input type="checkbox" name="interest" value="picture" >사진&영상 촬영</label>
                    <label><input type="checkbox" name="interest" value="books" >독서</label>
                    <label><input type="checkbox" name="interest" value="music" >음악 감상</label><br>
                    <label><input type="checkbox" name="interest" value="sing" >노래&춤</label>
                    <label><input type="checkbox" name="interest" value="instrument" >악기 연주</label>
                    <label><input type="checkbox" name="interest" value="cook" >요리&음식</label>
                    <label><input type="checkbox" name="interest" value="camp" >여행&캠핑</label>
                    <label><input type="checkbox" name="interest" value="exercise" >운동</label>
                    <label><input type="checkbox" name="interest" value="sports" >스포츠 경기</label>
                    <label><input type="checkbox" name="interest" value="vgame" >비디오 게임</label><br>
                    <label><input type="checkbox" name="interest" value="bgame" >보드게임</label>
                    <label><input type="checkbox" name="interest" value="sns" >SNS</label>
                    <label><input type="checkbox" name="interest" value="drink" >술&모임</label>
                    <label><input type="checkbox" name="interest" value="beauty" >뷰티&패션</label>
                    <label><input type="checkbox" name="interest" value="pet" >반려동물</label>
                    <label><input type="checkbox" name="interest" value="diy" >DIY</label>
                    <label><input type="checkbox" name="interest" value="money" >재테크</label>
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
