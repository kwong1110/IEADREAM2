<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
import="account.model.vo.*"
import="account.model.service.*"
import="idealType.model.vo.*"
import="idealType.model.service.*"
import="java.util.Arrays"
%>

<%
	
	
	/*
	Stat[] shape = (Stat[])request.getAttribute("shape");
	Stat[] style = (Stat[])request.getAttribute("style");
	Stat[] age = (Stat[])request.getAttribute("age");
	Stat[] religion = (Stat[])request.getAttribute("religion");
	Stat[] drink = (Stat[])request.getAttribute("drink");
	Stat[] smoke = (Stat[])request.getAttribute("smoke");
	Stat[] job = (Stat[])request.getAttribute("job");
	Stat[] scholar = (Stat[])request.getAttribute("scholar");
	Stat[] region = (Stat[])request.getAttribute("region");
	Stat[] interest = (Stat[])request.getAttribute("interest");
	*/
	
	Stat[][] st = new Stat[10][];
	/*
	String[] hval = (String[])request.getAttribute("hval");
	double[] hprop = (double[])request.getAttribute("hprop");
	String[] shval = (String[])request.getAttribute("shval");
	double[] shprop = (double[])request.getAttribute("shprop");
	String[] stval = (String[])request.getAttribute("stval");
	double[] stprop = (double[])request.getAttribute("stprop");
	String[] relval = (String[])request.getAttribute("relval");
	double[] relprop = (double[])request.getAttribute("relprop");
	String[] dval = (String[])request.getAttribute("dval");
	double[] dprop = (double[])request.getAttribute("dprop");
	String[] sval = (String[])request.getAttribute("sval");
	double[] sprop = (double[])request.getAttribute("sprop");
	String[] jval = (String[])request.getAttribute("jval");
	double[] jprop = (double[])request.getAttribute("jprop");
	String[] scval = (String[])request.getAttribute("scval");
	double[] scprop = (double[])request.getAttribute("scprop");
	String[] reval = (String[])request.getAttribute("reval");
	double[] reprop = (double[])request.getAttribute("reprop");
	String[] ival = (String[])request.getAttribute("ival");
	double[] iprop = (double[])request.getAttribute("iprop");
	*/
	String[] hval = {"150", "155", "160", "165", "170", "175", "180", "185"};
	double[] hprop = {0.05, 0.05, 0.05, 0.1, 0.1, 0.17, 0.25, 0.05, 0.05};
	String[] shval = {"마름", "보통", "통통", "근육질"};
	double[] shprop = {0.26, 0.43, 0.05, 0.21, 0.05};
	String[] stval = {"귀여운", "지적인", "섹시한", "따뜻한", "우아한", "터프한"};
	double[] stprop = {0.2, 0.2, 0.2, 0.2, 0.1, 0.1, 0.1};
	String[] relval = {"기독교", "천주교", "불교", "무교", "기타"};
	double[] relprop = {0.2, 0.2, 0.1, 0.45, 0.05};
	String[] dval = {"3", "2", "1", "0"};
	double[] dprop = {0.1, 0.2, 0.4, 0.3};
	String[] sval = {"1", "0"};
	double[] sprop = {0.2, 0.8};
	String[] jval = {"학생", "사무직", "연구직", "교육직", "예술", "서비스", "전문직", "기타"};
	double[] jprop = {0.3, 0.05, 0.05, 0.1, 0.2, 0.05, 0.2, 0.05};
	String[] scval = {"0", "2", "4", "6", "8"};
	double[] scprop = {0.1, 0.05, 0.6, 0.15, 0.1};
	String[] reval = {"11", "12", "13", "20", "31,", "32", "33", "41", "42", "43", "51", "52", "53", "54", "55", "60"};
	double[] reprop = {0.2, 0.1, 0.3, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.15, 0.1, 0.05, 0.05};
	
	String[] ival = {"movie", "musical", "comic", "picture", "books", "music",
            "sing", "instrurment", "cook", "camp", "exercise", "sports",
            "vgame", "bgame", "sns", "drink", "beauty", "pet", "diy", "money"};
	double[] iprop = {0.2, 0.1, 0.1, 0.1, 0.4, 0.4, 0.1, 0.1, 0.1, 0.1, 0.2, 0.2, 0.2, 0.1, 0.1, 0.2, 0.2, 0.2, 0.2, 0.1};
	
	
	st[0] = new Stat[hval.length];
	for(int i=0; i<hval.length ;i++){
		st[0][i] = new Stat();
		st[0][i].setItem(hval[i]);
		st[0][i].setProp(hprop[i]);
	}
	
	st[1] = new Stat[shval.length];
	for(int i=0; i<shval.length ;i++){
		st[1][i] = new Stat();
		st[1][i].setItem(shval[i]);
		st[1][i].setProp(shprop[i]);
	}
	st[2] = new Stat[stval.length];
	for(int i=0; i<stval.length ;i++){
		st[2][i] = new Stat();
		st[2][i].setItem(stval[i]);
		st[2][i].setProp(stprop[i]);
	}
	st[3] = new Stat[relval.length];
	for(int i=0; i<relval.length ;i++){
		st[3][i] = new Stat();
		st[3][i].setItem(relval[i]);
		st[3][i].setProp(relprop[i]);
	}
	st[4] = new Stat[dval.length];
	for(int i=0; i<dval.length ;i++){
		st[4][i] = new Stat();
		st[4][i].setItem(dval[i]);
		st[4][i].setProp(dprop[i]);
	}
	st[5] = new Stat[sval.length];
	for(int i=0; i<sval.length ;i++){
		st[5][i] = new Stat();
		st[5][i].setItem(sval[i]);
		st[5][i].setProp(sprop[i]);
	}
	st[6] = new Stat[jval.length];
	for(int i=0; i<jval.length ;i++){
		st[6][i] = new Stat();
		st[6][i].setItem(jval[i]);
		st[6][i].setProp(jprop[i]);
	}
	st[7] = new Stat[scval.length];
	for(int i=0; i<scval.length ;i++){
		st[7][i] = new Stat();
		st[7][i].setItem(scval[i]);
		st[7][i].setProp(scprop[i]);
	}
	st[8] = new Stat[reval.length];
	for(int i=0; i<reval.length ;i++){
		st[8][i] = new Stat();
		st[8][i].setItem(reval[i]);
		st[8][i].setProp(reprop[i]);
	}
	st[9] = new Stat[ival.length];
	for(int i=0; i<ival.length ;i++){
		st[9][i] = new Stat();
		st[9][i].setItem(ival[i]);
		st[9][i].setProp(iprop[i]);
	}
	for(int i=0; i<10; i++){
	Arrays.sort(st[i]);
	}
	for (int i=0; i<st.length ; i++){
		for (int j=0; j<st[i].length ; j++){
      		switch(i){
      		case 0:
      			switch(st[i][j].getItem()){
      				case "150" :st[i][j].setItem("155 미만");break;
      				case "155" :st[i][j].setItem("155 ~ 160");break;
      				case "160" :st[i][j].setItem("160 ~ 165");break;
      				case "165" :st[i][j].setItem("165 ~ 170");break;
      				case "170" :st[i][j].setItem("170 ~ 175");break;
      				case "175" :st[i][j].setItem("175 ~ 180");break;
      				case "180" :st[i][j].setItem("180 ~ 185");break;
      				case "185" :st[i][j].setItem("185 이상");break;
      				}
      			break;
      		/*
      		case 3:
      			switch(st[i][j].getItem()){
      				case "-2" :st[i][j].setItem("3살 초과 연하");break;
      				case "-1" :st[i][j].setItem("3살 이내 연하");break;
      				case "0" :st[i][j].setItem("동갑");break;
      				case "1" :st[i][j].setItem("3살 이내 연상");break;
      				case "2" :st[i][j].setItem("3상 초과 연상");break;
      				}
				break;
			*/
      		case 4:
      			switch(st[i][j].getItem()){
      				case "3" :st[i][j].setItem("주 3회 이상");break;
      				case "2" :st[i][j].setItem("주 1회");break;
      				case "1" :st[i][j].setItem("월 1회");break;
      				case "0" :st[i][j].setItem("안 마심");break;
      				}
				break;
      		case 5:
      			switch(st[i][j].getItem()){
      				case "1" :st[i][j].setItem("피움");break;
      				case "0" :st[i][j].setItem("안 피움");break;
      				}
      			break;
      		case 7:
      			switch(st[i][j].getItem()){
      				case "0" :st[i][j].setItem("고졸");break;
      				case "2" :st[i][j].setItem("초대졸");break;
      				case "4" :st[i][j].setItem("대졸");break;
      				case "6" :st[i][j].setItem("석사");break;
      				case "8" :st[i][j].setItem("박사");break;
      				}		
      			break;
      		case 8:
      			switch(st[i][j].getItem()){
      				case "11" :st[i][j].setItem("서울");break;
      				case "12" :st[i][j].setItem("인천");break;
      				case "13" :st[i][j].setItem("경기");break;
      				case "20" :st[i][j].setItem("강원");break;
      				case "31" :st[i][j].setItem("충북");break;
      				case "32" :st[i][j].setItem("충남");break;
      				case "33" :st[i][j].setItem("대전");break;
      				case "41" :st[i][j].setItem("전북");break;
      				case "42" :st[i][j].setItem("전남");break;
      				case "43" :st[i][j].setItem("광주");break;
      				case "51" :st[i][j].setItem("경북");break;
      				case "52" :st[i][j].setItem("대구");break;
      				case "53" :st[i][j].setItem("경남");break;
      				case "54" :st[i][j].setItem("부산");break;
      				case "55" :st[i][j].setItem("울산");break;
      				case "60" :st[i][j].setItem("제주");break;
      				}		
      			break;
      		case 9:
      			switch(st[i][j].getItem()){
						case "movie": st[i][j].setItem("영화&드라마"); break;
						case "musical": st[i][j].setItem("연극&뮤지컬"); break;
						case "comic": st[i][j].setItem("만화&서브컬처"); break;
						case "picture": st[i][j].setItem("사진&영상 촬영"); break;
						case "books": st[i][j].setItem("독서"); break;
						case "music": st[i][j].setItem("음악 감상"); break;
						case "sing": st[i][j].setItem("노래&춤"); break;
						case "instrument": st[i][j].setItem("악기 연주"); break;
						case "cook": st[i][j].setItem("요리&음식"); break;
						case "camp": st[i][j].setItem("여행&캠핑"); break;
						case "exercise": st[i][j].setItem("운동"); break;
						case "sports": st[i][j].setItem("스포츠 경기"); break;
						case "vgame": st[i][j].setItem("비디오 게임"); break;
						case "bgame": st[i][j].setItem("보드게임"); break;
						case "sns": st[i][j].setItem("SNS"); break;
						case "drink": st[i][j].setItem("술&모임"); break;
						case "beauty": st[i][j].setItem("뷰티&패션"); break;
						case "pet": st[i][j].setItem("반려동물"); break;
						case "diy": st[i][j].setItem("DIY"); break;
						case "money": st[i][j].setItem("재테크"); break;
      			}break;
      		}
		}
	}
	
	
		
%>
<!doctype html>
<html>
<head>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
  <title>선호도 통계 </title>
  <meta charset="utf-8">
  <style>
  	.outer{
  		min-height: 1000px;
  	}
    section {
      padding: 15px;
    }
    .pageTitle{
    	height : 50px;
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
    .itemBox{
        display : flex;
        height : 90px;
        margin : 0px 10px;
    }
    .itemName{
        width:175px;
        text-align: center;
        font-size : 20pt;
        font-weight: 500;
        line-height: 70px;
        color:rgb(230, 141, 150);
    }
    .itemValue{
        display: flex;
        text-align: center;
        margin : 0px  5px auto;
    }
    .itemValueName{
    	width : 110px;
        line-height: 60px;
    }
    .itemSync{
    	display: block;
    }
    .itemSyncNo{
    	color:rgb(30, 180, 180);
    }
    .itemSyncGraph{
    	width: 100px;
    	height: 100px;
    }
    .itemCheck{
      width:50px;
      height:50px;
    }
  </style>
</head>
<body>
	<%@ include file="../common/mainmenu.jsp" %>
  <div class ="outer">
    <div class="wrapper">
      <div class ="main">
        <div class="pageTitle">
			<h1> 이상형 통계</h1>
		</div>
        <section id="items">  
          <article>
          <% 
          for (int i=0; i<st.length ; i++){
          
        	  String itemName = null;
        		switch(i){
        		case 0: itemName = "키" ; break;
        		case 1: itemName = "체형" ; break;
        		case 2: itemName = "매력" ; break;
        		case 3: itemName = "종교" ; break;
        		case 4: itemName = "음주" ; break;
        		case 5: itemName = "흡연" ; break;
        		case 6: itemName = "직업" ; break;
        		case 7: itemName = "학력" ; break;
        		case 8: itemName = "거주 지역" ; break;
        		case 9: itemName = "관심 분야" ; break;
        		}
          %>
            <div class="itemBox">
            	<div class="itemName" id="">
            		<label><%= itemName %></label>
              	</div>
              	<%
              	for (int j=0; j < st[0].length ; j++){
              	%>
            	<div class="itemValue" id="">
                	<div class="itemValueName">
                 		<label><%= st[i][j].getItem() %></label>
                	</div>
                	<div class="itemSync">
                		<div class="itemSyncNo">
                			<label class="" id=""><%= 100*st[i][j].getProp() %>%</label>
                		</div>
                		<div class="itemSyncGraph">
                		<%
                			String imagePath = null;
                			if (st[i][j].getProp() > 0.65) {imagePath = request.getContextPath() + "/images/common/wifi high.png";}
                		else if (st[i][j].getProp() > 0.5) {imagePath = request.getContextPath() + "/images/common/wifi mid.png";}
                		else if (st[i][j].getProp() > 0.32) {imagePath = request.getContextPath() + "/images/common/wifi low.png";}
                		else 								{imagePath = request.getContextPath() + "/images/common/wifi none.png";}
                		%>
                		
                			<img src="<%= imagePath %>" width="50px" height="50px">
                		</div>
                	</div>
            	</div>
            	<%
            	if ((i==5 && j==1 ) || (j == 3)){break;}
            	} 
            	%>
            </div>
            <% } %>
          </article>
        </section>
      </div>
    </div>
  </div>

<%@ include file="../common/footer.jsp" %>
</body>
</html>
