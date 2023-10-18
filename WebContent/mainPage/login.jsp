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
    window.location.href = "<%= request.getContextPath() %>/mainPage/index.jsp";
}

//"Retry" 값을 alert로 표시
var retryMessage = "<%= retryMessage %>";
if (retryMessage !== null && retryMessage !== "") {
    alert(retryMessage);
}
</script>
</head>
<body>
    <form name="loginForm" action="<%=contextPath %>/login/login.do" method="post"  align="center">
        <h3>개인 및 기업 로그인</h3>
        구분 : 
        <input type="radio" name="type" value="Atnd"> 개인
        <input type="radio" name="type" value="Comp"> 기업<br>
        이메일 : <input type="text" name="email"><br>
        비밀번호 : <input type="text" name="pwd"><br>
        <input type="button" value="로그인" onclick="validateForm()">
        <input type="button" value="돌아가기" onclick="goToIndexPage()">
    </form>
</body>
</html>
