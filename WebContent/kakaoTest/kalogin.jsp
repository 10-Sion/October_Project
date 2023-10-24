<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- JQuery -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 카카오 로그인 API -->
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<!-- kakaologin() -->
<script type="text/javascript" src="../mainPage/js/kakaoLogin.js"></script>
</head>
<body>
	<h1>카카오 로그인 테스트</h1>
	<hr><br>
	<!-- 카카오 로그인 버튼 추가 -->
	<a id="btn-kakao-login" href="javascript:kakaologin()"> 
	<img src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
		width="200" alt="카카오 로그인 버튼" />
	</a>
<!-- 	<form action="AfterLogin.jsp" id="kakao_form" method="GET"> -->
<!-- 		<input type="hidden" id="kakao_id" name="kakao_id" value="" > -->
<!-- 		<input type="hidden" id="kakao_nickname" name="kakao_nickname" value="" > -->
<!-- 		<input type="hidden" id="kakao_image" name="kakao_image" value="" > -->
<!-- 		<input type="hidden" id="kakao_access_token" name="kakao_access_token" value="" > -->
<!-- 	</form> -->
	
</body>
</html>
