<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>노선 등록</title>
</head>
<body>
    <h1>노선 등록</h1>
    
    <!-- 노선 리스트 표시 -->
    <h2>노선 리스트</h2>
    <ul>
        <c:forEach items="${routeList}" var="route">
            <li>${route.ro_ai_start} - ${route.ro_ai_end}</li>
        </c:forEach>
    </ul>
    
    <form id="insertRoute" action="/project/route/insert" method="post">
        <label for="ro_ai_start">출발 공항:</label>
        <input type="text" id="ro_ai_start" name="ro_ai_start" required><br><br>

        <label for="ro_ai_end">도착 공항:</label>
        <input type="text" id="ro_ai_end" name="ro_ai_end" required><br><br>
        
        <!-- 중복 메시지를 표시합니다. -->
        <c:if test="${not empty duplicateMessage}">
            <p style="color: red">${duplicateMessage}</p>
        </c:if>

        <!-- 인식할 수 없는 공항 메시지를 표시합니다. -->
        <c:if test="${not empty invalidAirportMessage}">
            <p style="color: red">${invalidAirportMessage}</p>
        </c:if>
        
        <button type="submit">노선 등록</button>
    </form>
</body>
</html>
