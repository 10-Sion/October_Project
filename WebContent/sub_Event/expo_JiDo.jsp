<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	String path = request.getContextPath();
%>

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
		
		<div class="maps">
		<h1>행사 장소</h1>
		<h3>부산광역시 부산진구 중앙대로 631</h3>
		
				
		<div id="map" style="width:100%;height:350px;"></div>

		<h1>오시는 길</h1>
		
		<h4>지하철 이용</h4>
		<h5>1호선 범내골역 7번 출구 123m</h5>
		
		<h4>버스 이용</h4>
		<h5> (범내골 하차, 서면방향) : 5-1, 10, 29, 38, 43, 52, 57, 66, 80, 81, 82, 83, 83-1, 86, 88, 99, 103, 108, 111, 138, 167, 168, 583, 1000, 1000(심야), 1004</h5>
		</div>
		
	
	</div>
	</section>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=23d86cad894fb7312653fa454f67c02e"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(35.14904819737886, 129.05898241899635), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(35.14904819737886, 129.05898241899635); 
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		var iwContent = '<div style="padding:5px;"> 예일 취업 박람회 <br><a href="https://map.kakao.com/link/map/예일 취업 박람회!,35.14904819737886, 129.05898241899635" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/예일 취업 박람회!,35.14904819737886, 129.05898241899635" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwPosition = new kakao.maps.LatLng(35.14904819737886, 129.05898241899635); //인포윈도우 표시 위치입니다
		
		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
		  
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker); 
	</script>
</body>
</html>