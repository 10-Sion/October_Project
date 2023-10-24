<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="VO.AttendeeVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="Path" value="${pageContext.request.contextPath }"/>
<% String ExpoName = (String)request.getAttribute("ExpoName"); %>

<!DOCTYPE html>
<html>
<head>
    <title>Attendee List</title>
</head>
<body>
    <jsp:include page="subTop.jsp"/>
	<section id="main">
		<div class="inner">
    <h1>내 정보 수정</h1>
    <form action="${Path}/Ann/EditAttendPro.do" method="post">
		<table>
		    <tr>
		   	    <th>참가자 번호</th>
		        <th>이름 </th>
		        <th>이메일</th>
		        <th>참가 Expo</th>
		        <th>가입 상태</th>
		    </tr>
		    <tr>
		        <td><input type="hidden" value="${atnd.atndID}" name="atndID">${atnd.atndID}</td>
		        <td><input type="text" value="${atnd.atndName}" name="atndName"></td>
		        <td><input type="text" value="${atnd.email}" name="email"></td>
		        <td><input type="text" value="${ExpoName}" name="ExpoName" disabled></td>
		        <c:choose>
		            	<c:when test="${atnd.status eq 0 }">
		            	<td><c:out value="가입대기" /></td>
		            	</c:when>
		            	<c:when test="${atnd.status eq 1}">
		            	 <td><c:out value="참가 완료" /></td>
		            	</c:when>
		        </c:choose>
		    </tr>
	</table>
		<button type="submit" >수정하기</button>
		<button type="button" onclick="location.href='${Path}/Ann/DelAttend.do?atndID=${atnd.atndID}'">탈퇴</button>
	</form>
	</div>
	</section>
	<footer id="footer">
	<ul class="icons">
			<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
			<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
			<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
		</ul>
	</footer>
	<div class="copyright">
		Made with: <a href="https://templated.co/">Templated.co</a>
	</div>
</body>
</html>