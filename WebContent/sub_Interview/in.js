function showMsg(success) {
        if (success) {
            alert("신청이 완료되었습니다");
        } else {
            alert("신청을 실패하였습니다");
        }
     // 페이지 리로드
        location.reload();
    }