<%@page import="VO.qnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String loginUser = (String)request.getAttribute("loginUser");
    System.out.println(loginUser);
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
    href="<%=request.getContextPath()%>/mainPage/css/QnAboard.css">
<meta charset="UTF-8">
<title>질문 수정</title>
<style>
</style>
</head>
<body>
	<form action="<%=request.getContextPath() %>/QnA/addQnA.do?loginUser=<%=loginUser %>" method="post">
    <div>
        <h3>자주하는 질문</h3>
        <table border="1">
            <tr>
                <th>질문</th>
                <th>질문 내용</th>
                <th>답변</th>
                <th>작성자</th>
            </tr>
            <tr>
                <td>
                    <input type="text" name="Qtitle" value="">
                </td>
                <td>
                    <input type="text" name="QContent" value="">
                </td>
                <td>
                    <input type="text" name="Answer" value="">
                </td>
                <td>
                    <%=loginUser%>
                </td>
            </tr>
        </table>
        <div style="text-align: center; margin-top: 10px;">
            <input type="submit" value="글 작성">
            <input type="reset" value="다시작성">
            <input type="button" onclick="location.href='<%= request.getContextPath() %>/QnA/QnAlist.do'" value="목록가기">
        </div>
    </div>
    </form>
</body>
</html>
