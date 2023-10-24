<%@page import="java.util.List"%>
<%@page import="VO.In_ScheduleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<%String sessionUser = (String) session.getAttribute("loginUser"); %>
<head>
    <meta charset="UTF-8">
    <title>면접 일정 목록 - 승인된 일정</title>
</head>
<body>
    <jsp:include page="../sub_Event/subTop.jsp" />



            <h1 align="center">면접 일정 목록 - 승인된 일정</h1>
            <table>
                <tr>
                    <th>일정 ID</th>
                    <th>면접 날짜</th>
                    <th>면접 시간</th>
                    <th>기업 참가번호</th>
                    <th>상태</th>
                </tr>

                <c:forEach var="schedule" items="${approvedSchedules}">
                    <tr>
                        <td>${schedule.schID}</td>
                        <td>${schedule.intvwDate}</td>
                        <td>${schedule.intvwTime}</td>
                        <td>${schedule.coID}</td>
                        <td>${schedule.status}</td>
                    </tr>
                </c:forEach>
            </table>

    
</body>
</html>
