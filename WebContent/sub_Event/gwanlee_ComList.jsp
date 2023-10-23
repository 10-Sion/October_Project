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
	        <!-- 이 부분에서 수정 버튼을 클릭하면 해당 기업 정보를 수정할 JSP 페이지로 이동할 수 있도록 링크를 추가합니다 -->
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
</body>
</html>
