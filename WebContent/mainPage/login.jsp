<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
    String Retry = (String)request.getAttribute("Retry");

    String retryMessage = "";
   
	if (Retry != null) {
		if (Retry.equals("가입된 정보와 일치하지 않습니다.")) {
			retryMessage = "가입된 정보와 일치하지 않습니다.";
		} else if (Retry.equals("가입 정보 변경 중 관리자 문의 바람")) {
			retryMessage = "가입 정보 변경 중 관리자 문의 바람";
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	// 카카오 키 : 23d86cad894fb7312653fa454f67c02e
	window.Kakao.init("23d86cad894fb7312653fa454f67c02e");
	
	function kakaoLogin() {
		
		window.Kakao.Auth.login({
			scope:'account_email, profile_nickname',
			success: function(authObj) {
				console.log(authObj);
				
				window.Kakao.API.request({
					url:'/v2/user/me',
					success: res => {
						const kakao_account = res.kakao_account;
						console.log(kakao_account);
						console.log(kakao_account.email);
						console.log(kakao_account.profile.nickname);
						
						// JavaScript에서 서버로 값을 전송하거나, JSP 페이지 내에서 사용할 수 있도록 request 객체에 값을 저장합니다.
	                    // 서버로 값을 전송하는 방법은 AJAX를 사용하거나, 폼 데이터를 전송하는 방법 중 하나를 선택할 수 있습니다.
	                    // 이 예제에서는 AJAX를 사용하여 값을 서버로 전송하고, JSP 페이지에서 사용하는 방법을 보여드리겠습니다.

	                    // AJAX를 사용하여 서버로 값을 전송
	                    // 여기서는 jQuery를 사용하겠습니다. jQuery를 사용하지 않는 경우에는 해당 라이브러리를 다운로드하고 추가해야 합니다.
	                    $.ajax({
	                        type: 'POST', // 또는 'GET' 등 HTTP 메서드를 선택
	                        url: '<%=contextPath%>/login/kakaoLogin.do',  // 값을 전송할 서버 엔드포인트 URL
	                        data: { email: JSON.stringify(kakao_account.email), // 전송할 데이터, JSON 형식으로 변환
	                        	    name: JSON.stringify(kakao_account.profile.nickname)},
	                        dataType:"text",
	                        success: function(response) {
	                            // 없어도됌
	                            console.log(response);
	                            if(response == "1"){
	                            	location.href="<%=contextPath%>/sub_Event/expo_AnNae.jsp";
	                            } else {
	                            	alert("사전 등록을 먼저 해주세요.");
	                            	location.href="<%=contextPath%>/sub_Event/expo_SaJeonApply.jsp";
	                            }
	                        }
	                    });
	                }
	            });
	        }
	    });
	}
</script>

<meta charset="UTF-8">
<title>로그인 페이지</title>
<script>
function validateForm() {
    var email = document.forms["loginForm"]["email"].value;
    var pwd = document.forms["loginForm"]["pwd"].value;
    var type = document.querySelector('input[name="type"]:checked');

    if (email === "" || pwd === "" || type === null) {
        alert("모든 항목을 입력해주세요.");
        return false;
    }
    document.loginForm.submit(); //<form> 전송
}  

// 돌아가기 버튼 클릭시
function goToIndexPage() {
    window.location.href = "<%= request.getContextPath() %>/sub_Event/expo_AnNae.jsp";
}

//"Retry" 값을 alert로 표시
var retryMessage = "<%= retryMessage %>";
if (retryMessage !== null && retryMessage !== "") {
    alert(retryMessage);
}
</script>
</head>
<body>
	<jsp:include page="/sub_Event/subTop.jsp" />
    <form name="loginForm" action="<%=contextPath %>/login/login.do" method="post"  align="lift">
        <h3>개인 및 기업 로그인</h3>
        <div>
        	<label>개인</label>
        	<input type="radio" name="type" value="Atnd"> <br>
        	<label>기업</label>
        	<input type="radio" name="type" value="Comp">
        </div>
        이메일 : <input type="text" name="email"><br>
        비밀번호 : <input type="text" name="pwd"><br>
        <input type="button" value="로그인" onclick="validateForm()">
        <input type="button" value="돌아가기" onclick="goToIndexPage()">
    </form>
    <div>
    	<a href="javascript:kakaoLogin();"><img src="<%=contextPath%>/image/kakao_login_medium.png"></a>
    </div>
</body>
</html>
