$(function() {
	$.ajax({
		type: 'get',
		url : '../json/foodReview.json',
		dataType : 'json',
		success : function(data) { 
			let total = data.total;
			$('.food_content > span').text(total);
			
			let tmpl = $('#reviewTemplate').tmpl(data.item);
			$('tbody').append(tmpl);
			
		},
		error : function(e) {        
			console.log(e);
		}
	});
	
	$('#review_add_button').click(function(){
		window.location.href = 'review_add.html';
	});
});
