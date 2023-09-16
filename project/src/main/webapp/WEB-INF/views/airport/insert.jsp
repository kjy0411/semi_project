<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>공항 등록</title>
</head>
<body>
    <h1>공항 등록</h1>
    <form id="airportForm">
        <label for="ai_name">공항 이름:</label>
        <input type="text" id="ai_name" name="ai_name" required><br><br>
        <label for="ai_na_name">국가 이름:</label>
        <input type="text" id="ai_na_name" name="ai_na_name" required><br><br>
        <label for="ai_standard_time">국가 표준 시(UTC):</label>
        <input type="text" id="ai_standard_time" name="ai_standard_time" required><br><br>
        <button type="submit">공항 추가</button>
    </form>
</body>
</html>

