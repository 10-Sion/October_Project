// Attendee 폼 표시
	    
	    $("#showAttendeeForm").click(function() {
	    	$(".images").hide();
	        $("#attendeeForm").show();
	        $("#companyForm").hide();
	    });
	
	    // Company 폼 표시
	    $("#showCompanyForm").click(function() {
	    	$(".images").hide();
	        $("#attendeeForm").hide();
	        $("#companyForm").show();
	    });
	
	
// Expo 선택 변경 처리
$(document).ready(function () {
    $("#expoSelect").on("change", function () {
	
        var selectedExpoID = $(this).val();

        if (selectedExpoID) {
            $.ajax({
                type: "POST",
                url: "/Event/SelectWhat",
                data: { expoID: selectedExpoID },
                dataType: "json",
                success: function (data) {
                    var startDate = new Date(data.expoStartSched).toISOString().split('T')[0];
                    var endDate = new Date(data.expoEndSched).toISOString().split('T')[0];

                    $("input[name='startDate']").val(startDate);
                    $("input[name='endDate']").val(endDate);
                },
                error: function () {
                    console.log("서버로부터 Expo 정보를 가져오던 중 오류.");
                }
            });
        }
    });
});
