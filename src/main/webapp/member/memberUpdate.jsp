<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" href="../css/main.css">
<link rel="icon" href="../image/odiga_logo.jpeg" type="../image/gif" />
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<link rel="stylesheet" href="../css/update.css">
</head>
<body class="main_window">
    <!-- header -->
    <jsp:include page="../main/header.jsp" />
    <br/>
    <!-- content -->
    <div id="update_content_div">
        <br/>
        <form method="post" action="${ pageContext.request.contextPath }/member/update.do" id="update_form" name="update_form">
            <fieldset id="update_field">
                <div align="center">
                    <h2>회원정보수정</h2>
                    <P>ODIGA 회원정보를 수정해주세요.</P>
                </div>
                <div id="update_input">
                    <div class="custom-form-group2">
                        <input type="text" class="custom-form-control2" name="name" id="name" value="${ memberDTO.name }" placeholder="이름">
                        <label for="customFloatingName2" class="custom-label2">이름</label>
                        <span id="check_name"></span>
                    </div>
                    <div class="custom-form-group2">
                        <input type="text" class="custom-form-control2" name="id" id="id" value="${ session_id }" size="24" readonly/>
                    </div>
                    <div class="custom-form-group2">
                        <input type="password" class="custom-form-control2" name="pwd" id="pwd" placeholder="비밀번호 입력">
                        <label for="customFloatingPassword2" class="custom-label2">새로운 비밀번호</label>
                    </div>
                    <div class="custom-form-group2">
                        <input type="password" class="custom-form-control2" name="pwd_check" id="pwd_check" placeholder="비밀번호 재확인">
                        <label for="customFloatingPassword2" class="custom-label2">비밀번호 재확인</label>
                        <span id="check_pw"></span>
                    </div>
                    <div class="custom-form-group2">
                        <input type="radio" name="gender" id="gender_m" value="M" <c:if test="${ memberDTO.gender.equals('M') }">checked</c:if> />
                        <label for="gender">남자</label>
                        <input type="radio" name="gender" id="gender_f" value="F" <c:if test="${ memberDTO.gender.equals('F') }">checked</c:if> />
                        <label for="gender">여자</label>
                    </div>
                    <div class="custom-form-group2-email">
                        <div class="email-input-group">
                            <input type="text" class="custom-form-control2" name="email1" id="email1" value="${ memberDTO.email1 }" placeholder="이메일">
                            <span id="email_span">@</span>
                            <input type="text" class="custom-form-control2" name="email2" id="email2" value="${ memberDTO.email2 }" placeholder="이메일2">
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
                    
                    <!--  이메일 인증 번호 --> 
					<button type="button" onclick="sendEmail();">이메일 인증발송</button>		
					<div id="verificationSection" >
				    <h2>인증번호 확인</h2>
				    <label for="inputCode">인증번호 입력:</label>
				    <br>
				    <br>
				    <input type="text" id="inputCode" class="custom-form-control2">
				    <br>
				    <br>
				    <button  type="button" onclick="verifyCode();">확인</button>
				  
					</div>
					<br>
                    
                    <div class="custom-form-group2">
                        <select name="tel1" id="tel1" class="custom-form-control2">
                            <optgroup>
                                <option value="010" <c:if test="${ memberDTO.tel1.equals('010') }">selected</c:if>>010</option>
                                <option value="011" <c:if test="${ memberDTO.tel1.equals('011') }">selected</c:if>>011</option>
                                <option value="019" <c:if test="${ memberDTO.tel1.equals('019') }">selected</c:if>>019</option>
                            </optgroup>
                        </select>
                        <span id="tel_span">-</span>
                        <input type="text" name="tel2" id="tel2" value="${ memberDTO.tel2 }" size="5" maxlength="4" placeholder="XXXX" class="custom-form-control2" />
                        <span id="tel_span">-</span>
                        <input type="text" name="tel3" id="tel3" value="${ memberDTO.tel3 }" size="5" maxlength="4" placeholder="XXXX" class="custom-form-control2" />
                    </div>
                    <div class="custom-form-group2">
                        <input type="text" class="custom-form-control2" name="zipcode" id="zipcode" value="${ memberDTO.zipcode }" placeholder="우편번호" readonly>
                        <label for="zipcode" class="custom-label2">우편번호</label>
                        <button type="button" onclick="zipcode_button()">우편번호 검색</button>
                    </div>
                    <div class="custom-form-group2">
                        <input type="text" class="custom-form-control2" name="addr1" id="addr1" value="${ memberDTO.addr1 }" placeholder="주소" readonly>
                        <label for="addr1" class="custom-label2">주소</label>
                    </div>
                    <div class="custom-form-group2">
                        <input type="text" class="custom-form-control2" name="addr2" id="addr2" value="${ memberDTO.addr2 }" placeholder="상세주소">
                        <label for="addr2" class="custom-label2">상세주소</label>
                    </div>
                </div>
                <div align="center">
                    <input type="button" value="회원정보수정" id="update_button"/>
                    <input type="reset" value="다시 입력" id="reset_button"/>
                    <input type="button" value="회원탈퇴" id="delete_button" onclick="delMem_button()"/>
                </div>
            </fieldset>
            <input type="hidden" id="id_state" name="id_state" value="false">
        </form>
    </div>
    <!-- footer -->
    <jsp:include page="../main/footer.jsp" />
    
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/main_scrip.js"></script>
<script type="text/javascript" src="../js/postapi.js"></script>
<script type="text/javascript" src="../js/mail.js"></script>
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
    	

        var originalEmail1 = "${memberDTO.email1}";
        var originalEmail2 = "${memberDTO.email2}";

        // 현재 입력된 이메일 값
        var currentEmail1 = $('#email1').val();
        var currentEmail2 = $('#email2').val();

        // 이메일이 변경된 경우 인증 확인
        if ((originalEmail1 !== currentEmail1 || originalEmail2 !== currentEmail2) && !$('#inputCode').val()) {
            alert("이메일 인증을 해주세요");
            return;
        }

    	
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
    
    $('#delete_button').click(function() {
        var pwd = prompt("비밀번호를 입력하세요.");

        if (pwd != null && pwd != "") {
            $.ajax({
                type: 'POST',
                url: '${ pageContext.request.contextPath }/member/checkPwd.do',
                data: { pwd: pwd },
                success: function(result) {
                    if (result === "success") {
                        if (confirm("정말로 탈퇴하시겠습니까?")) {
                            $.ajax({
                                type: 'POST',
                                url: '${ pageContext.request.contextPath }/member/deleteMember.do',
                                success: function() {
                                    alert("회원탈퇴가 완료되었습니다.");
                                    location.href = "${ pageContext.request.contextPath }/index/index_main.do";
                                },
                                error: function() {
                                    alert("탈퇴 처리 중 오류가 발생했습니다.");
                                }
                            });
                        }
                    } else {
                        alert("비밀번호가 일치하지 않습니다.");
                    }
                },
                error: function() {
                    alert("비밀번호 확인 중 오류가 발생했습니다.");
                }
            });
        }
    });
    
});
</script>
</body>
</html>
