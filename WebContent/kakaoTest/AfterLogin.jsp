<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");
    String kakao_id = request.getParameter("kakao_id");
    String kakao_nickname = request.getParameter("kakao_nickname");
    String kakao_image = request.getParameter("kakao_image");
    String kakao_access_token = request.getParameter("kakao_access_token");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script type="text/javascript">
        function kakaologout() {
            // Javascript SDK 초기화
            Kakao.init("23d86cad894fb7312653fa454f67c02e");

            // 엑세스 토큰이 없는 경우
            if (!Kakao.Auth.getAccessToken()) {
                location.href = "kalogin.jsp";
            }
            // 엑세스 토큰이 있을 경우
            else {
                // 엑세스 토큰 초기화 하는 함수
                Kakao.Auth.logout(function () {
                    // 성공적으로 초기화 되었는지 확인
                    alert('엑세스 토큰 : ' + Kakao.Auth.getAccessToken())
                    location.href = "movie.jsp";
                });
            }
        }

        function kakaoAlllogout() {
            // Javascript SDK 초기화
            Kakao.init("23d86cad894fb7312653fa454f67c02e");
            
            // Kakao.isinitialized(); // 삭제, 불필요한 함수 호출
            // Kakao.Auth.setAccessToken(kakao_access_token); // 엑세스 토큰을 null로 설정하여 초기화
            var access_token = Kakao.Auth.getAccessToken(); // 현재 로그인된 엑세스 토큰 가져오기
            
            Kakao.API.request({
                url: '/v1/user/unlink',
                success: function (response) {
                    console.log(response);
                    // 탈퇴 성공 시 호출할 함수 (callbackFunction을 정의해야 함)
                    callbackFunction();
                },
                fail: function (error) {
                    alert("탈퇴 안됨")
                    console.log(error);
                }

            });
        }

        function callbackFunction() {
            // 탈퇴 후에 실행할 코드 작성
            alert("탈퇴가 성공적으로 처리되었습니다.");
            // 예를 들어, 다시 로그인 페이지로 리다이렉트 등을 수행할 수 있습니다.
            location.href = "movie.jsp";
        }
    </script>
</head>
<body>
    로그인 아이디 : <%=kakao_id %>
    <br><br>
    설정한 이름 : <%=kakao_nickname %>
    <br><br>
    프로필 사진 : <%=kakao_image %>
    <br>
    <img src="<%=kakao_image%>">
    <br><br>
    엑세스 토큰 : <%=kakao_access_token %>
    <br><br>
    <a href="javascript:kakaologout()">로그아웃</a>
    <a href="javascript:kakaoAlllogout()">연결끊기</a>
</body>
</html>
