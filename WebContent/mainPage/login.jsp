<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
	<form action="<%=contextPath %>/login/login.do" method="post" align="center">
		<h3>참가자(참가기업) 로그인</h3>
		이메일 : <input type="email" name="email" ><br>
		비밀번호 : <input type="text" name="pwd"><br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>