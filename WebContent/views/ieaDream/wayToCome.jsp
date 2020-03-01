<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IEADREAM - CEO</title>
<style>
	a:link { color: black; text-decoration: none}
    a:visited {color: black;}
    a:hover{ color : silver;}
    
    
	*{box-sizing: border-box;}
	.container{min-width: 1000px;}
	.container .content{padding-left: 200px; padding-right: 200px; overflow: hidden;}
	.container .content>*{float: left; padding-bottom: 200px; margin-bottom: -200px;}
	.container .content main{width: 100%;}
	.container .content nav{width: 200px; margin-left: -100%; left:-200px; position: relative;}
	.container footer{clear: both;}
	
	.menu{background: white;}
	.menu> li{list-style: none; font-size: 30px; left: 150px; 
			  display: inline-block; padding: 10px; position: relative;}
	.menu a{line-height: 75px; color:rgb(51,51,51); display: block;}
	.menu .link{text-decoration: none;}
	
	.subCategory{color: rgb(51, 51, 51); text-decoration: none;}
	.quickmenu> li{list-style: none; font-size: 20px; left: 30px; padding: 5px; position: relative;}
	
    
	.container .content main .article{position: relative; float: right;
    margin-right: 400px;}
    
    #loadTable{
    	border-top : 2px solid black;
    	width : 500px;
    	height: 300px;
    	margin-top: 30px;
    }
    
    td{
    	border-bottom : 1px solid gray;
    }

</style>
</head>
<body>
	<%@ include file="../common/mainmenu.jsp" %>
	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>오시는 길</h1>
				</div>
				<div class='mapArea' id="ieaMap">
					<div id="map" style="width:500px;height:300px;"></div>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63ffc05798b2c8ac4748dd1b07f4ac3f&libraries=services"></script>
					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = {
					        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };  
				
						// 지도를 생성합니다    
						var map = new kakao.maps.Map(mapContainer, mapOption); 
						
						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();
						
						// 주소로 좌표를 검색합니다
						geocoder.addressSearch('서울특별시 강남구 강남구 테헤란로14길 6', function(result, status) {
				
						    // 정상적으로 검색이 완료됐으면 
						     if (status === kakao.maps.services.Status.OK) {
						
						        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						
						        // 결과값으로 받은 위치를 마커로 표시합니다
						        var marker = new kakao.maps.Marker({
						            map: map,
						            position: coords
						        });
						
						        // 인포윈도우로 장소에 대한 설명을 표시합니다
						        var infowindow = new kakao.maps.InfoWindow({
						            content: '<div style="width:150px;text-align:center;padding:6px 0;">이어드림</div>'
						        });
						        infowindow.open(map, marker);
						
						        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						        map.setCenter(coords);
						    } 
						});    
					</script>
				</div>
			</div>
		</div>	
		<div class="infoArea" id="info" style="clear: both; padding: 5px;"> 
			<table id="loadTable">
				<tr>
					<td>주소</td>
					<td>서울특별시 강남구 테헤란로 14길 6 남도빌딩 3F</td>
				</tr>
				<tr>
					<td>버스</td>
					<td>역삼역.포스코P&S타워 정류장</td>
				</tr>
				<tr>
					<td>지하철</td>
					<td>지하철 2호선 역삼역 3번출구 100m</td>
				</tr>
			</table>
		</div>
	</div>
</body>
<%@ include file="../common/footer.jsp" %>
</html>