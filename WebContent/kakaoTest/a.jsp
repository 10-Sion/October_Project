<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>
    Kakao.init('23d86cad894fb7312653fa454f67c02e'); // 사용하려는 앱의 JavaScript 키 입력

    // 아래는 로그인 및 로그아웃 함수입니다.
    function kakaoLogout() {
      Kakao.Auth.logout()
        .then(function() {
          alert('로그아웃 성공\naccess token -> ' + Kakao.Auth.getAccessToken());
          deleteCookie();
        })
        .catch(function() {
          alert('로그인되어 있지 않습니다.');
        });
    }

    // 아래는 로그인 버튼 클릭 시 실행될 함수입니다.
function kakaoLogin() {
  Kakao.Auth.login({
    scope: 'account_email, profile_nickname',
    success: function (authObj) {
      console.log(authObj);
      Kakao.API.request({
        url: '/v2/user/me',
        success: function (res) {
          const kakao_account = res.kakao_account;
          console.log(kakao_account);
          console.log(kakao_account.email);
          console.log(kakao_account.profile.nickname);

          alert('로그인 성공\naccess token -> ' + Kakao.Auth.getAccessToken());
        },
        fail: function (error) {
          alert('카카오 로그인 처리 중 오류가 발생했습니다.');
        },
      });
    },
    fail: function (error) {
      alert('카카오 로그인 처리 중 오류가 발생했습니다.');
    },
  });
}
    
    // 아래는 로그아웃 시 쿠키 삭제 함수입니다.
    function deleteCookie() {
      document.cookie = 'authorize-access-token=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
    }
  </script>
<meta charset="UTF-8">
<title>Kakao Login and Logout</title>
</head>
<body>
	<button class="api-btn" onclick="kakaoLogin()">카카오 로그인</button>
	<button class="api-btn" onclick="kakaoLogout()">카카오 로그아웃</button>
</body>
</html>
