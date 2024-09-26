<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판 목록</title>
<link rel="stylesheet" href="../css/main.css">
<link rel="icon" href="../image/odiga_logo.jpeg" type="../image/gif" />
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<link rel="stylesheet" href="../css/qna_list.css">
</head>
<body class="main_window">
    <!-- header -->
    <jsp:include page="../main/header.jsp" />
    <br/>
    
    <!-- content -->
    <div id="qna_board_list_content_div">
        <br/>
        <div align="center">
            <h2>QnA</h2>
        </div>
        <p>총 ${totalA }건 / 금일 ${noCheck }건</p> 
        <!-- 게시글 목록 -->
        <table id="qna_board_list_table">
            <thead>
			    <tr>
			        <th width="50" style="border-bottom: 2px solid #0056B3;">번호</th>
			        <th width="300" style="border-bottom: 2px solid #0056B3;">내용</th>
			        <th width="100" style="border-bottom: 2px solid #0056B3;">작성자</th>
			        <th width="100" style="border-bottom: 2px solid #0056B3;">작성일</th>
			        <th width="100" style="border-bottom: 2px solid #0056B3;">답글 여부</th>
			    </tr>
			</thead>

            <tbody>
			    <c:forEach var="qnaDTO" items="${list}">
			        <tr class="accordion" data-seq="${qnaDTO.seq}" style="border-bottom:1px solid #E2E2E2;">
			            <td>
                            ${qnaDTO.seq}
                        </td>
			            <td class="title">
						    <c:choose>
						        <c:when test="${qnaDTO.qnaCheck == 'T'}"> <!-- 비밀글 여부 확인 -->
						            <img alt="자물쇠" src="../image/qna_secret.jpg" width='10' height='10' style="margin-right: 5px;">
						            쉿 비밀입니다~!
						        </c:when>
						        <c:otherwise>
						            ${qnaDTO.qnaUserContent}
						        </c:otherwise>
						    </c:choose>
						    <img src="../image/qna_plus.png" alt="추가" width="15" height="15" class="toggle-plus" data-open="../image/qna_minus.png">
						</td>
			            <td>${qnaDTO.qnaId}</td>
			            <td>
						    <fmt:formatDate value="${qnaDTO.logtime}" pattern="yyyy-MM-dd" />
						</td>
						<td>
		                    <c:if test="${not empty qnaDTO.qnaAdminContent}">
		                        <img src="../image/qna_check.png" alt="답글체크" width="15" height="15" style="padding-right: 5px;">
		                    </c:if>
		                </td>
			        </tr>
			        <tr class="panel" data-seq="${qnaDTO.seq}" style="display: none;">
					    <td colspan="4">
					        <c:choose>
					            <c:when test="${empty qnaDTO.qnaAdminContent}"> <!-- 댓글 여부 확인 -->
					                <p>답글이 없습니다 ㅠㅠ</p>
					                <!-- 관리자일 경우 -->
					                <c:if test="${not empty requestScope.userID and requestScope.userID == 'admin'}"> 
					                    <textarea id="replyContent_${qnaDTO.seq}" rows="4" placeholder="답글을 입력해주세요..." style="width: 100%;"></textarea>
					                    <div class="align-right">
					                        <button id="AdminWrite_button_${qnaDTO.seq}" type="button" onclick="submitReply(${qnaDTO.seq})">답글 작성</button>
					                    </div>
					                </c:if>
					            </c:when>
					           <c:otherwise>
								    <c:if test="${qnaDTO.qnaCheck == 'T' && requestScope.userID != 'admin' && requestScope.userID != qnaDTO.qnaId}">
								        <!-- 비밀글이고, 관리자가 아니며 글쓴이가 아닌 경우 -->
								        <img alt="자물쇠" src="../image/qna_secret.jpg" width='10' height='10' style="margin-right: 5px;">
								        비밀글입니다~!
								    </c:if>
								    <c:if test="${qnaDTO.qnaCheck == 'T' && (requestScope.userID == 'admin' || requestScope.userID == qnaDTO.qnaId)}">
								        <!-- 비밀글이고, 관리자이거나 글쓴이인 경우 -->
								        <img src="../image/qna_reply.png" alt="답글" width="15" height="15" style="padding-right: 5px;">
								        <span>${qnaDTO.qnaAdminContent}</span>
								    </c:if>
								    <c:if test="${qnaDTO.qnaCheck != 'T'}">
								        <!-- 비밀글이 아닌 경우 -->
								        <img src="../image/qna_reply.png" alt="답글" width="15" height="15" style="padding-right: 5px;">
								        <span>${qnaDTO.qnaAdminContent}</span>
								    </c:if>
								</c:otherwise>
					        </c:choose>
					    </td>
					</tr>

			    </c:forEach>
			</tbody>
        </table>

        <!-- 페이징 처리 -->
        <div style="text-align:center; margin-top:20px;">
			${qnaPaging.pagingHTML}
		</div>

        <!-- 게시글 작성 버튼 -->
        <div align="right">
            <button id="write_button" type="button" onclick="location.href='${pageContext.request.contextPath}/qna/qnaWriteForm.do'">글쓰기</button>
        </div>
    </div>
    
    <!-- footer -->
    <jsp:include page="../main/footer.jsp" />
    
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/main_scrip.js"></script>
<script type="text/javascript">
function qnaPaging(pg) {
    location.href = "../qna/qnaListForm.do?pg=" + pg;
}

function submitReply(seq) {
    var replyContent = $("#replyContent_" + seq).val(); // 해당 seq에 맞는 텍스트 영역의 값을 가져옵니다.

    if (replyContent.trim() === "") {
        alert("답글 내용을 입력해 주세요."); // 내용이 비어있을 경우 경고
        return;
    }

    // AJAX 요청
    $.ajax({
        url: '../qna/qnaReplyWrite.do', // 답글을 처리하는 서버 URL
        type: 'POST',
        data: {
            seq: seq, // 원본 게시글의 seq 값
            replyContent: replyContent // 답글 내용
        },
        success: function() {
            alert("답글이 등록되었습니다.");
            location.reload(); // 페이지를 새로 고침
        },
        error: function() {
            alert("답글 등록에 실패했습니다.");
        }
    });
}
$(".accordion").click(function(event) {
    event.stopPropagation(); // 클릭 이벤트가 부모 요소에 전파되는 것을 방지합니다.
    var panel = $(this).next(".panel");
    
    // 패널의 표시 상태를 슬라이드 토글합니다.
    panel.slideToggle(function() {
        var $this = $(this); // 패널 요소
        var $img = panel.prev().find(".toggle-plus"); // 현재 클릭된 이미지
        
        // 패널이 보이면 이미지 변경
        if ($this.is(":visible")) {
            $img.attr("src", $img.data("open")); // 열렸을 때의 이미지로 변경
        } else {
            $img.attr("src", "../image/qna_plus.png"); // 닫혔을 때의 이미지로 변경
        }
    });
});



// 페이지 로드 시 모든 패널을 숨기고 플러스 이미지로 초기화
$(document).ready(function() {
    $(".panel").hide(); // 모든 패널 숨김
    $(".toggle-plus").attr("src", "../image/qna_plus.png");
});
</script>
</body>
</html>