<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%
    // 세션을 삭제
    session.invalidate();
    // index.jsp로 리다이렉트
    response.sendRedirect(request.getContextPath() + "/mainPage/index.jsp");
%>