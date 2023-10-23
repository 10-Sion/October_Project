<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="VO.CompanyVO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Company</title>
</head>
<body>
    <h1>Edit Company</h1>
    <form action="EventController" method="post">
        <input type="hidden" name="action" value="saveCompanyChanges">
        <input type="hidden" name="coID" value="${company.coID}">
        
        <label for="coName">Company Name:</label>
        <input type="text" name="coName" value="${company.coName}" required><br>
        
        <label for="coDetails">Company Details:</label>
        <input type="text" name="coDetails" value="${company.coDetails}"><br>
        
        <label for="coTel">Company Telephone:</label>
        <input type="text" name="coTel" value="${company.coTel}"><br>
        
        <label for="coNumber">Company Number:</label>
        <input type="text" name="coNumber" value="${company.coNumber}"><br>
        
        <label for="email">Email:</label>
        <input type="email" name="email" value="${company.email}"><br>
        
        <!-- Add more input fields for other company information here -->
        
        <input type="submit" value="Save Changes">
    </form>
    
    <a href="your_original_company_list.jsp">Back to Company List</a>
    <!-- Add any additional content or styling here -->
</body>
</html>
