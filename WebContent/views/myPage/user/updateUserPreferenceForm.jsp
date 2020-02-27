<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</body>
</html>