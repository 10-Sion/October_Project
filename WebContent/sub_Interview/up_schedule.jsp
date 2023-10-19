<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<%String sessionUser = (String) session.getAttribute("loginUser"); %>
    <meta charset="UTF-8">
    <title>기업 면접 일정 수정</title>
</head>
<body>
<jsp:include page="../sub_Event/subTop.jsp"/>
<h1>기업 면접 일정 수정</h1>

<%-- 면접 일정을 수정하기 위한 폼 --%>
<form action="<%= request.getContextPath() %>/In_Controller3" method="post">
    <input type="hidden" name="action" value="updateSchedule">
    <input type="hidden" name="schID" value="${schedule.schID}">

    <label for="intvwDate">면접 날짜:</label>
    <input type="date" id="intvwDate" name="intvwDate" value="${schedule.intvwDate}"><br>

    <label for="intvwTime">면접 시간:</label>
    <input type="time" id="intvwTime" name="intvwTime" value="${schedule.intvwTime}"><br>
    
    <label for="status">신청 상태:</label>
    <input type="text" id="status" name="status" value="${schedule.status}"><br>
    
 <!--    <script>
    // JavaScript를 사용하여 초를 00초로 설정
    document.getElementById("intvwTime").addEventListener("change", function () {
        var timeInput = this.value;
        if (timeInput && !/:00$/.test(timeInput)) {
            this.value = timeInput + ":00";
        }
    });
</script> -->

    <label for="coID">기업 참가번호:</label>
    <input type="text" id="coID" name="coID" value="${schedule.coID}" readonly><br>

    <button type="submit">수정</button>
</form>

<%-- 기타 내용 추가 가능 --%>

</body>
</html>
