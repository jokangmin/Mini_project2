<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" href="../css/signup.css">
</head>
<body>
	<form method="post" action="${ pageContext.request.contextPath }/member/update.do" id="update_form" name="update_form">
	<img src="../image/odiga_logo.png" width="85" height="40" alt="home" 
		onclick="location='${ pageContext.request.contextPath }/index/index_main.do'" style="cursor: pointer;">
		<table border="1" cellpadding="8" cellspacing="0">
			<tr>
				<th  width="80">이름</th>
				<th align="left"><input type ="text" name = "name" id="name" value= "${ memberDTO.name }" size="20"/>
				<span id="check_name"></span></th>
			</tr>	
			
			<tr>
				<th  width="60">아이디</th>
				<th align="left"><input type ="text" name = "id" id="id" value = "${ session_id }" size="24" readonly/>
			</tr>
			
			<tr>
				<th  width="60">비밀번호</th>
				<th align="left"><input type ="password" name = "pwd" id="pwd" placeholder = "비밀번호 입력" size="30"/></th>
			</tr>
			
			<tr>
				<th  width="60">재확인</th>
				<th align="left"><input type ="password" name = "pwd_check" id="pwd_check" placeholder = "비밀번호 입력" size="30"/><span id="check_pw"></span></th>
			</tr>
			
			<tr>
				<th>성별</th>
				<td align="left">
					<c:if test="${ memberDTO.gender.equals('M') }">
						<input type="radio" name = "gender" id = "gender_m" value = "M" checked />
						<label for ="gender">남자</label>
						<input type="radio" name = "gender" id = "gender_f" value = "F" />
						<label for ="gender">여자</label>
					</c:if>
					<c:if test="${ memberDTO.gender.equals('F') }">
						<input type="radio" name = "gender" id = "gender_m" value = "M" />
						<label for ="gender">남자</label>
						<input type="radio" name = "gender" id = "gender_f" value = "F" checked/>
						<label for ="gender">여자</label>
					</c:if>
				</td>
			</tr>	
			
			<tr>
				<th  width="60">이메일</th>
				<th align="left">
					<input type ="text" name = "email1" id="email1" value="${ memberDTO.email1 }"> @ <input type ="text" name = "email2" id="email2"  value="${ memberDTO.email2 }">
		
					<select name = "email2_sel" id = "email2_sel">
							<optgroup label="이메일 형식 지정">
								<option value = "" >직접입력</option>
								<option value = "naver.com">naver.com</option>
								<option value = "gmail.com">gmail.com</option>
								<option value = "hanmail.com">hanmail.com</option>
							</optgroup>
					</select>
				</th>
			</tr>
			
			<tr>
				<th  width="60">휴대전화</th>
				<th align="left">
					<select name = "tel1" id = "tel1">
							<c:if test="${ memberDTO.tel1.equals('010') }">
								<optgroup>
									<option value = "010" selected>010</option>
									<option value = "011">011</option>
									<option value = "019">019</option>
								</optgroup>
							</c:if>
							<c:if test="${ memberDTO.tel1.equals('011') }">
								<optgroup>
									<option value = "010">010</option>
									<option value = "011" selected>011</option>
									<option value = "019">019</option>
								</optgroup>
							</c:if>
							<c:if test="${ memberDTO.tel1.equals('019') }">
								<optgroup>
									<option value = "010">010</option>
									<option value = "011">011</option>
									<option value = "019" selected>019</option>
								</optgroup>
							</c:if>
	
					</select>
					- <input type ="text" name = "tel2" id="tel2" size="5" value="${ memberDTO.tel2 }"/>
					- <input type ="text" name = "tel3" id="tel3" size="5" value="${ memberDTO.tel3 }"/>
				</th>
			</tr>
			
			<tr>
				<th  width="60">주소</th>
				<th align="left" id="address"><input type ="text" name = "zipcode" id="zipcode" value="${ memberDTO.zipcode }" size="20" readonly/>
				<input type="button" value="우편번호 검색" onclick="zipcode_button()"/>
				<br/><input type ="text" name = "addr1" id="addr1" value="${ memberDTO.addr1 }" size="50" readonly/>
				<br/><input type ="text" name = "addr2" id="addr2" value="${ memberDTO.addr2 }" size="50"/>
				</th>
			</tr>
			
			<tr>
				<th align="center" colspan ="2">
					<input type="button" value="회원정보수정" id="update_button"/>
					<input type="reset" value="다시 입력" id="reset_button"/>
				</th>
			</tr>	
		</table>
		<input type="hidden" id="id_state" name="id_state" value="false">
	</form>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/postapi.js"></script>
<script type="text/javascript">
$(function(){
	let pw_state = false;
	
	$('#check_pw').empty();
	$('#check_name').empty();
	
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
	
	$('#update_button').click(function(){
		if(!$('#name').val() && !$('#pwd').val() && !$('#email1').val() 
			&& !$('#email2').val() && !$('#tel2').val() && !$('#tel3').val() && !$('#zipcode').val()
			&& !$('#addr1').val() && !$('#addr2').val() && !$('#pwd_check').val()){
			alert("정보를 모두 입력해주세요.");
		}
		else{
			if(!pw_state){
				alert("비밀번호를 다시 한 번 확인해주세요.");
			}
			else{
				$('#update_form').submit();	
			}
		}
	});
	
});
</script>
</body>
</html>