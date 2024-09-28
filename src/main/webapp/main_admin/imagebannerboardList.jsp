<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>이미지 배너 관리</title>
    <link rel="stylesheet" href="../css/banner.css">   
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="../css/bannertitle.css"> 

<style type="text/css">
  	#imagelist{
  		    width: 150px; 
  	}

    img {
   
       
        border-radius: 8px; /* 모서리 둥글게 */
        box-shadow: 0 1px 5px rgba(0, 0, 0, 0.2); /* 이미지 그림자 */
        transition: transform 0.3s; /* 이미지 확대 효과 */
        text-align: center;
    }

    img:hover {
        transform: scale(1.1); /* 이미지 마우스 오버 시 확대 */
    }

 

    #pagingText {
        color: black; 
        font-weight: bold; 
        cursor: pointer; 
        margin: 15px; /* 여백 추가 */
    }

    #paging:hover,
    #currentPaging:hover {
        color: blue; 
        font-weight: bold; 
        cursor: pointer; 
        font-size: 20px; 
    }

    .modern-button {
        padding: 10px 20px; /* 버튼 패딩 */
        background-color: #007bff; /* 버튼 배경색 */
        color: white; /* 버튼 글자색 */
        border: none; /* 경계선 제거 */
        border-radius: 5px; /* 모서리 둥글게 */
        cursor: pointer; /* 커서 포인터 변경 */
        transition: background-color 0.3s; /* 색상 전환 효과 */
    }

    .modern-button:hover {
        background-color: #0056b3; /* 마우스 오버 시 색상 변경 */
    }
    


</style>
</head>
<body>

	 <c:if test="${empty param.ajax}">
    <jsp:include page="adminBannerForm.jsp" />
     </c:if>
    
    <div id="section" class="imagebannerboardListDiv">
        <table border="1" frame="hsides" rules="rows" >
            <tr align="center">
                <th width="100">번호</th>
                <th width="300">이미지</th>
                <th width="200">이름</th>
                <th width="150">
               <span style="display: inline-block;"> 단가</span>
               
                </th>
                <th width="150">
               <span style="display: inline-block;">시간</span>
                 </th>
                 
                <th width="150">
             <span style="display: inline-block;">비용</span>
               </th>
                <th width="100">삭제</th>
            </tr>
            
            <c:if test="${requestScope.list != null}">
                <c:forEach var="imagebannerboardDTO" items="${list}">
                    <tr>
                        <td align="center">
                            <input type="checkbox" name="seq" class="image-checkbox" value="${imagebannerboardDTO.seq}" id="${imagebannerboardDTO.image1}"/>
                            ${imagebannerboardDTO.seq}
                        </td>
                        <td align="center">
                            <img id="imagelist" src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-133/storage/${imagebannerboardDTO.image1}" 
                                 alt="${imagebannerboardDTO.imageName}" width="200" />
                        </td>
                        <td align="center" id="imagelist">${imagebannerboardDTO.imageName}</td>
                        <td align="center">
                            <fmt:formatNumber pattern="#,###" value="${imagebannerboardDTO.imagePrice}"/>
                        </td>
                        <td align="center">
                            <fmt:formatNumber pattern="#,###" value="${imagebannerboardDTO.imageQty}"/>
                        </td>
                        <td align="center">
                            <fmt:formatNumber pattern="#,###" value="${imagebannerboardDTO.imagePrice * imagebannerboardDTO.imageQty}"/>
                        </td>
                        <td align="center">
                            <input class="modern-button" type="button" value="삭제" onclick="bannerdelete('${imagebannerboardDTO.seq}')"/>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
        </table>
        
        <div style="text-align: center;">
            <div id="pagingText" style="float: left; text-align: center; width: 620px; margin: 15px; letter-spacing: 10px;">
                ${imagebannerboardPaging.pagingHTML}
            </div>
        </div>

        <br>
     
        <div style="width: 700px; text-align: center;">
            <input class="modern-button" type="button" value="선택한 배너 미리보기" onclick="repostImage()"/>
            <input class="modern-button" type="button" value="메인 배너 등록" onclick="AddImage()">
        </div>
        
        <div id="imageContainer" style=" margin-top: 20px; " ></div>
        
    </div> <!-- id="section" -->

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../js/bannerList.js"></script>
</body>
</html>