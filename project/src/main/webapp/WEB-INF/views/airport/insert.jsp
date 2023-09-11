<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>공항 등록</title>
</head>
<body>
    <h1>공항 등록</h1>
    <form action="/airport/insert" method="post">
        <label for="airportName">공항 이름:</label>
        <input type="text" id="airportName" name="airportName" required><br><br>
        
        
        
        <button type="submit">공항 추가</button>
    </form>
</body>
</html>

