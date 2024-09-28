
function repostImage() {
   
    $('#imageContainer').empty();
    
    
    $('input:checkbox[name=seq]:checked').each(function() {
    	
    	var seq = $(this).val();
    	
    	var image1 = $(this).attr('id');
    	
    	var br = $('<br>');
    	
    	var imageUrl = "https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-133/storage/"+image1;
   
        var img = $('<img>').attr('src', imageUrl).css({
            width: '200px',
            height: 'auto',
            marginRight: '20px'
        });
     	
        $('#imageContainer').append(seq);
        $('#imageContainer').append(img);
    });
}

function AddImage() {

    let selectedSeq = [];

    $('input:checkbox[name=seq]:checked').each(function() {
        var seq = $(this).val();
        selectedSeq.push(seq); 
    });

    if (selectedSeq.length === 0) {
        alert("이미지를 선택해 주세요."); 
        return;
    }
	
    $.ajax({
        type: 'POST',
        url: '/project_ODIGA/main_admin/adminMainBannerControl.do', 
        data: { seq: selectedSeq }, 
        dataType : 'json',
        traditional: true,
        success: function() {
            alert("이미지가 성공적으로 추가되었습니다!");
        },
        error: function(xhr, status, error) {
     
            alert("이미 존재하는 이미지가 있습니다 ");
        }
    });
}



    function bannerdelete(seq) {
        if (confirm('이 이미지를 정말로 삭제하시겠습니까?')) {
            $.ajax({
                type: 'POST',
                url: '/project_ODIGA/main_admin/adminBannerDelete.do',
                data: { seq: seq },
                success: function(response) {
                    alert('삭제 완료');
                    location.reload();
                },
                error: function(xhr, status, error) {
                    alert('삭제 실패: ' + error);
                }
            });
        }
    }
    
    function imagebannerboardPaging(pg) {
        location.href = "imagebannerboardList.do?pg=" + pg;
    }
	
	
	
// 메인배너 

   
function mainbannerdelete(seq) {
           if (confirm('이 이미지를 배너에서 내리겠습니까?')) {
               $.ajax({
                   type: 'POST',
                   url: '/project_ODIGA/main_admin/adminMainBannerDelete.do',
                   data: { seq: seq },
                   success: function(response) {
                       alert('삭제 완료');
                       location.reload();
                   },
                   error: function(xhr, status, error) {
                       alert('삭제 실패: ' + error);
                   }
               });
           }
       }

   function loadBanner(pg = 1) {
	$('#bannerList').empty();
	$('#bannerList2').empty();
       // 기본적으로 pg 값을 1로 설정 (처음 로드할 때 사용)
       $('#bannerList').load(`imagebannerboardList.do?pg=${pg}&ajax=1`);
   }


   // 동적으로 페이지 번호를 클릭할 때마다 AJAX 요청을 보내는 이벤트 처리
   $(document).on('click', '.page-link', function(event) {
       event.preventDefault(); // 기본 동작을 막음 (페이지 새로고침 방지)

       const pg = $(this).data('pg'); // 클릭한 페이지 번호 가져오기
       loadBanner(pg); // 해당 페이지 번호로 AJAX 요청
   });

function unloadBanner() {
    $('#bannerList').empty();
}

   function loadBanner2(pg = 1) {
	$('#bannerList').empty();
       // 기본적으로 pg 값을 1로 설정 (처음 로드할 때 사용)
       $('#bannerList2').load(`imagebannerboardList.do?pg=${pg}&ajax=1`);
   }


   // 동적으로 페이지 번호를 클릭할 때마다 AJAX 요청을 보내는 이벤트 처리
   $(document).on('click', '.page-link', function(event) {
       event.preventDefault(); // 기본 동작을 막음 (페이지 새로고침 방지)

       const pg = $(this).data('pg'); // 클릭한 페이지 번호 가져오기
       loadBanner2(pg); // 해당 페이지 번호로 AJAX 요청
   });

   function unloadBanner2() {
       $('#bannerList2').empty();
   }
  
   
   
function unloadBanner3() {
    $('#bannerList3').empty();
}


   function loadBanner3(pg = 1) {
	$('#bannerList3').empty();
       // 기본적으로 pg 값을 1로 설정 (처음 로드할 때 사용)
       $('#bannerList3').load(`imagebannerboardList.do?pg=${pg}&ajax=1`);
   }


   // 동적으로 페이지 번호를 클릭할 때마다 AJAX 요청을 보내는 이벤트 처리
   $(document).on('click', '.page-link', function(event) {
       event.preventDefault(); // 기본 동작을 막음 (페이지 새로고침 방지)

       const pg = $(this).data('pg'); // 클릭한 페이지 번호 가져오기
       loadBanner3(pg); // 해당 페이지 번호로 AJAX 요청
   });
   

      function uploadBanner3(pg = 1) {
   	$('#bannerList3').empty();
          // 기본적으로 pg 값을 1로 설정 (처음 로드할 때 사용)
          $('#bannerList3').load(`adminBannerInsertForm.do`);
      }
	
   
   
   


function repostImage() {
	
    $('#imageContainer').empty();
    
    $('#imageContainer').css({
        display: 'flex',
        flexWrap: 'wrap', 
        alignItems: 'center' 
    });
    
    $('input:checkbox[name=seq]:checked').each(function() {
    	
    	var seq = $(this).val();
    	
    	var image1 = $(this).attr('id');
    	
    	var br = $('<br>');
    	
    	var imageUrl = "https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-133/storage/"+image1;
   
        var img = $('<img>').attr('src', imageUrl).css({
            width: '70px',
            height: '70px',
            marginRight: '20px'
        });
     	
        $('#imageContainer').append(seq);
        $('#imageContainer').append(img);
    });
}

function AddImage() {

    let selectedSeq = [];

    $('input:checkbox[name=seq]:checked').each(function() {
        var seq = $(this).val();
        selectedSeq.push(seq); 
    });

    if (selectedSeq.length === 0) {
        alert("이미지를 선택해 주세요."); 
        return;
    }
	
    $.ajax({
        type: 'POST',
        url: '/project_ODIGA/main_admin/adminMainBannerControl.do', 
        data: { seq: selectedSeq }, 
        dataType : 'json',
        traditional: true,
        success: function() {
            alert("이미지가 성공적으로 추가되었습니다!");
			location.reload();
        },
        error: function(xhr, status, error) {
     
            alert("이미 존재하는 이미지가 있습니다 ");
        }
    });
}	


   function loadMainBanner() {
    $('#bannerList').empty();
    $('#bannerList').load('adminMainBannerPreview.jsp');
}



function loadBannerMain() {
    $('#bannerList3').empty(); 
    $('#bannerList3').load('../main_admin/adminBannerForm.jsp'); 
}

	
	