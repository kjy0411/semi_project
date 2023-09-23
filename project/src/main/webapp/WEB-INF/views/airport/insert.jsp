<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>공항 등록</title>
</head>
<body>
    <h1>공항 등록</h1>
    <form id="airportForm" action="/project/airport/insert" method="post">
        <label for="ai_num">IATA 코드:</label>
        <input type="text" id="ai_num" name="aiNum" required><br><br>
        <label for="ai_name">공항 이름:</label>
        <input type="text" id="ai_name" name="aiName" required><br><br>
        <label for="ai_na_name">국가 이름:</label>
        <input type="text" id="ai_na_name" name="aiNaName" required><br><br>
        <label for="ai_standard_time">국가 표준 시(UTC):</label>
        <input type="text" id="ai_standard_time" name="aiStandardTime" required><br><br>
        
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
        
        <button type="submit">공항 등록</button>
    </form>
    
    <a href="<c:url value='/airport/list'/>">공항 리스트</a>
</body>
</html>
