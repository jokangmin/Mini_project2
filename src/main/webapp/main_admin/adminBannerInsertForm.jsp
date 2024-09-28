<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/banner.css"> 
<link rel="stylesheet" href="../css/table.css"> 

</head>
<body>
			
			<form id="imageboardWriteForm">
				<table border="1">
					<tr>
			        	<th width="100">이미지 id</th>
				        <td>
				            <input type="text" id="imageId" name="imageId" size="50" >
				            <div id="subjectDiv"></div>
				        </td>
			    	</tr>
			    	
			    	<tr>
			        	<th width="100">이미지 이름</th>
				        <td>
				            <input type="text" id="imageName" name="imageName" size="50">
				            <div id="imageNameDiv"></div>
				        </td>
			    	</tr>
			    	
			    	<tr>
			        	<th width="100">광고단가</th>
				        <td>
				            <input type="text" id="imagePrice" name="imagePrice" size="50" >
				            <div id="imagePriceDiv"></div>
				        </td>
			    	</tr>
			    	
			    	<tr>
			        	<th width="100">광고시간</th>
				        <td>
				            <input type="text" id="imageQty" name="imageQty" size="50" >
				            <div id="imageQtyDiv"></div>
				        </td>
			    	</tr>
			    	
			    	<tr>
				        <th>내용</th>
				        <td>
				            <textarea id="imageContent" name="imageContent" rows="10" cols="40" ></textarea>
				            <div id="imageContentDiv"></div>
				        </td>
				    </tr>
				    
				    <tr>
				    	<td colspan="2" style="text-align:left">
				    		<img id="showImg" width="70" height="70" />
				    		<img src="../image/camera.png" alt="카메라" id="camera" width="50" height="50" />
				    		<input type="file" name="image1" id="image1" style="visibility: hidden;">
				    		<div id="image1Div"></div> 
				    	</td>
				    </tr>
				    
				    <tr>
				        <td colspan="4" align="center">
				        	<input type="button" class="modern_button" value="이미지 등록" id="imageboardWriteBtn">
				            <input type="reset"  class="modern_button" value="다시작성">
				            <input type="button"  id="load" class="modern_button" value="배너목록" onclick="loadBanner2()">
				            <input type="button"  id="unload" class="modern_button" value="목록접기" onclick="unloadBanner2()">
				        </td>
				    </tr>
				</table>
			</form>
			
 			  <div id="bannerList2"></div> 
    
   



<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/bannerList.js"></script>  
<script type="text/javascript">
$('#camera').click(function(){
	$('#image1').trigger('click');//강제 이벤트 발생
});

//선택한 이미지 확인하기
$('#image1').change(function(){
	readURL(this);
});

function readURL(input){
	var reader = new FileReader();
	
	reader.onload = function(e){
		$('#showImg').attr('src', e.target.result); //e.target - 이벤트가 발생하는 요소를 반환해준다.
	}
	
	reader.readAsDataURL(input.files[0]);
}

$('#imageboardWriteBtn').click(function(){
	let formData = new FormData($('#imageboardWriteForm')[0]);
	

		
		

	
	$.ajax({
		type: 'post',
		enctype: 'multipart/form-data',
		processData: false,
		contentType: false,
		url: '/project_ODIGA/main_admin/adminBannerInsert.do',
		data: formData,
		success: function(){
			alert('이미지 등록 완료');
	    $('#imageboardWriteForm')[0].reset();
		},
		error: function(e){
			alert("빈칸을 채워 주세요");
		}
	}); //$.ajax
});

</script>
</body>
</html>

<!-- 
FileReader 란?
FileReader는 <input type="file" /> 또는 API 요청과 같은 인터페이스를 통해 
File 또는 Blob 객체를 편리하게 처리할수있는 방법을 제공하는 객체이며
abort, load, error와 같은 이벤트에서 발생한 프로세스를 처리하는데 주로 사용되며,
File 또는 Blob 객체를 읽어서 result 속성에 저장한다.

FileReader도 비동기로 동작한다.

FileReader.onload()
load 이벤트의 핸들러. 이 이벤트는 읽기 동작이 성공적으로 완료되었을 때마다 발생한다.

processData
 - 기본값은 true
 - 기본적으로 Query String으로 변환해서 보내진다('변수=값&변수=값')
 - 파일 전송시에는 반드시 false로 해야 한다.(formData를 문자열로 변환하지 않는다)
 
contentType
  - 기본적으로 "application/x-www-form-urlencoded; charset=UTF-8"
  - 파일 전송시에는 'multipart/form-data'로 전송이 될 수 있도록 false로 설정한다
 -->
 
 
 
 













