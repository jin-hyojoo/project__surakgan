<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>수락간 :: STORE</title>
    <link rel="stylesheet" type="text/css" href="css/front_common.css">
    <link rel="stylesheet" type="text/css" href="css/front_store.css">
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
    <script type="text/javascript" src="js/config.js"></script>
</head>

<body>
 <%@ include file="/inc/front_header.jsp"%> 

 <div class="map_all_wrap">
 <div class="store_tit">
  <br>
  <h1>하루세끼 든든한 수락간을 소개합니다</h1>
 </div>
  <div class="map_wrap">
   <div id="map" style="width:100%;height:500px;"></div>

   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c6972a7246a75d7443710d2198ae76c6&libraries=services"></script>
    <script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('서울 강남구 테헤란로 14길 6', function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === daum.maps.services.Status.OK) {
		
		        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new daum.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new daum.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">수락간 역삼점</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
});    
</script>
</div>

<div class="store_info">
                <div class="new_info">   
                 <h3 class="h3_tit fz_02 f_b">수락간 역삼점</h3>   
                 <br>
                 <p class="new_add">서울특별시 강남구 테헤란로 14길 6 남도빌딩 &nbsp;&nbsp;TEL:1544-9970</p>
                 <br>   
                 <p class="bus"> 버스 | 역삼역.포스코P&S타워 정류장 <br>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;146, 740, 341, 360, 1100, 1700, 2000, 7007, 8001</p>
                 <p class="metro"> 지하철 | 지하철 2호선 역삼역 3번출구 100m, 지하철 2호선 1번출구 150m</p>
                </div>
        </div>
</div>
<%@ include file="/inc/front_footer.jsp"%> 
  
</body>
</html>