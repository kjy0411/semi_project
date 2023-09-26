<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>노선 삭제</title>
</head>
<body>
    <h1>노선 삭제</h1>
    <form action="/route/delete" method="get">
        <label for="routeNumber">노선 번호:</label>
        <input type="text" id="routeNumber" name="routeNumber" required><br><br>
        
        <button type="submit">노선 삭제</button>
    </form>
</body>
</html>
