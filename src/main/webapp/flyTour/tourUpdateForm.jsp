<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${ pageContext.request.contextPath }" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tour Update</title>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/tourwriteform.css">
</head>
<body class="main_window">
	<!-- header -->
    <jsp:include page="../main/header.jsp" />
    
	<div id="container">
		<div class="snb">
			<h2>Tour Update</h2>
		        <ul>
		            <li id="tourWrite"><a href="${pageContext.request.contextPath}/flyTour/tourManageForm.do">투어 등록</a></li>
		            <li id="tourList"><a href="${pageContext.request.contextPath}/flyTour/tourListForm.do">투어 목록</a></li>
		            <li id="add"><a href="#">추가하면 함</a></li>
		            <li id="add"><a href="#">추가하면 함</a></li>
		        </ul>
		</div>
		
		<div id="content">
			<p class="locate">
				<a href="${ context }/index/index_main.do">Home</a> &gt;
				<a href="${ context }/flyTour/tourManageForm.do">Tour Manage</a> &gt;
				<strong>투어 수정</strong>
			</p>
			
			<h2>투어 수정</h2>
			
			<div id="section">
				<form id="tourWriteForm">
					<input type="hidden" name="seq" value="${tourDTO.seq}">
					<table border="1">
						<tr>
				        	<th width="100">지역</th>
					        <td>
					            <input type="text" value="${tourDTO.tourId}" id="tourId" name="tourId" size="50">
					            <div id="tourIdDiv"></div>
					        </td>
				    	</tr>
					    	
				    	<tr>
				        	<th width="100">제목</th>
					        <td>
					            <input type="text" value="${tourDTO.tourSubject}" id="tourSubject" name="tourSubject" size="50">
					            <div id="tourSubjectDiv"></div>
					        </td>
				    	</tr>
					    	
				    	<tr>
				        	<th width="100">가격</th>
					        <td>
					            <input type="text" value="${tourDTO.price}" id="price" name="price" size="50">
					        	<div id="priceDiv"></div>
					        </td>
				    	</tr>
				    	
				    	<tr>
					        <th>설명</th>
					        <td>
					            <textarea id="description" name="description" rows="15" cols="50">${tourDTO.description}</textarea>
				            	<div id="descriptionDiv"></div>
				        	</td>
					    </tr>
					    
					    <tr>
					    	<td colspan="2">
					    		<img id="showImg" src="${context}/storage/${tourDTO.tourImage}" width="70" height="70" />
					    		<img src="../image/camera.png" alt="카메라" id="camera" width="50" height="50" />
					    		<input type="file" name="tourImage" id="tourImage" style="visibility: hidden;">
					    		<div id="image1Div"></div> 
					    	</td>
					    </tr>
					    
					    <tr>
					        <td colspan="2" align="center">
					        	<input type="button" value="수정하기" id="tourUpdateBtn" onclick="tourUpdateBtn2()" >
					            <input type="reset" value="다시작성">
					        </td>
					    </tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	
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

function tourUpdateBtn2(){
	var formData = new FormData($('#tourWriteForm')[0]);
	
	$.ajax({
		url: "${context}/flyTour/tourUpdate.do",
		type: "post",
		data: formData,
		contentType: false,
        processData: false,
		success: function() {
			alert("수정이 완료되었습니다.");
			location.href="${context}/flyTour/tourListForm.do?pg=1";
		},
		error: function(e){
			console.log(e);
		}
	});
}
</script>
</body>
</html>