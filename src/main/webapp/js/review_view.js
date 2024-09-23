$(function() {
	const urlParams = new URLSearchParams(window.location.search);
	const review_no = urlParams.get('no');
	const review_id = urlParams.get('id');
	
	$.post('../jsp/review_content.jsp',
		{ 'review_no': review_no,
		  'review_id': review_id},
		function(data) {
			let review_title = $(data).find('review_title').text();
			let review_content = $(data).find('review_content').text();
			
			$('#review_id').text(review_id);
			$('#review_title').text(review_title);
			$('#reviewInput').text(review_content);
			
		}).fail(function(e) {
		alert('아이디 확인 실패 에러:' + e);
		}); 
		
	$('#review_update').click(function(){
		
	});
	
	$('#review_delete').click(function(){
			
	});
	
});
