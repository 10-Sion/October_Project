<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String loginUser = (String)session.getAttribute("loginUser");
    System.out.println(loginUser);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 등록</title>
<style>
    .center-div {
        text-align: center;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        justify-content: flex-start;
        height: 100vh;
    }
    .form-container {
        text-align: left;
        width: 300px; /* 또는 원하는 너비로 설정 */
        margin: 0 auto;
    }
</style>
</head>
<body>
    <div class="center-div">
        <div class="form-container" >
        <h3>질문 등록</h3>
            <form action="<%=request.getContextPath()%>/QnA/addQnA.do?loginUser=<%=loginUser %>" method="post">
                <table>
                    <tr>
                        <td>
                            <label for="title">제목:</label>
                            <input type="text" id="title" name="title" required>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="content">질문 내용:</label><br>
                            <textarea id="content" name="content" rows="5" cols="40" required></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="submit">등록</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>
</html>
