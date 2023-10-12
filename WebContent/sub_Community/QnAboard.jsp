<%@page import="VO.qnaVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList qlist = (ArrayList)request.getAttribute("qlist");
	qnaVO qVo = new qnaVO();
	
%>
<!DOCTYPE html>
<html>
<head>
<style>
    table {
        width: 100%;
        border: 1px solid #000;
    }
    th, td {
        text-align: center;
        vertical-align: middle;
    }
    th {
        background-color: green;
        color: white;
    }

    /* 추가된 스타일 */
    .answer {
        display: none;
        background-color: #f0f0f0;
        padding: 10px;
    }
</style>
<meta charset="UTF-8">
<title>자주하는 질문</title>
<script>
    function toggleAnswer(row) {
        var answerDiv = row.querySelector(".answer");
        if (answerDiv.style.display === "none") {
            answerDiv.style.display = "block";
        } else {
            answerDiv.style.display = "none";
        }
    }
</script>
</head>
<body>
	<h3>자주하는질문</h3>
	<table border="1">
		<tr bgcolor="green">
			<th>번호</th>
			<th>질문</th>
			<th>질문 내용</th>
			<th>작성일</th>
			<th>작성자</th>
		</tr>
<%
	for(int i=0; i<qlist.size(); i++){
		qVo = (qnaVO)qlist.get(i);
%>
		<tr>
			<td><%=qVo.getFaqid() %></td>
			<td onclick="toggleAnswer(this)"><%=qVo.getQtitle() %></td>
			<td><%=qVo.getQContent() %></td>
			<td><%=qVo.getQdata() %></td>
			<td><%=qVo.getPoster() %></td>
		</tr>
		<tr class="answer">
			<td colspan="5">
				<div style="display: none;">
					<%=qVo.getAnswer() %>
				</div>
			</td>
		</tr>
<%
	}
%>
	</table>
</body>
</html>