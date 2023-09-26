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
        <div class="row">
            <div class="col-md-6">
                <h1>공항 리스트</h1>
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
                    </div>
                    <div class="form-group">
                        <label for="ai_name">공항 이름:</label>
                        <input type="text" class="form-control" id="ai_name" name="aiName" required>
                    </div>
                    <div class="form-group">
                        <label for="ai_na_name">국가 이름:</label>
                        <input type="text" class="form-control" id="ai_na_name" name="aiNaName" required>
                    </div>
                    <div class="form-group">
                        <label for="ai_standard_time">국가 표준 시(UTC):</label>
                        <input type="text" class="form-control" id="ai_standard_time" name="aiStandardTime" required>
                    </div>
                    
                    <!-- 중복 메시지를 표시합니다. -->
                    <c:if test="${not empty duplicateMessage}">
                        <p style="color: red">${duplicateMessage}</p>
                    </c:if>
                    
                    <!-- 중복 IATA를 표시합니다. -->
                    <c:if test="${not empty duplicateIATAMessage}">
                        <p style="color: red">${duplicateIATAMessage}</p>
                    </c:if>
    
                    <!-- 국가 유효성 검사 메시지를 표시합니다. -->
                    <c:if test="${not empty invalidNationMessage}">
                        <p style="color: red">${invalidNationMessage}</p>
                    </c:if>
                    
                    <button type="submit" class="btn btn-primary">공항 등록</button>
                    
                <a href="<c:url value='/airport/delete'/>" class="btn btn-outline-warning">공항 삭제</a>
                </form>
                <a href="<c:url value='/airport/list'/>" class="btn btn-secondary mt-2">공항 리스트로 돌아가기</a>
            </div>
        </div>

       
    </div>
    
    
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
