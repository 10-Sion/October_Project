
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="DAO.In_ApplicantDAO" %>
<%@ page import="VO.In_ApplicantVO" %>
<%@ page import="DAO.In_ScheduleDAO" %>
<%@ page import="VO.In_ScheduleVO" %>

<!DOCTYPE html>
<html>
<head>
<%String sessionUser = (String) session.getAttribute("loginUser"); %>



    <meta charset="UTF-8">
    <title>면접 관리자 페이지</title>
</head>
<body>


<h1>면접 관리자 페이지</h1>

<!-- 면접 신청 정보 -->
<h2>면접 신청 정보</h2>
<table>
    <tr>
        <th>신청 ID</th>
        <th>신청자 ID</th>
        <th>일정 ID</th>
        <th>상태</th>
        <th>액션</th>
    </tr>
    
    <%
	// In_ApplicantDAO 객체를 선언하고 초기화합니다.
	In_ApplicantDAO applicantDAO = new In_ApplicantDAO();
	// 데이터베이스에서 면접 신청 정보를 가져옵니다.
	List<In_ApplicantVO> applicants = applicantDAO.getAllApplicants();
	
//	System.out.println(applicants.size());
	
	%>
    <c:set  var="list" value="<%=applicants%>" />
    
    <c:forEach var="applicant" items="${list}">
        <tr>
            <td>${applicant.appID}</td>
            <td>${applicant.atndID}</td>
            <td>${applicant.schID}</td>
            <td>${applicant.status}</td>
            <td>
                <!-- 승인 버튼 -->
                <a href="<%= request.getContextPath() %>/In_Controller?action=approveApplicant&appID=${applicant.appID}">승인</a>
                
                <!-- 수정 버튼 -->
				<a href="<%= request.getContextPath() %>/In_Controller?action=updateApplicant&appID=${applicant.appID}">수정</a>

                
                <!-- 삭제 버튼 -->
                <a href="<%= request.getContextPath() %>/In_Controller?action=deleteApplicant&appID=${applicant.appID}">삭제</a>
            </td>
        </tr>
    </c:forEach>
</table>
<!-- 승인된 목록 버튼 -->
<a href="<%= request.getContextPath() %>/In_Controller?action=approvedList">면접 신청 승인된 목록</a>

<!-- 면접 일정 정보 -->
<h2>면접 일정 정보</h2>
<table>
    <tr>
        <th>일정 ID</th>
        <th>면접 날짜</th>
        <th>면접 시간</th>
        <th>회사 ID</th>
        <th>액션</th>
    </tr>
    
    <%
	// In_ApplicantDAO 객체를 선언하고 초기화합니다.
	In_ScheduleDAO scheduleDAO = new In_ScheduleDAO();
	// 데이터베이스에서 면접 신청 정보를 가져옵니다.
	List<In_ScheduleVO> schedule = scheduleDAO.getAllSchedules();
	
	%>
	<c:set  var="all" value="<%=schedule%>" />
    
    <c:forEach var="schedule" items="${all}">
        <tr>
            <td>${schedule.schID}</td>
            <td>${schedule.intvwDate}</td>
            <td>${schedule.intvwTime}</td>
            <td>${schedule.coID}</td>
            <td>
                <!-- 승인 버튼 -->
                <a href="<%= request.getContextPath() %>/In_Controller?action=approveSchedule&schID=${schedule.schID}">승인</a>
                
                <!-- 수정 버튼 -->
                <a href="<%= request.getContextPath() %>/In_Controller?action=updateSchedule&schID=${schedule.schID}">수정</a>
                
                <!-- 삭제 버튼 -->
                <a href="<%= request.getContextPath() %>/In_Controller?action=deleteSchedule&schID=${schedule.schID}">삭제</a>
            </td>
        </tr>
    </c:forEach>
</table>

<!-- 기타 관리자 기능 추가 가능 -->

</body>
</html>
