<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.4.0/kakao.min.js"
  integrity="sha384-mXVrIX2T/Kszp6Z0aEWaA8Nm7J6/ZeWXbL8UpGRjKwWe56Srd/iyNmWMBhcItAjH" crossorigin="anonymous"></script>
<script>
  Kakao.init('23d86cad894fb7312653fa454f67c02e'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<button class="api-btn" onclick="unlinkApp()">앱 탈퇴하기</button>

<script>
  function unlinkApp() {
    Kakao.API.request({
      url: '/v1/user/unlink',
    })
      .then(function(res) {
        alert('success: ' + JSON.stringify(res));
        deleteCookie();
      })
      .catch(function(err) {
        alert('fail: ' + JSON.stringify(err));
      });
  }

  // 아래는 데모를 위한 UI 코드입니다.
  function deleteCookie() {
    document.cookie = 'authorize-access-token=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
  }
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>