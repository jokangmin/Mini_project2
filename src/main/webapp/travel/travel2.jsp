<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   
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
<body class="main_window">
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
                            <form action="${ context }/travel/travel2.do" method="GET">
                            	<input type="hidden" name="pg" value="1">
                                <div class="search-wrap" style="display: flex; align-items: center; gap: 10px; width: 100%;">
								    <select name="searchType" id="searchType" style="height: 40px; padding: 7px 14px; border: 1px solid #ccc; border-radius: 4px;">
								        <option value="title">제목</option>
								        <option value="content">내용</option>
								        <option value="both">제목 + 내용</option>
								    </select>
								    <input id="search" type="search" name="searchTerm" placeholder="검색어를 입력해주세요." value="${param.searchTerm}" style="height: 40px; flex-grow: 1; padding: 7px 14px; border: 1px solid #ccc; border-radius: 4px;">
								    <button type="submit" class="foodreview_search_submit" style="height: 40px; padding: 0 20px; background-color: #555; color: white; border: none; cursor: pointer; border-radius: 4px;">
								        검색
								    </button>
								</div>
								<div id="order" style="margin-top: 10px;">
							        <select name="sortType" id="sortType" onchange="this.form.submit();" style="height: 40px; padding: 7px 14px; border: 1px solid #ccc; border-radius: 4px;">
							            <option value="seq" ${param.sortType == 'seq' ? 'selected' : ''}>최신순</option>
							            <option value="likes" ${param.sortType == 'likes' ? 'selected' : ''}>좋아요순</option>
							            <option value="hit" ${param.sortType == 'hit' ? 'selected' : ''}>조회순</option>
							        </select>
							    </div>
                            </form>
                        </div>
                    </div>
                </div>
                <c:choose>
				    <c:when test="${not empty param.searchTerm}">
				        <!-- 검색어가 있을 경우 -->
				        <ul class="food_list">
						    <c:forEach var="data" items="${list}">
						        <c:if test="${data.subject != null && param.searchTerm != null && 
						            (fn:contains(data.subject, param.searchTerm) || 
						            (data.content != null && fn:contains(data.content, param.searchTerm)))}">
						            <li>
						                <div class="food_review_content">
						                    <a href="${context}/reviewboard/reviewboardView.do?seq=${data.seq}&pg=${pg}" class="review_a">
						                        <span class="food_review_image">
						                            <img alt="food_image" src="${context}/storage/${data.image1}">
						                        </span>
						                        <div class="food_review_subject">
						                            <p>${data.subject}</p>
						                        </div>
						                        <div class="mini_image">
						                            <img alt="like" src="../image/like.png"/><span id="like_num">${data.likes}</span>
						                            <img alt="eye" src="../image/eye.png"/><span id="view_num">${data.hit}</span>
						                            <img alt="reply" src="../image/reply.png"/><span id="reply_num">${data.replycount}</span>
						                        </div>
						                    </a>
						                </div>
						            </li>
						        </c:if>
						    </c:forEach>
						</ul>
				    </c:when>
				    <c:otherwise>
				        <!-- 검색어가 없을 경우 전체 데이터 출력 -->
				        <ul class="food_list">
				            <c:forEach var="data" items="${list}">
				                <li>
				                    <div class="food_review_content">
				                        <a href="${context}/reviewboard/reviewboardView.do?seq=${data.seq}&pg=${pg}" class="review_a">
				                            <span class="food_review_image">
				                                <img alt="food_image" src="${context}/storage/${data.image1}">
				                            </span>
				                            <div class="food_review_subject">
				                                <p>${data.subject}</p>
				                            </div>
				                            <div class="mini_image">
				                                <img alt="like" src="../image/like.png"/><span id="like_num">${data.likes}</span>
				                                <img alt="eye" src="../image/eye.png"/><span id="view_num">${data.hit}</span>
				                                <img alt="reply" src="../image/reply.png"/><span id="reply_num">${data.replycount}</span>
				                            </div>
				                        </a>
				                    </div>
				                </li>
				            </c:forEach>
				        </ul>
				    </c:otherwise>
				</c:choose>

                <c:if test="${empty list}">
                    <p>리스트에 데이터가 없습니다.</p>
                </c:if>
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
	var contextPath = '${pageContext.request.contextPath}';
    var searchTerm = '${param.searchTerm}';
    var searchType = '${param.searchType}';
    var sortType = '${param.sortType}';
    location.href = contextPath + '/travel/travel2.do?pg=' + pg + 
                    (searchTerm ? '&searchTerm=' + encodeURIComponent(searchTerm) : '') +
                    (searchType ? '&searchType=' + encodeURIComponent(searchType) : '') +
                    (sortType ? '&sortType=' + encodeURIComponent(sortType) : '');
};
</script>
</body>
</html>
