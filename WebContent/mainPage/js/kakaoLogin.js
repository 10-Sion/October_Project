	// Javascript SDK 초기화
	
	window.Kakao.init("23d86cad894fb7312653fa454f67c02e");
	
	// 로그인 function 작성
	function kakaologin() {
		// 카카오 로그인 화면 팝업 호출
		window.Kakao.Auth.login({
//  			redirectUri: 'http://localhost:8088/ChuiUpExpo/kakaoTest/AfterLogin.jsp',
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
//						$("#kakao_id").attr("value", Kakao_account.email);
//						$("#kakao_nickname").attr("value", Kakao_account.profile.nickname);
//						$("#kakao_image").attr("value", Kakao_account.profile.thumbnail_image_url);
//						$("#kakao_access_token").attr("value", access_token);
//						$("#kakao_form").submit();
						location.href="http://localhost:8088/ChuiUpExpo/kakaoTest/AfterLogin.jsp?access_token="+access_token+"&email="+Kakao_account.email;
					}				
				});	
			}
		});
	}