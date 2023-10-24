<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="VO.CompanyVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="companyDAO" class="DAO.CompanyDAO" />
<jsp:useBean id="allCompanies" class="java.util.ArrayList" />

<c:set var="allCompanies" value="${companyDAO.getCompanyList('', '', 0)}" />

<!-- 수정 대기 리스트 -->
<html>
<head>
    <title>Company List</title>
</head>
<body>
    <jsp:include page="subTop.jsp"/>
    <section id="main">
		<div class="inner">

	<div>
    <h1>Company List</h1>
    <table>
        <tr>
            <th>CoID</th>
            <th>CoName</th>
            <th>CoTel</th>
            <th>CoNumber</th>
            <th>Email</th>
            <th>StartDate</th>
            <th>EndDate</th>
            <th>ExpoID</th>
            <th>Status</th>
        </tr>

        <c:forEach var="company" items="${allCompanies}">
	    <tr>

	        <td><c:out value="${company.coID}" /></td>
	        <td><c:out value="${company.coName}" /></td>
	        <td><c:out value="${company.coTel}" /></td>
	        <td><c:out value="${company.coNumber}" /></td>
	        <td><c:out value="${company.email}" /></td>
	        <td><c:out value="${company.startDate}" /></td>
	        <td><c:out value="${company.endDate}" /></td>
	        <td><c:out value="${company.expoID}" /></td>
	        <td><c:out value="${company.status}" /></td>
	        <td><a href="updateCompany.jsp?coID=${company.coID}">수정</a></td>
	    </tr>
	</c:forEach>
    </table>
    </div>
    
    <div>
    	
    </div>
     </div>
	</section>
    <footer id="footer">
        <ul class="icons">
            <li><a href="https://twitter.com/jjencshk" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
            <li><a href="https://www.facebook.com/yeilit/?locale=ko_KR" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
            <li><a href="https://www.instagram.com/b.yeil_official/" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
        </ul>
    </footer>
</body>
</html>
