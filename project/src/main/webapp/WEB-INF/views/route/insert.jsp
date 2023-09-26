<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>노선 등록</title>
</head>
<body>
    <h1>노선 등록</h1>
    <form action="/route/insert" method="post">
        <label for="departureAirport">출발 공항:</label>
        <input type="text" id="departureAirport" name="departureAirport" required><br><br>
        
        <label for="arrivalAirport">도착 공항:</label>
        <input type="text" id="arrivalAirport" name="arrivalAirport" required><br><br>
        
        <button type="submit">노선 추가</button>
    </form>
</body>
</html>
