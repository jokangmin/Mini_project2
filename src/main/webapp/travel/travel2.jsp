<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<c:set var="context" value="${ pageContext.request.contextPath }" />      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ODIGA-Travel-Food</title>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/foodreview.css">
<link rel="icon" href="../image/odiga_logo.jpeg" type="../image/gif" />
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
</head>
<body class = "main_window">
<!-- header -->
    <jsp:include page="../main/header.jsp" />
    
    <!-- content -->    
   	  <div id="review_container">	
		<div id="review_content">
			<p class="locate">
				<a href="${ context }/index/index_main.do">Home</a> &gt;
				<a href="${ context }/travel/travel1.do">Travel</a> &gt;
				<strong>맛집</strong>
			</p>
			
			<h2>🍔 나만의 맛집 소개</h2>
			
			<p class="food">
				<img src="../image/food_main.png" alt="foodMain_image">
			</p>
			<br/>
			<div class="food_content">
				<div id="board-search">
			        <div class="container">
			            <div class="search-window">
			                <form action="">
			                    <div class="search-wrap">         
			                        <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
			                        <button type="submit" class="foodreview_search_submit">검색</button>
			                    </div>
			                </form>
			            </div>
			        </div>
			    </div>
				<ul class="food_list">
					<c:forEach var="data" items="${ List }">
						<li>
							<div class="food_review_content">
								<a href="${ context }/reviewboard/reviewboardView.do?seq=${ data.getSeq() }&pg=${pg}" class="review_a">
									<span class="food_review_image">
										<img alt="food_image" src="${ context }/storage/${ data.getImage1() }">
									</span>
									<div class="food_review_subject">
										<p>${ data.getSubject() }</p>
									</div>
									<div class="mini_image">
										<img alt="like" src="../image/like.png"/><span id="like_num">${ data.getLikes() }</span>
										<img alt="eye" src="../image/eye.png"/><span id="view_num">${ data.getHit() }</span>
										<img alt="reply" src="../image/reply.png"/><span id="reply_num">0</span>
									</div>
								</a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<c:if test="${ sessionScope.id != null }">
				<form id="foodreview_form" action="${ context }/reviewboard/reviewboardWriteForm.do" >
					<input type="submit" value="글쓰기" class="foodreview_add_submit" />
				</form>
			</c:if>
			<div style='text-align: center; margin: 20px 0;'>
		    	<div>${ foodreviewPaging.getPagingHTML() } </div>
		    </div>
		</div><!-- content -->
	</div><!-- container -->
	    
	<!--  footer -->    
    <jsp:include page="../main/footer.jsp" />
    
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>   
<script type="text/javascript" src="../js/main_scrip.js"></script>
<script type="text/javascript">
$(function(){
	
});

function foodreviewPaging(pg){
	location.href = '${ pageContext.request.contextPath }/travel/travel2.do?pg='+pg;
};
</script>
</body>
</html>