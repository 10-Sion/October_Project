<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="./subTop.jsp" />

	<section id="main">
		<div class="inner">
		
		<h1>행사 장소</h1>
		<h3>부산광역시 부산진구 중앙대로 631</h3>
		
		<h1>오시는 길</h1>
		
		<h4>지하철 이용</h4>
		<h5>1호선 범내골역 7번 출구 123m</h5>
		
		<h4>버스 이용</h4>
		<h5> (범내골 하차, 서면방향) : 5-1, 10, 29, 38, 43, 52, 57, 66, 80, 81, 82, 83, 83-1, 86, 88, 99, 103, 108, 111, 138, 167, 168, 583, 1000, 1000(심야), 1004</h5>
		
		
		<div id="map" style="width:100%;height:350px;"></div>
		<p>
			<button onclick="setDraggable(false)">지도 드래그 이동 끄기</button>
			<button onclick="setDraggable(true)">지도 드래그 이동 켜기</button>
		</p>
	
	</div>
	</section>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=23d86cad894fb7312653fa454f67c02e"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(35.14904819737886, 129.05898241899635), // 지도의 중심좌표
	         // draggable: false, // 지도를 생성할때 지도 이동 및 확대/축소를 막으려면 draggable: false 옵션을 추가하세요
	        level: 3 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 버튼 클릭에 따라 지도 이동 기능을 막거나 풀고 싶은 경우에는 map.setDraggable 함수를 사용합니다
	function setDraggable(draggable) {
	    // 마우스 드래그로 지도 이동 가능여부를 설정합니다
	    map.setDraggable(draggable);    
	}
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(35.14904819737886, 129.05898241899635); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	</script>
</body>
</html>