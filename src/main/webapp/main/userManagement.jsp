<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Member</title>
</head>
<body>
<div id="container">
    <div class="snb">
        <h2>Admin</h2>
        <ul>
            <li id="member_manage"><a href="${pageContext.request.contextPath}/admin/adminMemberForm.do">회원 관리</a></li>
        </ul>
        <ul>
            <li id="board_manage"><a href="#">게시판 관리</a></li>
        </ul>
        <ul>
            <li id="qna_manage"><a href="#">문의 게시판 관리</a></li>
        </ul>
        <ul>
            <li id="imgboard_manage"><a href="#">배너 이미지 관리</a></li>
        </ul>
    </div>
    
    <h2>회원 관리</h2>

    <!-- 회원 목록을 출력할 테이블 -->
    <table border="1" cellpadding="10" cellspacing="0">
        <thead>
            <tr>
                <th>이름</th>
                <th>아이디</th>
                <th>성별</th>
                <th>이메일</th>
                <th>전화번호</th>
                <th>우편번호</th>
                <th>주소</th>
                <th>신고 횟수</th>
                <th>차단 여부</th>
                <th>가입일</th>
                <th>관리</th>
            </tr>
        </thead>
        <tbody>
            
            <c:forEach var="member" items="${memberList}">
                <tr>
                    <td>${member.name}</td>
                    <td>${member.id}</td>
                    <td>
                        <c:choose>
                            <c:when test="${member.gender == 'M'}">남자</c:when>
                            <c:when test="${member.gender == 'F'}">여자</c:when>
                            <c:otherwise>기타</c:otherwise>
                        </c:choose>
                    </td>
                    <td>${member.email1}@${member.email2}</td>
                    <td>${member.tel1}-${member.tel2}-${member.tel3}</td>
                    <td>${member.zipcode}</td>
                    <td>${member.addr1} ${member.addr2}</td>
                    <td>${member.report_count}</td>
                    <td>
                        <c:choose>
                            <c:when test="${member.blocked == 'Y'}">차단됨</c:when>
                            <c:when test="${member.blocked == 'N'}">정상</c:when>
                        </c:choose>
                    </td>
                    <td>
    					<fmt:formatDate value="${member.logtime}" pattern="yy/MM/dd" />
					</td>

                    <td>
                        <input type="button" value="차단하기" class="memberBlock_Btn" data-id="${member.id}" />
    					<input type="button" value="차단해제" class="memberUnblock_Btn" data-id="${member.id}" />
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>   
<script type="text/javascript">
$(function(){
	$('.memberBlock_Btn').click(function(){
        var memberId = $(this).data('id'); 
        
        if(confirm('이 회원을 차단하시겠습니까?')) {
            $.ajax({
                url: '${pageContext.request.contextPath}/admin/memberBlock.do',
                type: 'POST',
                data: { id: memberId },
                success: function(response) {
                    location.reload();
                },
                error: function(e){
                    console.log(e);
                }
            }); //ajax
        }
    }); //click
    
    $('.memberUnblock_Btn').click(function(){
    	var memberId = $(this).data('id');
    	
    	if(confirm('이 회원을 차단 해제하겠습니까?')) {
    		$.ajax({
    			url: '${pageContext.request.contextPath}/admin/memberUnBlock.do',
    			type: 'POST',
    			data: { id: memberId },
    			success: function(message) {
                     location.reload();
    			},
    			error: function(e){
    				console.log(e);
    			}
    		});
    	}
    });
	
	
});

	
</script>
</body>
</html>

