<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 목록</title>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/qna_list.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
.accordion {
    background-color: #eee;
    color: #444;
    cursor: pointer;
    padding: 10px;
    width: 100%;
    border: none;
    text-align: left;
    outline: none;
    font-size: 15px;
}

.accordion.active, .accordion:hover {
    background-color: #ccc;
}

.panel {
    padding: 0 18px;
    display: none;
    overflow: hidden;
    background-color: white;
}
</style>
</head>
<body>
    <h2>Q&A 목록</h2>
    <div id="qnaList">
        <c:forEach var="qna" items="${qnaList}">
            <button class="accordion">${qna.qnatitle}</button>
            <div class="panel">
                <p>${qna.qnacontent}</p>
                <p>작성자: ${qna.qnaId}</p>
                <p>작성일: ${qna.logtime}</p>
            </div>
        </c:forEach>
    </div>

    <script>
        var acc = document.getElementsByClassName("accordion");
        for (let i = 0; i < acc.length; i++) {
            acc[i].addEventListener("click", function() {
                this.classList.toggle("active");
                var panel = this.nextElementSibling;
                if (panel.style.display === "block") {
                    panel.style.display = "none";
                } else {
                    panel.style.display = "block";
                }
            });
        }
    </script>
</body>
</html>