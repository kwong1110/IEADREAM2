<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
  <title>이상형의 이상형</title>
  <meta charset="utf-8">
  <style>
    .wrapper{
      text-align: left;
      width: 1200px;
      margin:0 auto;
      padding:0;
      display : block;
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
      padding:0;
      float : left;
      border-left: 1px solid darkgray;
    }
    section {
      padding: 15px;
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
        width : 1000px;
        margin : 0px 10px;
    }
    .itemName{
        width:175px;
        text-align: center;
        font-size : 20pt;
        font-weight: 500;
        line-height: 70px;
    }
    .itemValue{
        display: flex;
        text-align: center;
        margin : 0px  5px auto;
    }
    .itemValueName{
        margin: 0px 15px;
        line-height: 60px;
    }
    .itemSync{
    	display: block;
    }
    .itemCheck{
      width:50px;
      height:50px;
    }
  </style>
</head>
<body style="height:100%; margin:0 auto;">

  <div class ="outer">
    <div class="wrapper">
      <nav>
        <div  class="mainCategory">
          <a href="views/account/idealType/idealTypeMatch.jsp">이상형</a>
        </div>
        <div class="subCategory">
          <a href="views/account/idealType/idealTypeMatch.jsp">이상형 추천</a>
        </div>
        <div class="subCategory">
          <a href="">이상형의 이상형</a>
        </div>
      </nav>
      <div class ="main">
        <section style="clear:left;">
          <p style="font-weight: 550; font-size: 16pt;">이상형의 이상형</p>
        </section>
        <section id="summary" style="display: flex">
          <article id="sync" style="text-align: center; margin-left: 40%;">
            <label style="margin:10px;">나와의 일치율</label>
            <label>65%</label>
            <div class="graph">
                <strong class="bar" style="width: 65%;"></strong>
            </div>
          </article>
        </section>
        <section id="items">  
          <article>
            <div class="itemBox">
              <div class="itemName" id="">
                <label>키</label>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label class="itemSync" id="">0%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
            </div>
            <div class="itemBox">
              <div class="itemName" id="">
                <label>체형</label>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
            </div>
            <div class="itemBox">
              <div class="itemName" id="">
                <label>스타일</label>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
            </div>
            <div class="itemBox">
              <div class="itemName" id="">
                <label>직업</label>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
            </div>
            <div class="itemBox">
              <div class="itemName" id="">
                <label>학력</label>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
            </div>
            <div class="itemBox">
              <div class="itemName" id="">
                <label>종교</label>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
            </div>
            <div class="itemBox">
              <div class="itemName" id="">
                <label>음주</label>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
            </div>
            <div class="itemBox">
              <div class="itemName" id="">
                <label>흡연</label>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
            </div>
            <div class="itemBox">
              <div class="itemName" id="">
                <label>관심분야</label>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
            </div>
            <div class="itemBox">
              <div class="itemName" id="">
                <label>나이</label>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
            </div>
            <div class="itemBox">
              <div class="itemName" id="">
                <label>지역</label>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
              <div class="itemValue" id="">
                <div class="itemValueName">
                  <label>itemValue</label>
                </div>
                <div>
                  <label style="display:block;">55%</label>
                  <image width="50px" height="50px"></image>
                </div>
              </div>
              <div class="itemCheck">
                <image></image>
              </div>
            </div>
          </article>
        </section>
      </div>
    </div>
  </div>

</body>
</html>
