$(function(){
	let result = false;
	let state = true;
	
	$('ul.main_menu > li > .nav_link').hide(); //숨기기
	
	$('ul.main_menu > li').hover(function(){ //마우스를 올렸을떄 슬라이드 다운
		$(this).find('.nav_link').slideDown(300);
	},function(){
		$('.nav_link').slideUp(400);
	});
	
	//-----------------------------------------------------------------------
	$('#customFloatingUsername2').focusout(function(){
		let input_id = $(this).val();
		$('#idcheck').empty();
		$.post('../jsp/id_check.jsp',
				{'user_id' : input_id},
				function(data){
					let message = $(data).find('message').text();
					let result_text = $(data).find('result').text();
					result = eval(result_text);
					
					if(!result){
						$('#idcheck').empty();
					}else{
						$('#idcheck').append(message);
						$(this).focus();
					}
					
			}).fail(function(e){
			   alert('로그인 실패! 다시 로그인 하세요. 에러:' + e);
		   }).always(function(){
	
			   $('#login_form .loader').hide();
		   });
	});
	//-----------------------------------------------------------------------
	$('#signup_form').submit(function(){
		event.preventDefault();
		
		let user_name = $('#customFloatingName2').val();
		let user_id = $('#customFloatingUsername2').val();
		let user_pw = $('#customFloatingPassword2').val();
		let user_phone = $('#customFloatingPhone2').val();
		if(!user_name || !user_id || !user_pw || !user_phone){
	        alert("정보를 모두 입력해주세요.");
	    }
		else{
			if(!result){
				$.post('../jsp/signup.jsp',
					{'user_name' : user_name ,
					 'user_id' : user_id,
					 'user_pw' : user_pw,
					 'user_phone' : user_phone
					},
					function(data){
						alert("회원가입에 성공했습니다!");
						window.location.href = 'login.html';
					
				}).fail(function(e){
				   alert('회원가입 실패. . . 확인해보세요. 에러:' + e);
			    }).always(function(){
				   $('#login_form .loader').hide();
			    });
			}
			else{
				alert("아이디를 확인해주세요.");
			}
		}
	});
	//-----------------------------------------------------------------------
	$('#memberinbutton').click(function(){
		if(state && result){ //초기 상태, 로그인이 안 된 상태 
			$('#memberinbuttonis').text('회원정보').attr('href', 'index_member.html');
			state = false;
		}
	});
});