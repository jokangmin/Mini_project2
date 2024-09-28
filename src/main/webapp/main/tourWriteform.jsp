<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${ pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tour Manage</title>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/tourwriteform.css">
<link rel="icon" href="../image/odiga_logo.jpeg" type="../image/gif" />
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
</head>
<body class = "main_window">
        <!-- header -->
    <jsp:include page="../main/header.jsp" />
    
	<div id="container">
		<div class="snb">
			<h2>Tour Manage</h2>
		        <ul>
		            <li id="tourList"><a href="${ context }/flyTour/tourListForm.do?pg=1">투어 목록</a></li>
		            <li id="tourWrite"><a href="${ context }/flyTour/tourWriteForm.do">투어 등록</a></li>
		            <li id="add"><a href="#">추가하면 함</a></li>
		            <li id="add"><a href="#">추가하면 함</a></li>
		        </ul>
		</div>
		
		<div id="content">
			<p class="locate">
				<a href="${ context }/index/index_main.do">Home</a> &gt;
				<a href="${ context }/flyTour/tourListForm.do?pg=1">Tour Manage</a> &gt;
				<strong>투어 등록</strong>
			</p>
			
			<h2>투어 등록</h2>
			
			<div id="section">
				<form id="tourWriteForm">
					<table border="1">
						<tr>
				        	<th width="100">지역</th>
					        <td>
					            <input type="text" id="tourId" name="tourId" size="50">
					            <div id="tourIdDiv"></div>
					        </td>
				    	</tr>
					    	
				    	<tr>
				        	<th width="100">제목</th>
					        <td>
					            <input type="text" id="tourSubject" name="tourSubject" size="50">
					            <div id="tourSubjectDiv"></div>
					        </td>
				    	</tr>
					    	
				    	<tr>
				        	<th width="100">가격</th>
					        <td>
					            <input type="text" id="price" name="price" size="50">
					        	<div id="priceDiv"></div>
					        </td>
				    	</tr>
				    	
				    	<tr>
					        <th>설명</th>
					        <td>
					            <textarea id="description" name="description" rows="15" cols="50"></textarea>
				            	<div id="descriptionDiv"></div>
				        	</td>
					    </tr>
					    
					    <tr>
					    	<td colspan="2">
					    		<img id="showImg" width="160" height="160" />
					    		<img src="../image/camera.png" alt="카메라" id="camera" width="50" height="50" />
					    		<input type="file" name="tourImage" id="tourImage" style="visibility: hidden;">
					    		<div id="image1Div"></div> 
					    	</td>
					    </tr>
					    
					    <tr>
					        <td colspan="2" align="center">
					        	<input type="button" value="등록" id="tourWriteBtn">
					            <input type="reset" value="다시작성">
					        </td>
					    </tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	
		<!--  footer -->    
    <jsp:include page="../main/footer.jsp" />
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/main_scrip.js"></script>
<script type="text/javascript">
$('#camera').click(function(){
	$('#tourImage').trigger('click');
});

$('#tourImage').change(function(){
	readURL(this);
});

function readURL(input){
	var reader = new FileReader();
	
	reader.onload = function(e){
		$('#showImg').attr('src', e.target.result); //e.target - 이벤트가 발생하는 요소를 반환해준다.
	}
	reader.readAsDataURL(input.files[0]);
}

$('#tourWriteBtn').click(function() {
    $('#tourIdDiv').empty();
    $('#tourSubjectDiv').empty();
    $('#priceDiv').empty();
    $('#descriptionDiv').empty();
    
    if ($('#tourId').val().trim() == "") {
        $('#tourIdDiv').html('지역을 작성하세요').css('color', 'red');
        $('#tourId').focus();
        return;
    } 
    else if ($('#tourSubject').val().trim() == "") {
        $('#tourSubjectDiv').html('제목을 작성하세요').css('color', 'red');
        $('#tourSubject').focus();
        return;
    }
    else if ($('#price').val().trim() == "") {
        $('#priceDiv').html('가격을 작성하세요').css('color', 'red');
        $('#price').focus();
        return;
    }
    else if ($('#description').val().trim() == "") {
        $('#descriptionDiv').html('설명을 작성하세요').css('color', 'red');
        $('#description').focus();
        return;
    }else {
    	let formData = new FormData($('#tourWriteForm')[0]);

        $.ajax({
            type: 'post',
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            url: '${ context }/flyTour/tourWrite.do',
            data: formData,
            success: function() {
                alert('투어 등록 완료!');
                location.href = "${ context }/flyTour/tourListForm.do?pg=1";
            },
            error: function(e) {
                console.log(e);
            }
        });
    }
    
});



</script>
</body>
</html>