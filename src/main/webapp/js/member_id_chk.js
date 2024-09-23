$(function() {
	
    $('#member_form .loader').hide();

    $('#member_form').submit(function(event) {
        event.preventDefault(); // 폼이 제출되는 것을 막음
        let user_id = $('#member_id_chk').val();

        $.post('../jsp/id_check.jsp', 
            { 'user_id': user_id }, 
            function(data) {
                let result_text = $(data).find('result').text().trim();
                let result = (result_text === 'true');

                if (!result) {
					alert("아이디를 확인해주세요");
                } else {
                    window.location.href = 'main_member.html?user_id='+user_id;
                }
            })
            .fail(function(e) {
                alert('아이디 확인 실패! 에러: ' + e.statusText);
            })
            .always(function() {
                $('#member_form .loader').hide();
            });

        $('#member_form .loader').show();
    });
});
