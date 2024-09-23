$(function(){
	let pw_state = false;
	
	$('#check_pw').empty();
	$('#check_id').empty();
	$('#check_name').empty();
	
	$('ul.main_menu > li > .nav_link').hide(); //숨기기
		
	$('ul.main_menu > li').hover(function(){ //마우스를 올렸을떄 슬라이드 다운
		$(this).find('.nav_link').slideDown(300);
	},function(){
		$('.nav_link').slideUp(400);
	});
	
	$('#email2_sel').change(function(){
		var sel_value = $('#email2_sel').val();
		$('#email2').val(sel_value);
		if(sel_value == ""){
			$('#email2').focus();
		}
	});
	
	$('#name').focus(function(){
		$('#check_name').empty();
	});
	
	$('#name').focusout(function(){
		$('#check_name').empty();
		if(!$(this).val()){
			$('#check_name').text(" 이름을 입력해주세요. ");
		}
	});
	
	$('#id').focus(function(){
		$('#check_id').empty();
	});
	
	$('#pwd_check').focusout(function(){
		$('#check_pw').empty();
		var my_pwd = $('#pwd').val();
		if($('#pwd_check').val() != my_pwd){
			pw_state = false;
			$('#check_pw').text(" 비밀번호가 일치하지 않습니다. ");
		}
		else{
			pw_state = true;
		}
	});
	
	$('#pwd_check').focus(function(){
		$('#check_pw').empty();
	});

	$('#id').focusout(function(){
		$('#check_id').empty();
		if(!$('#id').val()){
			$('#check_id').text(" 아이디를 입력해주세요. ");
		}
		else{
			$.ajax({
				type : 'get',              
				url : '${ pageContext.request.contextPath }/member/checkId.do', 
				data: { id : $('#id').val() }, 
				dataType : 'text',      
				success : function(data) {
					data = data.trim();
					 if(data === "false"){
						$('#user_check').text("사용 불가능");
						$('#id').focus();
						$('#id_state').val(data);
					 }
					 else if(data === "true"){
						$('#user_check').text("사용 가능");
						$('#pwd').focus();
						$('#id_state').val(data);
					 }
					 else{
						$('#user_check').text(data);
					 }
				},    
				error : function(e) {        
					console.log(e);
				}
			});
		}
	});
	
	$('#write_button').click(function(){
		if(!$('#name').val() && !$('#id').val() && !$('#pwd').val() && !$('#email1').val() 
			&& !$('#email2').val() && !$('#tel2').val() && !$('#tel3').val() && !$('#zipcode').val()
			&& !$('#addr1').val() && !$('#addr2').val() && !$('#pwd_check').val()){
			alert("정보를 모두 입력해주세요.");
		}
		else{
			if(!pw_state){
				alert("비밀번호를 다시 한 번 확인해주세요.");
			}
			else if($('#id_state').val() != "true"){
				alert("아이디를 확인해주세요.");
			}
			else{
				$('#member_form').submit();
			}
		}
	});
	
});