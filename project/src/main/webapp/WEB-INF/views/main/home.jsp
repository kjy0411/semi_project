<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
    pageEncoding="utf-8" %>
<html>
<head>
    <title>Home</title>
    <style>
        .box {
            height: 500px;
            width: 100%;
            overflow: hidden;
        }
        .list {
            margin: 0;
            padding: 0;
            width: 310%; /* 이미지가 3개이므로 300%로 설정 */
            display: flex; /* 이미지들을 가로로 나열 */
            transition: margin-left 1.2s; /* 슬라이드 효과를 위한 트랜지션 */
        }
        .item {
            height: 500px;
            flex: 1; /* 동일한 너비를 가지도록 설정 */
        }
    </style>
</head>
<body>
<div class="box">
    <div class="list">
        <img class="item" src="<c:url value='/resources/img/01.png'/>">
        <img class="item" src="<c:url value='/resources/img/02.png'/>">
        <img class="item" src="<c:url value='/resources/img/03.png'/>">
    </div>
</div>
<script>
    $('.box').hover(function () {
        // 롤링을 멈춤
        clearInterval(id);
    }, function () {
        // 롤링을 시작
        id = rolling();
    });

    let id = rolling();

    function rolling() {
        return setInterval(() => {
            let width = $('.item').width();
            $('.list').animate({ 'margin-left': `-${width}px` }, 1200, function () {
                // 슬라이딩 완료 후 첫 번째 이미지를 마지막으로 이동
                $(this).append($(this).children().first());
                $(this).css('margin-left', 0); // 초기 위치로 이동
            });
        }, 10000); // 이미지가 10초마다 슬라이드되도록 변경
    }
</script>
</body>
</html> 