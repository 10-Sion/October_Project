<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="robots"
	content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=path%>/sub_Event/assets/css/main.css">

<body>			
	<jsp:include page="../sub_Event/subTop.jsp"/>
	<section id="main">
		<div class="inner">
		<table>
		<tr>
			<td></td>
		
		
		</tr>
			<c:forEach var="Event" items="${Event}">
					<tr>
						<td>${Event.eve_no}</td>
						<td>${Event.eve_Name}</td>
						<td>${Event.eve_manager}</td>
						<td>${Event.eve_Sch}</td>
						<td>${Event.eve_Cate}</td>
						<td>
							 <a	href="<%= request.getContextPath() %>/Ann/update.do">수정</a>
							 <a href="<%= request.getContextPath() %>/Ann/info.do">자세히 보기</a>

							<!-- 삭제 버튼 --> <a
							href="<%= request.getContextPath() %>/In_Controller3?action=deleteSchedule&schID=${schedule.schID}">삭제</a>
						</td>
					</tr>
				</c:forEach>
		</table>
		</div>
	</section>
    <footer id="footer">
        <ul class="icons">
            <li><a href="https://twitter.com/jjencshk" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
            <li><a href="https://www.facebook.com/yeilit/?locale=ko_KR" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
            <li><a href="https://www.instagram.com/b.yeil_official/" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
        </ul>
    </footer>
	<div class="copyright">
		Made with: <a href="https://templated.co/">Templated.co</a>
	</div>

</body>
</html>