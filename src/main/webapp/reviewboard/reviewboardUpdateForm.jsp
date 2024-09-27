<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ODIGA 리뷰 수정</title>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/foodreviewWrite.css">
<link rel="icon" href="../image/odiga_logo.jpeg" type="../image/gif" />
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
</head>
<body class = "main_window">
	<!-- header -->
    <jsp:include page="../main/header.jsp" />
	
	<!-- content -->    
	<section class="write-board">
        <div class="container">
            <div class="page-subject">
                <h3>맛집 소개 수정 ✍️</h3>
            </div>
            
             <div class="form-group">
                    <label for="userId">아이디</label>
                    <input type="text" id="userId" name="userId" value="${id}" readonly>
             </div>
                
             <div class="form-group">
                 <label for="userName">이름</label>
                 <input type="text" id="userName" name="userName" value="${ name }" readonly>
             </div>
            
            <!-- Form Area -->
            <form action="${ pageContext.request.contextPath }/reviewboard/reviewboardUpdate.do" method="post" id="foodreviewUpdateForm" enctype="multipart/form-data">
           		<input type="hidden" name="reviewid" value="${id}">
			    <input type="hidden" name="reviewname" value="${ name }">
			    <input type="hidden" name="seq" value="${ seq }">
			    <input type="hidden" name="pg" value="${ pg }">
			    <input type="hidden" id="grade" name="grade" value="">
			    <div class="form-group">
				    <label for="grade_star">평점</label>
				    <div class="star-rating">
				        <input type="radio" id="star5" name="grade_star" value="5" />
				        <label for="star5" class="star">&#9733;</label>
				        <input type="radio" id="star4" name="grade_star" value="4" />
				        <label for="star4" class="star">&#9733;</label>
				        <input type="radio" id="star3" name="grade_star" value="3" />
				        <label for="star3" class="star">&#9733;</label>
				        <input type="radio" id="star2" name="grade_star" value="2" />
				        <label for="star2" class="star">&#9733;</label>
				        <input type="radio" id="star1" name="grade_star" value="1" />
				        <label for="star1" class="star">&#9733;</label>
				    </div>
				</div>
			    
                <div class="form-group">
                    <label for="subject">제목</label>
                    <input type="text" id="subject" name="subject">
                </div>
                
                <div class="form-group">
                    <label for="reviewcontent">내용</label>
                    <textarea id="reviewcontent"  name="content"></textarea>
                </div>
				
             	<div class="form-group">
             		<label for="image_div">이미지</label>
             		<div id="image_div">
             			<img id="showImg" width="120" height="120"/>
                    	<img alt="camera" src="../image/camera.png" width="100" height="100" id="camera"/>
			       		<input type="file" id="image1" name="image1" style="visibility: hidden;"/>
             		</div>
                </div>
                
                <div class="form-buttons">
                	<input type="button" name="foodreviewUpdateButton" id="foodreviewUpdateButton" value="리뷰 수정" class="btn btn-dark"/>
                    <button type="reset" class="btn btn-reset">다시 수정</button>
                </div>
            </form>
        </div>
    </section>
	
	<!--  footer -->    
    <jsp:include page="../main/footer.jsp" />
    
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/main_scrip.js"></script>   
<script type="text/javascript">

$('#camera').click(function(){
	$('#image1').trigger('click');
});

$('#image1').change(function(){ 
	readURL(this);
});

function readURL(input){
	var reader = new FileReader();
	reader.onload = function(e){
		$('#showImg').attr('src',e.target.result);
	}
	reader.readAsDataURL(input.files[0]);
}

$('#foodreviewUpdateButton').click(function(){
	let formData = new FormData($('#foodreviewUpdateForm')[0]);
	$.ajax({
		type: 'post',
		encType: 'multipart/form-data',
		processData: false,
		contentType: false,
		url: '${ pageContext.request.contextPath }/reviewboard/reviewboardUpdate.do',
		data: formData,
		success: function(){
			alert('리뷰 수정 완료!');
			location.href="${ pageContext.request.contextPath }/reviewboard/reviewboardView.do?seq=${seq}&pg=${pg}";
		},
		error: function(e){
			console.log(e);
		}
	});
});

$('.star-rating input').change(function() {
    var selectedRating = $(this).val(); 
    console.log("선택된 평점:", selectedRating);
    $('#grade').val(selectedRating);
});

</script> 
</body>
</html>