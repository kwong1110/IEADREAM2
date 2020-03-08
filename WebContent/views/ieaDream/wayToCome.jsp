<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이어드림 - 오시는 길</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<style>
    #loadTable{
    	    border-top: 2px solid black;
		    width: 500px;
		    height: 150px;
		    margin-top: 30px;
		    text-align: center;
		    margin-left: 25%;
    }
    table>tbody>tr>td{
    	vertical-align: middle;
    	border-bottom: 1px solid lightgray;
    	background: #f9f9f9;
    }
     table>tbody>tr>th{
    	vertical-align: middle;
    	border-bottom: 1px solid lightgray;
    	font-size:smaller;
    }
    
    #blueBusPicture, #redBusPicture{
    	width: 15px;
  	  	height: 15px;
    	vertical-align: bottom;
    }

</style>
</head>
<body>
	<%@ include file="../common/mainmenu.jsp" %>
	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h2>오시는 길</h2>
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
					<th>서울특별시 강남구 테헤란로 14길 6 남도빌딩 3F</th>
				</tr>
				<tr>
					<td>버스</td>
					<th>
						역삼역.포스코P&S타워 정류장<br>
						<img id="blueBusPicture" src='<%=request.getContextPath()%>/images/common/blueBus.png'> 146 / 740 / 341 / 360 
						&nbsp;&nbsp;
						<img id="redBusPicture" src='<%=request.getContextPath()%>/images/common/redBus.png'> 1100 / 1700 / 2000 / 7007 / 8001
					</th>
				</tr>
				<tr>
					<td>지하철</td>
					<th>지하철 2호선 역삼역 3번출구 100m</th>
				</tr>
			</table>
		</div>
	</div>
</body>
<%@ include file="../common/footer.jsp" %>
</html>