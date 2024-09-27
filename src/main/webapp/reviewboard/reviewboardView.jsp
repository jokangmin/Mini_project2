<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<c:set var="context" value="${ pageContext.request.contextPath }" />     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/foodreviewView.css">
<link rel="icon" href="../image/odiga_logo.jpeg" type="../image/gif" />
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
</head>
<body class = "main_window">
	<!-- header -->
    <jsp:include page="../main/header.jsp" />
    
    <!-- content --> 
    <section class="post-view">
    	<div class="container">
    		
    		<!-- 제목과 작성자, 조회수 -->
            <div class="post-header">
                <h1>${ foodreviewDTO.getSubject() }</h1>
                <div class="post-meta">
                    <span class="post-author">작성자: ${ foodreviewDTO.getReviewid() } </span>
                    <span class="post-hit">조회수: ${ foodreviewDTO.getHit() } </span>
                    <c:if test="${ foodreviewDTO.getLogtime() != null }">
                    	 <span class="post-update">마지막으로 수정한 날짜: ${ foodreviewDTO.getLogtime() } </span>
                    </c:if>
                    <span class="post-likes">좋아요: ${ foodreviewDTO.getLikes() } </span>
                    <form id="report_form" action="${ context }/reviewboard/reviewboardReport.do">
                    	<input type="submit" class="post-report" value="신고">
                    	<input type="hidden" class="review_id" name="review_id" value="${ foodreviewDTO.getReviewid() }">
                    </form>
                </div>
            </div>
            
            
            <!-- 게시글 내용 -->
            <div class="post-content" style="width: 100%; height: 100%; overflow: auto;">    
            	<p>
            		<div class="star-rating" data-grade="">
					    <span class="star">&#9733;</span>
					    <span class="star">&#9733;</span>
					    <span class="star">&#9733;</span>
					    <span class="star">&#9733;</span>
					    <span class="star">&#9733;</span>
					</div>
            	</p>
            	<img id="view_image" alt="view_image" src="${ context }/storage/${ foodreviewDTO.getImage1() }">
                <pre style="white-space: pre-line; word-break: break-all;">${ foodreviewDTO.getContent() }</pre>
            </div>
            
            <!-- 등록일 -->
            <div class="post-date">
                <span>등록일: ${ foodreviewDTO.getLogtime() }</span>
            </div>
            
            <div class="board-write">
            	<c:if test="${ foodreviewDTO.getReviewid() == my_id }">
            		<form action="${ pageContext.request.contextPath }/reviewboard/reviewboardUpdateForm.do" id="update_form">
	            		<button class="btn btn-dark" id="update_button">글수정</button>
	            		<input type="hidden" name="seq" value="${seq}">
	            		<input type="hidden" name="pg" value="${pg}">
	            	</form>
	            	<form action="${ pageContext.request.contextPath }/reviewboard/reviewboardDelete.do" id="delete_form">
	            		<button class="btn btn-dark" id="delete_button">글삭제</button> 
	            		<input type="hidden" name="main_seq" value="${seq}">
	            		<input type="hidden" name="main_id" value="${ my_id }">
	            	</form>
            	</c:if>
            	<form action="${ pageContext.request.contextPath }/reviewboard/reviewboardLike.do" id="like_go">
            		<input type="hidden" name="like_seq" value="${ seq }">
            		<input type="hidden" name="like_pg" value="${ pg }">
			  		<button class="btn-like" id="like_button">좋아요 🧡</button>
			  	</form>
            	<form action="${ pageContext.request.contextPath }/travel/travel2.do?pg=${pg}" id="list_go">
            		<input type="hidden" name="pg" value="${ pg }">
			  		<button class="btn btn-dark" id="update_button" >목록 📋</button>
			  	</form>
		     </div>
    	</div>
    </section>
    <!--  footer -->    
    <jsp:include page="../main/footer.jsp" />
    
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>  
<script type="text/javascript" src="../js/main_scrip.js"></script>   
<script type="text/javascript">   
$(function(){
    var grade = ${foodreviewDTO.getGrade()};
    
    $('.star-rating').attr('data-grade', grade);
    
    $('#update_button').click(function(){
    	if(confirm("정말로 수정하시겠습니까??")){
    		$('#update_form').submit();
    	}
    });
    
    $('#delete_button').click(function(){
    	event.preventDefault();
    	
    	if(confirm("정말로 삭제하시겠습니까??")){
    		$.ajax({
    			type: 'post',
    			url: '${ pageContext.request.contextPath }/reviewboard/reviewboardDelete.do',
    			data: {
                    seq: ${ seq }
                },
    			success: function(){
    				alert('게시글 삭제 완료');
    				location.href="${ pageContext.request.contextPath }/travel/travel2.do?pg=1";
    			},
    			error: function(e){
    				console.log(e);
    			}
    		});
    	}else {
            event.preventDefault();
        }
    });
    
    $('#update_button').click(function(){
    	if(confirm("정말로 수정하시겠습니까??")){
    		$('#update_form').submit();
    	}else {
            event.preventDefault();
        }
    });
});
</script>
</body>
</html>