<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>공항 등록</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

</head>
<body>
   <div class="container">
        <h1 class="mt-5">공항 등록</h1>
        <div class="row">
            <!-- 왼쪽 컨테이너에 공항 리스트 표시 -->
            <div class="left col-md-6" style="height: 400px; overflow-y: scroll;">

                <ul class="list-group">
                    <c:forEach items="${airportList}" var="airport">
                        <li class="list-group-item">${airport.ai_num} - ${airport.ai_name}</li>
                    </c:forEach>
                </ul>
            </div>
            <div class="col-md-6">
                <h1>공항 등록</h1>
                <form id="airportForm" action="/project/airport/insert" method="post">
                    <div class="form-group">
                        <label for="ai_num">IATA 코드:</label>
                        <input type="text" class="form-control" id="ai_num" name="aiNum" required>
                        <!-- 중복 IATA 메시지 표시 -->
                        <p style="color: red" id="duplicateIATAMessage"></p>
                    </div>
                    <div class="form-group">
                        <label for="ai_name">공항 이름:</label>
                        <input type="text" class="form-control" id="ai_name" name="aiName" required>
                    </div>
                    <div class="form-group">
                        <label for="ai_na_name">국가 이름:</label>
                        <input type="text" class="form-control" id="ai_na_name" name="aiNaName" required>
                        <!-- 국가 유효성 검사 메시지 표시 -->
                        <p style="color: red" id="invalidNationMessage"></p>
                    </div>
                    <div class="form-group">
                        <label for="ai_standard_time">국가 표준 시(UTC):</label>
                        <input type="text" class="form-control" id="ai_standard_time" name="aiStandardTime" required>
                    </div>
                    
                    <!-- 중복 메시지를 표시합니다. -->
                    <c:if test="${not empty duplicateMessage}">
                        <p style="color: red">${duplicateMessage}</p>
                    </c:if>

                    <button type="submit" class="btn btn-primary">공항 등록</button>

                <a href="<c:url value='/airport/delete'/>" class="btn btn-outline-warning">공항 삭제</a>
                </form>
                <a href="<c:url value='/airport/list'/>" class="btn btn-secondary mt-2">공항 리스트로 돌아가기</a>
            </div>
        </div>
    </div>

    <script>
    document.getElementById("ai_num").addEventListener("change", function () {
        // 현재 입력된 IATA 코드 가져오기
        var aiNum = this.value;
        // 서버로부터 공항 목록을 가져오는 AJAX 요청
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "/project/airport/getAirportList", true);
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    // 서버 응답을 파싱합니다.
                    var airportList = JSON.parse(xhr.responseText);
                    // 공항 목록에서 IATA 코드만 추출하여 배열로 만듭니다.
                    var existingIATACodes = airportList.map(function (airport) {
                        return airport.ai_num;
                    });
                    var duplicateIATAMessageElement = document.getElementById("duplicateIATAMessage");
                    // 입력된 IATA 코드가 이미 존재하는지 확인합니다.
                    if (existingIATACodes.includes(aiNum)) {
                        duplicateIATAMessageElement.style.color = "red";
                        duplicateIATAMessageElement.innerHTML = "중복된 IATA 코드입니다.";
                    } else {
                        duplicateIATAMessageElement.style.color = "transparent"; // 숨기기
                        duplicateIATAMessageElement.style.color = "transparent"; 
                        duplicateIATAMessageElement.innerHTML = "";
                    }
                }
            }
        };
        // AJAX 요청 보내기
        xhr.send();
    });
    </script>
</body>
</html>