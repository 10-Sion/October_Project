<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="VO.CompanyVO" %>

<jsp:useBean id="companyDAO" class="DAO.CompanyDAO" />

<%
	Integer coID = Integer.parseInt(request.getParameter("coID"));
	request.setAttribute("coID", coID);
	
    CompanyVO company = null;
    
    if (coID != null) {
        // coID를 사용하여 company 정보를 가져옵니다.
        company = companyDAO.getCompanyInfo(coID.intValue());
    }

   	System.out.println("co: "+coID);
%>


<!DOCTYPE html>
<html>
<head>
    <title>Update Company Information</title>
</head>
<body>
    <jsp:include page="subTop.jsp"/>

    <h1>Update Company Information</h1>
    
    <form action="<%= request.getContextPath() %>/Event?action=updateCompany" method="post">
        <input type="hidden" name="coID" value="<%= coID %>" />
        
        <label for="coName">Company Name:</label>
        <input type="text" name="coName" value="<%= company.getCoName() %>" required /><br />
        
        <label for="coTel">Company Tel:</label>
        <input type="text" name="coTel" value="<%= company.getCoTel() %>" /><br />
        
        <label for="coNumber">Company Number:</label>
        <input type="text" name="coNumber" value="<%= company.getCoNumber() %>" /><br />
        
        <label for="email">Email:</label>
        <input type="text" name="email" value="<%= company.getEmail() %>" required /><br />
        
        <label for="startDate">Start Date:</label>
        <input type="text" name="startDate" value="<%= (company.getStartDate() != null) ? company.getStartDate().toString() : "" %>" /><br />
        
        <label for="endDate">End Date:</label>
        <input type="text" name="endDate" value="<%= (company.getEndDate() != null) ? company.getEndDate().toString() : "" %>" /><br />
        
        <label for="expoID">Expo ID:</label>
        <input type="text" name="expoID" value="<%= company.getExpoID() %>" /><br />
        
        <label for="status">Status:</label>
        <input type="text" name="status" value="<%= company.getStatus() %>" /><br />
        
        <!-- 다른 필드를 추가할 수 있습니다. -->
        
        <input type="submit" value="Update Company" />
    </form>
</body>
</html>
