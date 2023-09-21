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

        <!-- 인식할 수 없는 공항 메시지를 표시합니다. -->
        <c:if test="${not empty invalidAirportMessage}">
            <p style="color: red">${invalidAirportMessage}</p>
        </c:if>
        
        <button type="submit">공항 추가</button>
    </form>
    
    <a href="<c:url value='/airport/list'/>">공항 리스트</a>
</body>
</html>
