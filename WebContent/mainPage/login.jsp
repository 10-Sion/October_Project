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
</body>
</html>
