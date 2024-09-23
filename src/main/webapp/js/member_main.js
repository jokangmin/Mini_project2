$(function() {
	//전에 있던 값 가지고오기
	const urlParams = new URLSearchParams(window.location.search);
	const userId = urlParams.get('user_id');
	let name;
	let id;
	let pw;
	let phone;
	
	//값 불러오기
	$.post('../jsp/memberdata.jsp',
			{'user_id' : userId},
			function(data){
			   name = $(data).find('name').text();
			   id = $(data).find('id').text();
			   pw = $(data).find('pw').text();
			   phone = $(data).find('phone').text();
			   
			   $('#name_data').attr('placeHolder',name);
			   $('#name_data').val(name);
			   $('#id_data').text(id);
			   $('#pw_data').attr('placeHolder',pw);
			   $('#pw_data').val(pw);
			   $('#phone_data').attr('placeHolder',phone);
			   $('#phone_data').val(phone);
					
			}).fail(function(e){
			   alert('불러오기 실패.. 에러:' + e);
			});
			
	//멤버 수정 버튼
	$('#update_member_button').click(function(){
		if(confirm('정말로 수정하시겠습니까?')){
			name = $('#name_data').val();
			pw = $('#pw_data').val();
			phone = $('#phone_data').val();
			$.post('../jsp/memberUpdate.jsp',
					{'user_id' : userId,
					 'user_name' : name,
					 'user_pw' : pw,
					 'user_phone' : phone
					},
					function(){
					  alert('회원정보 수정이 완료되었습니다.');
					  location.reload();
							
					}).fail(function(e){
					   alert('불러오기 실패.. 에러:' + e);
					});
		}
	});
	
	//멤버 삭제 버튼
	$('#delete_member_button').click(function(){
		if(confirm('정말로 회원탈퇴 하시겠습니까?')){
			window.location.href = 'delete_member.html?user_id='+userId;
		}
	});
});
	
