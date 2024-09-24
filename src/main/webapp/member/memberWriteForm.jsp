<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../css/main.css">
<link rel="icon" href="../image/odiga_logo.jpeg" type="../image/gif" />
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<link rel="stylesheet" href="../css/signup.css">
</head>
<body class = "main_window">
	<!-- header -->
    <jsp:include page="../main/header.jsp" />
    <br/>
    <!-- content -->  
    <div id="signup_content_div">
    	<br/>
		<form method="post" action="${ pageContext.request.contextPath }/member/signup.do" id="signup_form">
			<fieldset id="signup_field">
				<div align="center">
					<h2>회원가입</h2>
					<P>ODIGA 계정 가입을 위해 정보를 입력해주세요.</P>
				</div>
				<div id="signup_input">
					<div class="custom-form-group2">
						<input type="text" class="custom-form-control2" id="name" name = "name" placeholder="이름">
					    <label for="customFloatingName2" class="custom-label2">이름</label>
					    <span id="check_name"></span>
					</div>
					<div class="custom-form-group2">
					    <input type="text" class="custom-form-control2" id="id" name = "id" placeholder="아이디">
					    <label for="customFloatingUsername2" class="custom-label2">아이디</label>
					    <span id="check_id"></span>
					    <div id="user_check" style="color: blue;"></div>
					</div>
					<div class="custom-form-group2">
    					<input type="password" class="custom-form-control2" id="pwd" name="pwd" placeholder="비밀번호">
    					<label for="pwd" class="custom-label2">비밀번호</label>
					</div>
					<div class="custom-form-group2">
					    <input type="password" class="custom-form-control2" id="pwd_check" name="pwd_check" placeholder="비밀번호 재확인">
					    <label for="pwd_check" class="custom-label2">비밀번호 재확인</label>
					    <span id="check_pw"></span>
					</div>
					<div class="custom-form-group2">
						<input type="radio" name = "gender" id = "gender_m" value = "M" checked />
						<label for ="gender">남자</label>
						<input type="radio" name = "gender" id = "gender_f" value = "F" />
						<label for ="gender">여자</label>
					</div>
					
					<div class="custom-form-group2-email">
					    <div class="email-input-group">
					        <input type="text" class="custom-form-control2" name="email1" id="email1" placeholder="이메일" />
					        <span id="email_span">@</span>
					        <input type="text" class="custom-form-control2" name="email2" id="email2" placeholder="이메일2" />
					    </div>
					    <select name="email2_sel" id="email2_sel" class="custom-form-control2">
					        <optgroup label="이메일 형식 지정">
					            <option value="">직접입력</option>
					            <option value="naver.com">naver.com</option>
					            <option value="gmail.com">gmail.com</option>
					            <option value="hanmail.com">hanmail.com</option>
					        </optgroup>
					    </select>
					</div>
					
					<div class="custom-form-group2">
					    <select name="tel1" id="tel1">
					        <optgroup>
					            <option value="010" selected>010</option>
					            <option value="011">011</option>
					            <option value="019">019</option>
					        </optgroup>
					    </select>
					    <span id="tel_span">-</span>
					    <input type="text" name="tel2" id="tel2" size="5" maxlength="4" placeholder="XXXX" />
					    <span id="tel_span">-</span>
					    <input type="text" name="tel3" id="tel3" size="5" maxlength="4" placeholder="XXXX" />
					</div>
					
					<div class="loader">
					<img src="../images/loader.gif">
				</div>
				<div class="custom-form-group2">
                    <input type="text" class="custom-form-control2" id="zipcode" name = "zipcode" placeholder="우편번호" readonly>
                    <label for="zipcode" class="custom-label2">우편번호</label>
                    <button type="button" onclick="zipcode_button()">우편번호 검색</button>
                </div>
                <div class="custom-form-group2">
                    <input type="text" class="custom-form-control2" name = "addr1" id="addr1" placeholder="주소" readonly>
                    <label for="addr1" class="custom-label2">주소</label>
                </div>
                <div class="custom-form-group2">
                    <input type="text" class="custom-form-control2" name = "addr2" id="addr2" placeholder="상세주소">
                    <label for="addr2" class="custom-label2">상세주소</label>
                </div>
					
				</div>
                
                <div align="center">
					<input type="button" value="회원가입" id="write_button"/>
					<input type="reset" value="다시 입력" id="reset_button"/>
				</div>
			</fieldset>
		
			<input type="hidden" id="id_state" name="id_state" value="false">
		</form>
	</div>
	<!--  footer -->    
    <jsp:include page="../main/footer.jsp" />
    
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/postapi.js"></script>
<script type="text/javascript">
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
	        $('#check_pw').text(" 비밀번호가 일치합니다. ");
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
				$('#signup_form').submit();
			}
		}
	});
	
});
</script>
</body>
</html>