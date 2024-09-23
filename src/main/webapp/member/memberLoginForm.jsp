<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<link rel="stylesheet" href="../css/login.css">
</head>
<body>
<img src="../image/odiga_logo.png" width="120" height="55" alt="home" 
		onclick="location='${ pageContext.request.contextPath }/index/index_main.do'" style="cursor: pointer;">
	<div class="col-sm-12">
        <div class="alert fade alert-simple alert-warning alert-dismissible text-left font__family-montserrat font__size-16 font__weight-light brk-library-rendered rendered show" role="alert" data-brk-library="component__alert">
          <button type="button" class="close" data-dismiss="alert">
									<span aria-hidden="true">
										<i class="fa fa-times warning"></i>
									</span>
									<span class="sr-only">X</span>
								</button>
          <i class="start-icon fa fa-exclamation-triangle faa-flash animated"></i>
          <strong class="font__weight-semibold">Warning!</strong><p id="check_m">!!!!</p>
        </div>
      </div>
	<div class="login-box">
	  <h2>Login</h2>
	  	<form action="${ pageContext.request.contextPath }/member/memberLogin.do" method="post" id="login_form">
		    <div class="user-box">
			    <input type="text" name="id" id="id" value="${ save_id }" required="">
			    <label>User ID</label>
		    </div>
		    <div class="user-box">
				<input type="password" name="pwd" id="pwd" required="">
			    <label>Password</label>
		    </div>
		    <div id="id_check_box_div">
		   		<label for="id_check_box" id="id_check_box_text">ID Save</label>
		   		<input type="checkbox" name="id_check_box" id="id_check_box"/>
		    </div>
		    <div>
		    	<input type="button" value= "login" name="login_button" id="login_button">
		    </div>
		    <input type="hidden" id="id_state_check" name="id_state_check" value="false"/>
	    </form>
	</div>
	
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$('.col-sm-12').hide();//경고창 숨기기
		
	$('#id_check_box').change(function() {
	    if ($(this).is(':checked')) {
	        $('#id_state_check').val(true);
	    }
	});//체크박스 상태 체크
	
	$('#id').focusout(function(){
		$('#check_m').empty();
		if(!$('#id').val()){
			$('.col-sm-12').show();
			$('#check_m').text("로그인을 위해 아이디를 입력하세요");
			$('#id').focus();
		}
		else{
			$('.col-sm-12').hide();
			$('#check_m').empty();
		}
	});//아이디 입력 확인
	
	$('#pwd').focusout(function(){
		$('#check_m').empty();
		if(!$('#pwd').val()){
			$('.col-sm-12').show();
			$('#check_m').text("로그인을 위해 비밀번호를 입력하세요");
			$('#pwd').focus();
		}
		else{
			$('.col-sm-12').hide();
			$('#check_m').empty();
		}
	});//비밀번호 입력 확인
	
	$('.close').click(function(){
		$('.col-sm-12').hide();
	});//경고창 끄기
	
	
	$('#login_button').click(function(){
		$('.col-sm-12').hide();
		if(!$('#id').val() && !$('#pwd').val()){
			$('.col-sm-12').show();
			$('#check_m').text("아이디와 비밀번호를 모두 입력해주세요.");
		}
		else{
			$('#check_m').empty();
			$.ajax({
				type : 'get',              
				url : '${ pageContext.request.contextPath }/member/memberLogin.do', 
				data: { id : $('#id').val(),
						pwd : $('#pwd').val(),
						id_state_check : $('#id_state_check').val()
				}, 
				dataType : 'text',      
				success : function(data) {
					data = data.trim();
					 if(data === ""){
						$('.col-sm-12').show();
						$('#check_m').text("아이디 또는 비밀번호가 틀립니다.");
					 }
					 else{
						$('.col-sm-12').show();
						$('#check_m').text(data + "님 방문을 환영합니다.");
						location.href = "${ pageContext.request.contextPath }/index/index_main.do";
					 }
				},    
				error : function(e) {        
					console.log(e);
				}
			});
		}
		
	});//로그인 버튼 클릭
	
	
});
</script>
</body>
</html>