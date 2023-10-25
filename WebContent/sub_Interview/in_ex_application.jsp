<%@page import="VO.In_ScheduleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="VO.AttendeeVO" %>
<%@ page import="DAO.AttendeeDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="VO.ExpoInfoVO" %>
<%@ page import="DAO.ExpoInfoDAO" %>
<%@ page import="DAO.CompanyDAO" %>
<%@ page import="VO.CompanyVO" %>

 <%
// 로그인한 사용자의 이메일을 세션에서 가져옵니다.
String userEmail = (String) session.getAttribute("loginUser");
  String path = request.getContextPath();

// AttendeeDAO를 사용하여 참가자 정보를 가져옵니다.
AttendeeDAO attendeeDAO = new AttendeeDAO();
AttendeeVO attendee = attendeeDAO.getAttendeeByEmail(userEmail);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="robots"
	content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=path%>/sub_Event/assets/css/main.css">

    <title>로그인 회원 개인 온라인 면접 신청</title>
</head>
<body>
<jsp:include page="../sub_Event/subTop.jsp" />
<section id="main">
		<div class="inner">

    <h1 align="center">온라인 면접 신청</h1>

 

<p>참가자명: <%= attendee.getAtndName() %></p>
<p>이메일: <%= attendee.getEmail() %></p>


	<!-- 아래 IntvwApplicant 테이블 저장 -->
    
    <form action="/ChuiUpExpo/In_Controller3" method="post">
    <input type="hidden" name="action" value="add_in_ex">
    <input type="hidden" name="userEmail" value="<%= userEmail %>">
 
        <label for="coName">면접 기업:</label>
		<select name="coName1">
		<option value="" disabled selected>선택하세요.</option>
		
		    <%
		    CompanyDAO companyDAO = new CompanyDAO();
		    List<In_ScheduleVO> companyList = companyDAO.getAllIntvwSched();
		    
		    for (In_ScheduleVO company : companyList) {
		    	int coid = company.getCoID();
		    	String name = companyDAO.getCoName(coid);
		    %>
		    <!-- 사용자는 기업명을 선택하고, 값을 선택하면 해당 기업의 ID값을 받아 옴 -->
		        <option value="<%=name%>"><%=name%></option>
		    <%
		    }
		    %>
		</select> 

       <br><br>
        <button type="submit">신청</button>
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
    
  <script type="text/javascript">
	function showMsg(success) {
        if (success) {
            alert("신청이 완료되었습니다");
        } else {
            alert("신청을 실패하였습니다");
        }
     // 페이지 리로드
        location.reload();
    }
	</script>
    
</body>
</html>
