<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int userNo = (int)request.getAttribute("userNo");

%>    
    
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <title>내 정보 입력</title>
  <meta charset="utf-8">
  <style>
/*     a:link { color: black; text-decoration: none}
    a:visited {color: black;}
    a:hover{ color : silver;} */
   /*  .wrapper{
      text-align: left;
      width: 1000px;
      margin:0 auto;
      padding:0;
      display : block;
    } */
  /*   .outer{
      background-color: white;
      text-align: center;
      display:block;
    } */
   /*  .main{
      background-color: whites;
      text-align: left;
      max-width:1200px;
      min-height: 775px;
      margin:0 auto;
      padding:0;
    /*  border-left: 1px solid darkgray; */
    } */
   /*  .pageTitle{
      font-weight: 550;
      font-size: 16pt;
      margin: 30px;
    } */
    
  /*   footer {
      clear : left;
      background-color: gray;
      height: 120px;
      text-align: center;
    } */
    /* #itemProfile, #items{
      margin-left : 15%;
    } */
    
    section {
      padding: 15px;
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
      font-size : 15pt;
      text-align: center;
    vertical-align: middle;
    height: 50px;
    }
    .itemValue{
      text-align : right;
      margin : 5px  5px auto;
    }
/*     infoTable tr{
    	border-top: 1px solid rgb(136,136,136);
    }
    infoTable tr td{
   	 	vertical-align: middle;
		border-bottom:1px solid rgb(224, 224, 224); /* 하단라인색 */
    }
  /*   infoTable tr td label{
   	 	    margin-left: 15px;
   	 	        vertical-align: middle;
    } */
    #output{
    width: 300px;
    height:200px;
    border-radius: 5px;
    border: 1px solid lightgray;
    }
    input[type=checkbox], input[type=radio]{
    	cursor:pointer;
    }
     .outer{
      height:1000px;
      }
      
   
	#info{
		width: 400px; 
		height:200px; 
		border:1px solid lightgray; 
		border-radius: 5px;
		margin-top :15px;
		font-size: 15px;
		resize:none;
		font-family: 'LotteMartHappy'; 
	}
	
	.tableArea th {/* 게시판제목라인 */
		padding:12px 0;
		color:rgb(230, 141, 150); font-size:20px;/* 제목글자크기 */ 
		letter-spacing:0.1em;
		padding: 5px;
		text-align: left;}/* 제목띠어쓰기간격 */ 
	.tableArea td {/* 게시판제목라인 */
		padding:12px 0;
		border-top:1px solid rgb(224, 224, 224); /* 상단라인색 */
		color:black font-size:1em;/* 제목글자크기 */ 
		letter-spacing:0.1em;
		line-height: 30px;}/* 제목띠어쓰기간격 */ 
  </style>
</head>
<body>
	<%@ include file="../common/mainmenu.jsp" %>
  <div class ="outer">
    <div class="wrapper">
      <div class ="main">
        <div class="pageTitle">
          <h2>내 정보 입력</h2>
        </div>
        <section>
          <form action="<%= request.getContextPath() %>/insert.ui" method="post" enctype="multipart/form-data">
    		<table class="tableArea">
    			<tr>
    				<th width="100px">프로필 사진</th>
    				<th>자기소개</th>
    			</tr>
    			<tr>
    				<td>
    					<img id="output" style="width: 300px;height: 200px;margin-right: 130px;">
    				</td>
    				<td>
    					<textarea id="info" name="hello" placeholder="자신을 소개할 멘트를 적어주세요"></textarea>
    				</td>
    			</tr>
    			<tr>
    				<td colspan="2"><input type='file' accept='image/*' onchange='openFile(event)' id="imgInput" name="profileImg"></td>
    			</tr>
    		</table>      
            <section id="items">
            <input type="number" name="userNo" hidden="hidden" value="<%= userNo %>" >
            	<div class="tableArea">
             	<table>
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
						<td><label><input type="radio" name="style" value="귀여운"> 귀여운</label> 
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
            </div>
            </section>
            <div class="btnBox">
            <section id="submit" style="text-align: center;">
				<button type="submit" id="joinBtn" class="defaultBtn" value="2단계">다음단계</button>
				<button type="reset" id="goMain" class="defaultBtn cancelBtn" onclick='location.href="<%= request.getContextPath() %>/index.jsp"'>취소</button>
            </section>
            </div>
          </form>
        </section>
      </div>
    </div>
  </div>

  
</body>
<%@ include file="../common/footer.jsp" %>
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
