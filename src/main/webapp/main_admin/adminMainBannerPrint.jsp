<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>메인 배너</title>
    <link rel="stylesheet" href="../css/banner.css">  
    <link rel="stylesheet" href="../css/bannertitle.css"> 
      <link rel="stylesheet" href="../css/table.css"> 
    <style>

        h1 {
            text-align: center; /* 제목 중앙 정렬 */
            color: #333; /* 제목 색상 */
        }

        img {
            width: 200px; /* 이미지 고정 너비 */
            height: auto; /* 비율 유지 */
            border-radius: 8px; /* 모서리 둥글게 */
            box-shadow: 0 1px 5px rgba(0, 0, 0, 0.2); /* 이미지 그림자 */
        }
      
                
       	#load,#load2{
       		margin-left:20%;
       		float:left;
       	}
       	
       	
       	
    .imagebannerboardListDiv {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin: 10px auto;
        text-align: left;
        max-width: 1000px;
        background: linear-gradient(135deg, #e0f7fa, #b2ebf2);
        padding: 20px;
        border-radius: 8px;
        border: 2px solid rgba(0, 0, 0, 0.2);
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
    }
       	
       
    </style>
</head>
<body>

	<a href="../index/index_main.do"><img id="logo" src="../image/odiga_logo.jpeg" alt="#" width="135" height="60"/></a>  
    <h1>메인 배너 관리페이지</h1>

    <table>
        <tr>
            <c:forEach var="image" items="${imageList}">
                <td id="tdimg">
                    <img src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-133/storage/${image}" 
                         alt="Banner Image"/>
                </td>
            </c:forEach>
        </tr>
        <tr>
            <c:forEach var="seq" items="${arraySeq}">
                <td = id="tdseq">
                    <div>이미지번호: ${seq}</div> 
              <input class="modern-button" type="button" value="배너 내리기" onclick="mainbannerdelete('${seq}')"/>
               </td>
            </c:forEach>
        </tr>
        
            <tr>
        <td id = "tdbutton" colspan="10" style="text-align: center;"> <!-- 버튼이 2개인 경우 colspan 속성을 설정 -->
  <button class="modern-button" onclick="loadBanner()">배너 목록 가져오기</button> 
    <button class="modern-button" onclick="loadMainBanner()">메인 배너 미리보기</button> 
    <button class="modern-button" onclick="unloadBanner()">목록 숨기기 </button> 
<button class="modern-button" onclick="location.href='adminBannerComplete.do'">관리자 페이지</button>
        </td>
    </tr>
    </table>
   
<div id="bannerList"></div>

    
     <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../js/bannerList.js"></script>  

</body>
</html>