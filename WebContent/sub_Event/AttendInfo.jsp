<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="VO.AttendeeVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="Path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>참가정보</title>
</head>
<body>
    <jsp:include page="subTop.jsp"/>
	<section id="main">
		<div class="inner">
    <h1>Attendee</h1>
   	
    <table>
        <tr>
           <th>참가자 번호</th>
        	<th>이름 </th>
        	<th>이메일</th>
        	<th>참가 Expo</th>
        	<th>가입 상태</th>
        </tr>
        <tr>
            <td><c:out value="${atnd.atndID}" /></td>
            <td><c:out value="${atnd.atndName}" /></td>
            <td><c:out value="${atnd.email}" /></td>
            <td><c:out value="${ExpoName}" /></td>
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
    <button type="button" onclick="location.href='${Path}/Ann/EditAttend.do'">정보 수정</button>
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