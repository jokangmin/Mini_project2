$(function() {
	let review_id;
	let result = false;

	// 아이디 확인 부분
	$('#review_id').focusout(function() {
		$('#check').empty();
		let input_id = $(this).val();
		$.post('../jsp/id_check.jsp',
			{ 'user_id': input_id },
			function(data) {
				let result_text = $(data).find('result').text();
				result = eval(result_text);

				if (result) {
					review_id = $('#review_id').val();
				} else {
					$('#check').text("회원님의 아이디가 아닙니다.");
					focus('#review_id');
				}
			}).fail(function(e) {
			alert('아이디 확인 실패 에러:' + e);
		}); 
	}); // 아이디 확인

	// 리뷰 제출 부분
	$('.food_content_add').submit(function(event) {
		event.preventDefault();
		
		let review_title = $('#review_title').val();
		let review_content = $('#reviewInput').val();

		if (!review_title || !review_id || !review_content) {
			alert("정보를 모두 입력해주세요.");
		} else {
			if (result) {
				$.post('../jsp/review_add.jsp',
					{ 'review_title': review_title, 'review_id': review_id, 'review_content': review_content },
					function(data) {

						let review_num = $(data).find('review_num').text();
						let review_title = $(data).find('review_title').text();
						let review_id = $(data).find('review_id').text();
						let review_date = $(data).find('review_date').text();

						console.log('review_num:', review_num);
				       	console.log('review_title:', review_title);
				       	console.log('review_id:', review_id);
				       	console.log('review_date:', review_date);
						alert('리뷰작성완료');
						// 새 리뷰 데이터 생성
						let newReview = {
							no: review_num,
							subject: review_title,
							id: review_id,
							date: review_date
						};
						
						$.ajax({
							type: 'get',
							url : '../json/foodReview.json',
							dataType : 'json',
							success : function(data) { 
								data.item.push(newReview);
								data.total;
								console.log(newReview);
								let tmpl = $('#reviewTemplate').tmpl(newReview);
								$('tbody').append(tmpl);
								alert('리뷰작성완료');
								window.location.href = 'travel2.html';
								
							},
							error : function(e) {        
								console.log(e);
							}
						});
					
					}).fail(function(e) {
					alert('리뷰 기입 실패. . . 확인해보세요. 에러:' + e);
				});
			}
		}
	});
});
