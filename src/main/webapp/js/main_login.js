$(function(){
	$('ul.main_menu > li > .nav_link').hide(); //숨기기
	
	$('ul.main_menu > li').hover(function(){ //마우스를 올렸을떄 슬라이드 다운
		$(this).find('.nav_link').slideDown(300);
	},function(){
		$('.nav_link').slideUp(400);
	});
	//-----------------------------------------------------------------------
	$('#user_id, #user_pw').bind({
		'focus' : function(){
			$(this).addClass('active');
		},
		'blur' : function(){
			$(this).removeClass('active');
		},
	});
	//-----------------------------------------------------------------------
	$('#user_id').blur(function(){
		$('#checkId').empty();
		var user_id  = $('#user_id').val();
		if(!user_id){
			$('#checkId').text("아이디를 입력하세요");
			return false;
		}//if
	});
	
	$('#user_pw').blur(function(){
		$('#checkPw').empty();
		var user_pw  = $('#user_pw').val();
		if(!user_pw){
			$('#checkPw').text("비밀번호를 입력하세요");
			return false;
		}//if
	});

	//-----------------------------------------------------------------------
	$('#login_form').submit(function(){
		var user_id  = $('input[name="user_id"]').val();
		if(!user_id){
			$('#checkId').text("아이디를 입력하세요");
			$('input[name="user_id"]').focus();
			return false;
		}//if
		
		var user_pw  = $('input[name="user_pw"]').val();
		if(!user_pw){
			$('#checkPw').text("비밀번호를 입력하세요");
			$('input[name="user_pw"]').focus();
			return false;
		}//if
		
		$('#login_form .loader').show();
		
		$.post('../jsp/login_main.jsp',
			   $(this).serialize(),
			   function(data){
				   let message = $(data).find('message').text();
				   alert(message);
				   if(message == '로그인 되었습니다.'){
						sessionStorage.setItem('isLoggedIn', 'true');
						window.location.href = 'index_member.html?user_id='+user_id;
				   }
			   }).fail(function(e){
				   alert('로그인 실패! 다시 로그인 하세요. 에러:' + e);
			   }).always(function(){
				   $('#login_form .loader').hide();
			   });
		
		return false;
	});
	//-----------------------------------------------------------------------
});