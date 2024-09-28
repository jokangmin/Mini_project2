<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="context" value="${ pageContext.request.contextPath }" />     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ODIGA-TourPass</title>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/tour.css">
<link rel="icon" href="../image/odiga_logo.jpeg" type="../image/gif" />
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<style type="text/css">
.tour-link {
    text-decoration: none;
    color: inherit;
}

.tour-card {
    position: relative;
    cursor: pointer;
}


.tour-card:hover {
    opacity: 0.9;
}

.del-btn, .update-btn {
    width: 100px;
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 10px;
    border-radius: 4px;
    cursor: pointer;
    display: inline-block;
    text-align: center;
}

.del-btn {
    background-color: #ff4d4d;
    margin-right: 15px;
}

.del-btn:hover {
    background-color: #ff1a1a;
}

.update-btn {
    background-color: #87ceeb;
}

.update-btn:hover {
    background-color: #00bfff;
}

.pagination {
    display: flex;
    justify-content: center;
    gap: 10px;
}

.pagination div {
    padding: 10px;
    border-radius: 5px; 
    transition: background-color 0.3s;
}

.pagination div:hover {
    background-color: rgba(255, 165, 0, 0.3);
    cursor: pointer;
}


</style>
</head>
<body class = "main_window">
    <!-- header -->
    <jsp:include page="../main/header.jsp" />
    
    <!-- content -->  
    <div id="container">
		<div class="snb">
			<h2>Tour List Manage</h2>
			<ul>
	            <li id="tourList"><a href="${ context }/flyTour/tourListForm.do?pg=1">투어 목록</a></li>
		        <li id="tourWrite"><a href="${ context }/flyTour/tourWriteForm.do">투어 등록</a></li>
				<li id="add"><a href="#">추가하면 함</a></li>
				<li id="add"><a href="#">추가하면 함</a></li>
			</ul>
		</div><!-- snb -->
		
		<div id="content">
			<p class="locate">
				<a href="${ context }/index/index_main.do">Home</a> &gt;
				<a href="${ context }/flyTour/tourListForm.do?pg=1">Tour Manage</a> &gt;
				<strong>투어 목록</strong>
			</p>
			
			<h2>🗽 투어 목록 관리</h2>
			
			<!-- <div id="toursearch">
				<table>
					<tr>
						<td>
							<label for="choice"></label>
							<select id="searchChoice" name="searchChoice">
		                        <option value="tourId" selected>지역</option>
		                        <option value="tourSubject">제목</option>
		                        <option value="description">내용</option>
                    		</select>
						</td>
						
						<td>
                    		<input type="text" id="searchInput" name="searchInput" placeholder="검색어를 입력하세요">
						</td>
						
						<td>
                    		<input type="button" class="toursearch" onclick="toursearch()" value="검색" />
                		</td>
					</tr>
				</table>
			</div> -->
			
			<div class="tour-list">
				<c:forEach var="tour" items="${list}">
	                <div class="tour-card">
	                	<a href="${ context }/flyTour/tourDetail.do?tourId=Seoul" class="tour-link">
		                    <img src="${context}/storage/${tour.tourImage}" alt="Tour Image">
		                    <input type="hidden" name="seq" value="${tourDTO.seq}">
		                    <div class="tour-info">
		                        <h3>${tour.tourId}</h3>
                                <p><pre>${tour.description}</pre></p>
                                <p><strong>
								    <c:choose>
								        <c:when test="${not empty tour.price and tour.price.trim() ne ''}">
								            \<fmt:formatNumber value="${tour.price}" type="number" pattern="#,##0" />
								        </c:when>
								        <c:otherwise>
								            0
								        </c:otherwise>
								    </c:choose>
								</strong></p>
							</div>
						</a>
							<div>
		                        <input type="button" value="삭제" class="del-btn" onclick="deleteTour('${tour.seq}')" />
		                        <input type="button" value="수정" class="update-btn" onclick="updateTour('${tour.seq}')"/>
		                    </div>
	                    
	                </div>
                </c:forEach>

            </div><!-- tour-list -->
			
		</div><!-- content -->
	</div><!-- container -->
    
     <div class="pagination">
		${tourListPaging.pagingHTML }
	</div>
	
	<!--  footer -->    
    <jsp:include page="../main/footer.jsp" />
    
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>   
<script type="text/javascript" src="../js/main_scrip.js"></script>
<script type="text/javascript">
function tourListPaging(pg){
	location.href = "${ context }/flyTour/tourListForm.do?pg=" + pg;
}

function toursearch() {
	var searchChoice = document.getElementById("searchChoice").value;
    var searchInput = document.getElementById("searchInput").value;
    
    location.href = "${context}/flyTour/tourSearch.do?searchChoice=" + searchChoice + "&searchInput=" + encodeURIComponent(searchInput);
}

function deleteTour(seq) {
    if (confirm('정말 삭제하시겠습니까?ㅠㅠ')) {
        $.ajax({
            url: "${context}/flyTour/tourDelete.do",
            type: "POST",
            data: {seq : seq },
            success: function(response) {
                alert("삭제되었습니다!");
                location.reload();
            },
            error: function(e) {
                console.log(e);
            }
        });
    }
}

function updateTour(seq) {
	location.href = "${context}/flyTour/tourUpdateForm.do?seq=" + seq;
}


</script>

</body>
</html>