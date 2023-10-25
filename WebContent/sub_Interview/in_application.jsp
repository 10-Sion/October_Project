<%@page import="VO.ExpoInfoVO"%>
<%@page import="DAO.ExpoInfoDAO"%>
<%@page import="VO.CompanyVO"%>
<%@page import="java.util.List"%>
<%@page import="DAO.CompanyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sessionUser = (String) session.getAttribute("loginUser");
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="robots"
	content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=path%>/sub_Event/assets/css/main.css">
<body>			
	<jsp:include page="../sub_Event/subTop.jsp"/>
	<section id="main">
		<div class="inner">
    <!-- 면접 신청 양식 -->
    <h2 align="center">면접 신청</h2>
	 	<form action="/ChuiUpExpo/In_Controller3" method="post">
         <input type="hidden" name="action" value="addAttendee">
    
    <label for="atndName">신청자 이름:</label>
        <input type="text" id="atndName" name="atndName" required><br><br>
        
        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" required><br><br>
        
        <label for="passwd">비밀번호:</label>
        <input type="password" id="passwd" name="passwd" required><br><br>
        
        <label for="expoID">참가 박람회:</label><br>
        <select name="expoID">
            <option value="" disabled selected>선택하세요.</option>
            <%
                ExpoInfoDAO expoInfoDAO = new ExpoInfoDAO();
                List<ExpoInfoVO> expoInfoList = expoInfoDAO.getAllExpos();
                for (ExpoInfoVO expo : expoInfoList) {
            %>
                <option value="<%= expo.getExpoID() %>"><%= expo.getExpoName() %></option>
            <%
                }
            %>
        </select>
    	<br><br>

         <input type="hidden" name="action" value="addAttendee">
 
        <label for="coName">면접 기업:</label>
		<select name="coName1">
		<option value="" disabled selected>선택하세요.</option>
		
		    <%
		    CompanyDAO companyDAO = new CompanyDAO();
		    List<CompanyVO> companyList = companyDAO.getAllCompanies();
		    
		    for (CompanyVO company : companyList) {
		    %>
		    
		    <!-- 사용자는 기업명을 선택하고, 값을 선택하면 해당 기업의 ID값을 받아 옴 -->
		        <option value="<%= company.getCoName() %>"><%= company.getCoName() %></option>
		    <%
		    }
		    %>
		</select> 

       <br><br>
        <input type="submit" value="신청" onclick="showMsg(true)">

    </form>
		</div>
	</section>
    <footer id="footer">
        <ul class="icons">
            <li><a href="https://twitter.com/jjencshk" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
            <li><a href="https://www.facebook.com/yeilit/?locale=ko_KR" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
            <li><a href="https://www.instagram.com/b.yeil_official/" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
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