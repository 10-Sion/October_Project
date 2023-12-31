<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="VO.ExpoInfoVO" %>
<%@ page import="DAO.ExpoInfoDAO" %>

<!DOCTYPE html>
<html>
<head>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <meta charset="UTF-8">
    <title>SaJeon</title>
</head>
<body>
    <jsp:include page="subTop.jsp"/>
    
    <section id="main">
		<div class="inner apply">
		
    <button id="showAttendeeForm">개인</button>
	<button id="showCompanyForm">기업</button>
    
    <div class="images">
    <img src="images/apply.jpeg">
    <h1>사전 등록 신청</h1>
    </div>
    
    <!-- 일반 참가자 입력 폼 -->
    <div id="attendeeForm" style="display: none;">
    <form action="/ChuiUpExpo/Event?action=addAttendee" method="post">
    <h1>박람회 신청</h1>
    
        <label for="atndName">참가자명:</label>
        <input type="text" id="atndName" name="atndName" required><br><br>
        
        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" required><br><br>
        
        <label for="passwd">비밀번호:</label>
        <input type="password" id="passwd" name="passwd" required><br><br>
        
        <label for="expoID">박람회 선택:</label><br>
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
        
        <input type="submit" value="신청">
        
    </form>
    </div>
    
    
    <!-- 기업 정보 입력 폼 -->
    <div id="companyForm" style="display: none;">
    <form action="/ChuiUpExpo/Event?action=addCompany" method="post">
    <h1>박람회 신청</h1>
    
        <label for="coName">기업명:</label>
        <input type="text" id="coName" name="coName" required><br><br>
        
        <label for="coDetails">기업 상세정보:</label>
        <input type="text" id="coDetails" name="coDetails" required><br><br>
        
        <label for="coTel">기업 전화번호:</label>
        <input type="text" id="co_tel" name="co_tel" required><br><br>
        
        <label for="coNumber">기업 사업자번호:</label>
        <input type="text" id="co_number" name="co_number" required><br><br>
        
        <label for="email">기업 이메일:</label>
        <input type="email" id="email" name="email" required><br><br>
        
        <label for="passwd">비밀번호:</label>
        <input type="password" id="passwd" name="passwd" required><br><br>
        
        <% 
		    // 선택한 expoID에 해당하는 ExpoInfoVO 객체
		    int selectedExpoID;
		    String expoIDParam = request.getParameter("expoID");
		    
		    if (expoIDParam != null && !expoIDParam.isEmpty()) {
		        selectedExpoID = Integer.parseInt(expoIDParam);
		        
		    } else {
		        selectedExpoID = 1;
		        
		    }
		
		    ExpoInfoVO selectedExpo = null;
		    for (ExpoInfoVO expo : expoInfoList) {
		    	
		        if (expo.getExpoID() == selectedExpoID) {
		            selectedExpo = expo;
		            break;
		            
		        }
    		}
		    
		    if (selectedExpo != null) {
		        // 선택한 expoID에 해당하는 ExpoInfoVO에서 ExpoStartSched 및 ExpoEndSched 가져오기
		        Date expoStartSched = selectedExpo.getExpoStartSched();
		        Date expoEndSched = selectedExpo.getExpoEndSched();
		%>
		        <label for="startDate">StartDate:</label>
		        <input type="date" name="startDate" value="<%= expoStartSched %>" min="<%= expoStartSched %>" max="<%= expoEndSched %>">
		        
		        <label for="endDate">EndDate:</label>
		        <input type="date" name="endDate" value="<%= expoStartSched %>" min="<%= expoStartSched %>" max="<%= expoEndSched %>">
		<%
		    }
		%>

        <label for="expoID">박람회 선택:</label><br>
		<select name="expoID" id="expoSelect">
		    <option value="" disabled selected>선택하세요.</option>
		    <%
		        for (ExpoInfoVO expo : expoInfoList) {
		    %>
		        <option value="<%= expo.getExpoID() %>"><%= expo.getExpoName() %></option>
		    <%
		        }
		    %>
		</select>

    	<input type="submit" value="신청">
    </form>
    </div>
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
   	<script src="assets/js/selectWarigari.js"></script>
    	
</body>
</html>
