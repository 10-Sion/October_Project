function acceptAllCompanies() {
    $.ajax({
        type: 'POST',
        url: '/ChuiUpExpo/Event?action=acceptAllCompanies',
        success: function (response) {
            // 업데이트가 성공한 경우 UI를 업데이트합니다.
            // 예: 리스트를 다시 로드하거나 업데이트된 정보를 반영합니다.
            alert('All companies have been accepted successfully.');
        },
        error: function (error) {
            // 에러를 처리합니다.
            alert('Error accepting all companies.');
        }
    });
}

function acceptAllAttendees() {
    $.ajax({
        type: 'POST',
        url: '/ChuiUpExpo/Event?action=acceptAllAttendees',
        success: function (response) {
            // 업데이트가 성공한 경우 UI를 업데이트합니다.
            // 예: 리스트를 다시 로드하거나 업데이트된 정보를 반영합니다.
            alert('All attendees have been accepted successfully.');
        },
        error: function (error) {
            // 에러를 처리합니다.
            alert('Error accepting all attendees.');
        }
    });
}


