<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function myFunction() {
    // db에서 30초마다 면접 날짜 데이터를 가져와서 현재 서버 시간이랑 비교
    // 면젒 시간이 1일 전인 사람의 데이터를 dao에서 조회
    // dao1.select 면접정보(참가자정보 포함) from 면접정보테이블 where DATEDIFF('면접시간','서버시간')  면접시간-서버 데이터
    // dao2.select 참가자 정보 from 참가자 테이블 where 참가자id = 위에서 가져온 참가자 id
    // 참가자 정보에 해당하는 카톡 데이터로 메세지 전송
    console.log('함수가 1분마다 실행됩니다.');
}


setInterval(myFunction, 30000);
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>