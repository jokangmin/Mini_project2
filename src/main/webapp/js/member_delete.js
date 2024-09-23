$(function() {
    const urlParams = new URLSearchParams(window.location.search);
    const userId = urlParams.get('user_id');
    let id;
    let pw;

    $('#member_form').submit(function(event){
        event.preventDefault();
        
        if(confirm('정말로 탈퇴하시겠습니까? 삭제 후에는 다시 로그인할 수 없습니다.')){
            id = $('#delete_id').val();
            pw = $('#delete_pw').val();
            
            if(id === userId){
                $.ajax({
                    url: '../jsp/memberDelete.jsp',
                    type: 'POST',
                    data: {
                        'user_id': id,
                        'user_pw': pw
                    },
                    dataType: 'json', // 응답 데이터 타입을 JSON으로 설정
                    success: function(response) {
                        console.log('회원 탈퇴 응답:', response);
                        if(response.status === 'success') {
                            alert('회원 탈퇴가 완료되었습니다.');
                            sessionStorage.removeItem('isLoggedIn');
                            window.location.href = 'index_main.html';
                        } else {
                            alert('탈퇴 실패: ' + response.message);
                        }
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.log('AJAX 실패:', textStatus, errorThrown);
                        alert('실패.. 에러:' + textStatus);
                    }
                });
            } else {
                alert('로그인 된 가입한 아이디가 아닙니다.');
                window.location.href = 'index_member.html';
            }
        }
    });
});
