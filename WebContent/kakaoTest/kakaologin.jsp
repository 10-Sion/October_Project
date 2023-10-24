<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<!-- jQuery 라이브러리 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
        // 페이지가 로드될 때 실행되는 함수
        $(function () {
            $("#btn-kakao-login").click(function (event) {
                event.preventDefault();
                $("#alert-kakao-login").addClass("d-none");

                // 카카오 로그인 서비스 초기화 및 실행
                Kakao.init('23d86cad894fb7312653fa454f67c02e');
                Kakao.Auth.login({
                	
                    success: function (auth) {
                        Kakao.API.request({
                            url: '/v2/user/me',
                            success: function (response) {
                                var account = response.kakao_account;

                                // 사용자 정보를 폼에 추가
                                $('#form-kakao-login input[name=email]').val(account.email);
                                $('#form-kakao-login input[name=name]').val(account.profile.nickname);
                                $('#form-kakao-login input[name=img]').val(account.profile.profile_image);

                                // 사용자 정보가 포함된 폼을 서버로 제출
                                $('#form-kakao-login').submit();
                            },
                            fail: function (error) {
                                // 카카오 로그인 오류 메시지를 표시
                                $('#alert-kakao-login').removeClass("d-none").text("카카오 로그인 처리 중 오류가 발생했습니다.");
                            }
                        });
                    },
                    fail: function (error) {
                        // 카카오 로그인 오류 메시지를 표시
                        $('#alert-kakao-login').removeClass("d-none").text("카카오 로그인 처리 중 오류가 발생했습니다.");
                    }
                });
            });

            // 사용자 토큰을 체크하고 로그인 상태를 표시하는 함수
            checkLoginStatus();
        });

        function checkLoginStatus() {
            var token = getCookie('authorize-access-token');
            if (token) {
                Kakao.Auth.setAccessToken(token);
                Kakao.Auth.getStatusInfo()
                    .then(function (res) {
                        if (res.status === 'connected') {
                            // 사용자가 로그인 상태인 경우
                            displayUserInfo();
                        }
                    })
                    .catch(function (err) {
                        Kakao.Auth.setAccessToken(null);
                    });
            }
        }

        function displayUserInfo() {
            Kakao.API.request({
                url: '/kakaoTest/userinfo.jsp',
                success: function (response) {
                    var account = response.kakao_account;
                    var userInfo = "이메일: " + account.email + "<br>닉네임: " + account.profile.nickname;
                    $("#user-info").html(userInfo);
                },
                fail: function (error) {
                    // 오류 메시지 표시
                    $("#user-info").html("사용자 정보를 가져오는 중 오류가 발생했습니다.");
                }
            });
        }

        function getCookie(name) {
            var parts = document.cookie.split(name + '=');
            if (parts.length === 2) { return parts[1].split(';')[0]; }
        }
    </script>

<style>
/* 추가 스타일: 경고 메시지에 빨간색 텍스트 스타일 적용 */
#alert-kakao-login {
	color: red;
}
</style>
</head>
<body>
	<!-- 카카오 로그인 버튼 추가 -->
	<a id="btn-kakao-login" href="#"> <img
		src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
		width="200" alt="카카오 로그인 버튼" />
	</a>

	<!-- 추가: 사용자 정보 표시 영역 -->
	<div id="user-info"></div>

	<form id="form-kakao-login" method="post" action="kakao-login">
		<input type="hidden" name="email" /> <input type="hidden" name="name" />
		<input type="hidden" name="img" />
	</form>

	<div class="alert alert-danger d-none" id="alert-kakao-login"></div>
</body>
</html>
