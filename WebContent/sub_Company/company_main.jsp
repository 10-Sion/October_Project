<%@page import="VO.CompanyVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();

	String keyWord = "";
	String keyField = "";
	//페이징 처리 변수

	int totalRecord = 0; //board테이블에 저장된 글의 총 개수
	int numPerPage = 5; //한 페이지당 조회해서 보여줄 글 개수
	int pagePerBlock = 3; //한 블럭당 묶여질 페이지 번호 개수 
							// 1 2 3 < - 한블럭으로 묶음

	int totalPage = 0; //총 페이지수
	int totalBlock = 0; //총 블럭수
	int nowPage = 0; //현재 사용자에게 보여지고 있는 페이지가 위치한 번호 저장
	int nowBlock = 0; //클릭한 페이지 번호가 속한 블럭 위치 번호 저장
	int beginPerPage = 0; //각 페이지마다 보여지는 시작 글번호(맨위의 글번호) 저장

	List list = (List) request.getAttribute("CompanyList");
	totalRecord = list.size();

	totalPage = (int) Math.ceil((double) totalRecord / numPerPage);
	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);

	//클릭한 페이지 번호가 속한 블럭 위치 번호 구하기
	if (request.getAttribute("nowBlock") != null) {

		nowBlock = Integer.parseInt(request.getAttribute("nowBlock").toString());

	}

	if (request.getAttribute("nowPage") != null) {
		nowPage = Integer.parseInt(request.getAttribute("nowPage").toString());
	}

	if (request.getAttribute("keyWord") != null) {
		keyField = request.getAttribute("keyField").toString();
		keyWord = request.getAttribute("keyWord").toString();
	}

	beginPerPage = nowPage * numPerPage;

	System.out.print("조회된 글의 갯수 : " + totalRecord);
	System.out.print("현재 블럭 : " + nowBlock);
	System.out.print("현재 페이지 : " + nowPage);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="robots"
	content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/assets/css/main.css">
</head>
<body>

	<!-- Header -->
	<header id="header">
		<a href="index.html" class="logo"><strong>Binary</strong> by
			TEMPLATED</a>
		<nav>
			<a href="#menu">Menu</a>
		</nav>
	</header>
	<!-- Nav -->
	<nav id="menu">
		<ul class="links">
			<li><a href="index.html">Home</a></li>
			<li><a href="generic.html">Generic</a></li>
			<li><a href="elements.html">Elements</a></li>
		</ul>
	</nav>
	<section id="main">
		<div class="inner">
			<div class="image fit">
				<img src="/images/pic11.jpg" alt="">
			</div>
			<header>
				<h1>Lorem ipsum dolor sit amet</h1>
				<p class="info">
					3 days ago by <a href="#">Jane Doe</a>
				</p>
			</header>
			<div align="center" class="table">

		<table>
			<tr>
				<th>참가번호</th>
				<th>기업명</th>
				<th>일정 시작일</th>
				<th>일정 종료일</th>
 			</tr>
 			<%
			if (list.isEmpty()) {
			%>
			<tr>
				<td colspan="4" align="center">등록된 글이 없습니다.</td>
			</tr>
			<%
				} else {

					for (int i = beginPerPage; i < (beginPerPage + numPerPage); i++) {

						if (i == totalRecord) {
							break;
						}
						CompanyVO vo = (CompanyVO)list.get(i);
			%>
			<tr>			
				<th><%=vo.getCoID()%></th>
				<th onclick="location.href='<%=contextPath%>/Company/Info.do?CoId=<%=vo.getCoID()%>'"><%=vo.getCoName()%></th>
				<th><%=vo.getStartDate()%></th>
				<th><%=vo.getEndDate()%></th>
			</tr>

			<%
				} //for 끝
				} //else 끝
			%>  
		</table>
	</div>
		</div>
	</section>
	<!-- Footer -->
	<footer id="footer">
		<ul class="icons">
			<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
			<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
			<li><a href="#" class="icon fa-instagram"><span
					class="label">Instagram</span></a></li>
		</ul>
		<div align="center">
	<table>
		<tr>
			<td>Page to
<%
			if (totalBlock > 0) {

				if (nowBlock > 0) {
%> 
				<a href= "<%=contextPath%>/Company/list.do?nowBlock=<%=nowBlock-1%>&nowPage=<%=(nowBlock-1)*pagePerBlock%>&keyField=<%=keyField%>&keyWord=<%=keyWord%>">
				이전<%=pagePerBlock%>개
				</a> 
<%
 				}

 			}			
 %> 
 
 <%
 				for (int j = 0; j < pagePerBlock; j++) {
 		
 					if ((nowBlock * pagePerBlock) + j == totalPage) {
 						break;
 					}
 %> 																									
 					<a	href= "<%=contextPath%>/Company/list.do?nowBlock=<%=nowBlock%>&nowPage=<%=(nowBlock*pagePerBlock)+j%>&keyField=<%=keyField%>&keyWord=<%=keyWord%>">
					<%=(nowBlock * pagePerBlock)+j+1%>
					</a>
<%
 				if( (nowBlock * pagePerBlock) + 1 + j == totalRecord ){
 					break;
 				}
 			}
 %>
 
 <%		//		4	>	3	s.23
 
 

 			if( totalBlock > nowBlock+1 ){																	
 %>																											
 				<a href= "<%=contextPath%>/Company/list.do?nowBlock=<%=nowBlock+1%>&nowPage=<%=(nowBlock + 1) * pagePerBlock%>&keyField=<%=keyField%>&keyWord=<%=keyWord%>">
				다음<%=pagePerBlock%>개
				</a> 
 <%
 			}
 %>			
 			</td>
		</tr>
	</table>
	</div>
	</footer>
	<div class="copyright">
		Made with: <a href="https://templated.co/">Templated.co</a>
	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>
