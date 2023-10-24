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
<script type="text/javascript">
	// Javascript SDK 초기화
	window.Kakao.init("23d86cad894fb7312653fa454f67c02e");
	
	// 로그인 function 작성
	function kakaologin() {
		// 카카오 로그인 화면 팝업 호출
		window.Kakao.Auth.login({
			// 가져올 사용자 정보
			scope: 'profile_nickname, profile_image, account_email',
			success: function(authObj){
				// 사용자 정보 가져올 API 호출
				window.Kakao.API.request({
					// 사용자 정보 요청 주소 지정
					url: '/v2/user/me',
					// API 호출 성공 시 실행되는 콜백 함수
					success: res => {
						// kakao_account 에 사용자 정보 저장
						var Kakao_account = res.kakao_account;
						// access_token 에 엑세스 토큰 저장
						var access_token = Kakao.Auth.getAccessToken();
						// 각 input 테그의 value 값에 request 받은 정보 저장
						$("#kakao_id").attr("value", Kakao_account.email);
						$("#kakao_nickname").attr("value", Kakao_account.profile.nickname);
						$("#kakao_image").attr("value", Kakao_account.profile.thumbnail_image_url);
						$("#kakao_access_token").attr("value", access_token);
						$("#kakao_form").submit();
					}				
				});	
			}
		});
	}
	
</script>
</head>
<body>
	<h1>카카오 로그인 테스트</h1>
	<hr><br>
	<!-- 카카오 로그인 버튼 추가 -->
	<a id="btn-kakao-login" href="javascript:kakaologin()"> <img
		src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
		width="200" alt="카카오 로그인 버튼" />
	</a>
	<form action="AfterLogin.jsp" id="kakao_form" method="GET">
		<input type="hidden" id="kakao_id" name="kakao_id" value="" >
		<input type="hidden" id="kakao_nickname" name="kakao_nickname" value="" >
		<input type="hidden" id="kakao_image" name="kakao_image" value="" >
		<input type="hidden" id="kakao_access_token" name="kakao_access_token" value="" >
	</form>
	
</body>
</html>
