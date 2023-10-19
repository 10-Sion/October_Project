<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="VO.ExpoInfoVO" %>
<%@ page import="DAO.ExpoInfoDAO" %>
<%@ page import="DAO.CompanyDAO" %>
<%@ page import="VO.CompanyVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<%= request.getContextPath() %>/In_Controller" method="post">
         <input type="hidden" name="action" value="addAttendee">
 
        <label for="coName">면접 기업:</label>
		<select name="coName1">
		<option value="" disabled selected>선택하세요.</option>
		
		    <%
// 		    CompanyDAO companyDAO = new CompanyDAO();
// 		    List<CompanyVO> companyList = companyDAO.getAllCompanies();
		    
			String[]  str = {"기업1","기업2","기업3","기업4","기업5"};
		    for (String s : str) {
		    %>
		    
		    <!-- 사용자는 기업명을 선택하고, 값을 선택하면 해당 기업의 ID값을 받아 옴 -->
		        <option value="<%=s%>"><%=s%></option>
		    <%
		    }
		    %>
		</select> 

       <br><br>
        <input type="submit" value="신청">
    </form>
	
</body>
</html>