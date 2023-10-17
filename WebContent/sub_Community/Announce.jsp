<%@page import="VO.AnnounceVO"%>
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

	List list = (List)request.getAttribute("AnnounceList");
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

	
	if(request.getAttribute("keyWord") != null){
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
<title>Insert title here</title>
<script type="text/javascript">
	function check() {
		if (document.search.keyWord.value == "") {
			alert("검색어를 입력하세요.");
			document.search.keyWord.focus();
			return;
		}
		document.search.submit();
	}
</script>
</head>
<body>
	<h1 align="center">공지사항</h1>
	<form action="<%=contextPath%>/Lecture/ProLectureList.do" name="search"
		method="post">
		<table border=0 width=527 align=center cellpadding=4 cellspacing=0>
			<td align=center valign=bottom><select name="keyField" size="1">
					<option value="AnnTitle">제목</option>
					<option value="AnnContent">내용</option>
			</select> <input type="text" size="16" name="keyWord"> <input
				type="button" value="찾기" onClick="check()"> <input
				type="hidden" name="page" value="0"></td>
		</table>
	</form>
	<div align="center" class="table">

		<table>
			<tr>
				<th>공지번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
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
						AnnounceVO vo = (AnnounceVO)list.get(i);
			%>
			<tr>			
				<th><%=vo.getAnnID()%></th>
				<th><%=vo.getAnnTitle()%></th>
				<th><%=vo.getPoster()%></th>
				<th><%=vo.getPostDate()%></th>
			</tr>

			<%
				} //for 끝
				} //else 끝
			%>  
		</table>
	</div>
</body>
<footer>
	<div align="center">
	<table>
		<tr>
			<td>Page to
<%
			if (totalBlock > 0) {

				if (nowBlock > 0) {
%> 
				<a href= "<%=contextPath%>/Ann/list.do?nowBlock=<%=nowBlock-1%>&nowPage=<%=(nowBlock-1)*pagePerBlock%>&keyField=<%=keyField%>&keyWord=<%=keyWord%>">
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
 					<a	href= "<%=contextPath%>/Ann/list.do?nowBlock=<%=nowBlock%>&nowPage=<%=(nowBlock*pagePerBlock)+j%>&keyField=<%=keyField%>&keyWord=<%=keyWord%>">
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
 				<a href= "<%=contextPath%>/Ann/list.do?nowBlock=<%=nowBlock+1%>&nowPage=<%=(nowBlock + 1) * pagePerBlock%>&keyField=<%=keyField%>&keyWord=<%=keyWord%>">
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
</html>