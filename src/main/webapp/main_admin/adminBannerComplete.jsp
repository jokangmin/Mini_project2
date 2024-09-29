<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<c:set var="context" value="${pageContext.request.contextPath}" />    

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>배너 관리</title>
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/table.css"> 
    <link rel="icon" href="../image/odiga_logo.jpeg" type="image/gif" />
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
</head>
<style>
    /* 버튼 스타일 */
    .btn-modern2 {
        background-color: #007BFF !important;
        color: white !important;
        border: none !important;
        border-radius: 5px !important;
        padding: 10px 20px !important;
        cursor: pointer !important;
        transition: background-color 0.3s !important;
        font-size: 16px !important;
    }

    .btn-modern2:hover {
        background-color: #0056b3 !important;
    }

    .btn-modern2:active {
        background-color: #004085 !important;
        transform: translateY(1px) !important;
    }

    /* 테이블 스타일 */
   #bannerManagementTable,#bannerManagementTableTD {
		
        border-collapse: collapse; 
        background-color: white; 
    }
    
     
     .snb {
    margin-bottom: 20px; /* Space below the sidebar */
}



    .imagebannerboardListDiv {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin: 30px auto;
        text-align: left;
        max-width: 600px;
        background: linear-gradient(135deg, #e0f7fa, #b2ebf2);
        padding: 20px;
        border-radius: 8px;
        border: 2px solid rgba(0, 0, 0, 0.2);
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
    }

</style>

<body class="main_window">
    <!-- 헤더 포함 -->
    <jsp:include page="../main/header.jsp" />
    
    <!-- 내용 -->
    <div id="container">
        <div class="snb">
            <ul>
            <li id="member_manage"><a href="${ context }/admin/adminMember.do">회원 관리</a></li>
        </ul>
        <ul>
            <li id="imgboard_manage"><a href="${ context }/main_admin/adminBannerComplete.do">배너 이미지 관리</a></li>
        </ul>
        <ul>
            <li id="qna_manage"><a href="${ context }/flyTour/tourListForm.do?pg=1">투어 관리</a></li>
        </ul>
        </div>
        
        <div class="banner-menu">
            
            <table id="bannerManagementTable">
                <tr>
                    <td id="bannerManagementTableTD">
                        <jsp:include page="../main_admin/adminBannerForm.jsp" />
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div id="bannerList3"></div>

    <!-- 푸터 포함 -->
    <jsp:include page="../main/footer.jsp" />
    
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>   
    <script type="text/javascript" src="../js/bannerList.js"></script>  
    <script type="text/javascript" src="../js/main_scrip.js"></script>
</body>  
</html>