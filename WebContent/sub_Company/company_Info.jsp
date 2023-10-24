<%@page import="VO.CompanyVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CompanyVO vo = new CompanyVO();
		vo = (CompanyVO)request.getAttribute("CompanyInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/sub_Event/subTop.jsp"/>
	<section id="main">
		<div class="inner">
	<table border="1">
		<h2><%=vo.getCoName()%> 참가정보</h2>
		<tr>
			<td>기업명</td>
			<td>기업 상세정보</td>
			<td>기업 사업자 번호</td>
			<td>기업 이메일</td>
			<td>시작일</td>
			<td>종료일</td>
		</tr>
		<tr>
			<td><%=vo.getCoName()%></td>
			<td><%=vo.getCoDetails()%></td>
			<td><%=vo.getCoNumber()%></td>
			<td><%=vo.getEmail()%></td>
			<td><%=vo.getStartDate()%></td>
			<td><%=vo.getEndDate()%></td>
		</tr>		
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