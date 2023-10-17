<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
    String Retry = (String)request.getAttribute("Retry");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
function validateForm() {
    var email = document.forms["loginForm"]["email"].value;
    var pwd = document.forms["loginForm"]["pwd"].value;
    var type = document.querySelector('input[name="type"]:checked');

    if (email === "" || pwd === "" || type === null) {
        alert("모든 항목을 입력해주세요.");
        return false;
    }
}
function goToIndexPage() {
    window.location.href = "<%= request.getContextPath() %>/mainPage/index.jsp";
}
</script>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('23d86cad894fb7312653fa454f67c02e'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>
</head>
<body>
    <form name="loginForm" action="<%=contextPath %>/login/login.do" method="post" onsubmit="return validateForm();" align="center">
        <h3>개인 및 기업 로그인</h3>
        구분 : 
        <input type="radio" name="type" value="Atnd"> 개인
        <input type="radio" name="type" value="Comp"> 기업<br>
        이메일 : <input type="text" name="email"><br>
        비밀번호 : <input type="text" name="pwd"><br>
        <input type="submit" value="로그인">
        <input type="button" value="돌아가기" onclick="goToIndexPage()">
    </form>
    <ul>
	<li onclick="kakaoLogin();">
      <a href="<%=request.getContextPath()%>/mainPage/index.jsp">
          <span>카카오 로그인</span>
      </a>
	</li>
	<li onclick="kakaoLogout();">
      <a href="javascript:void(0)">
          <span>카카오 로그아웃</span>
      </a>
	</li>
</ul>
</body>
</html>
