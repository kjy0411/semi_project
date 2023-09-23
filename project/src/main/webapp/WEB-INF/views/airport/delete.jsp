<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>공항 삭제</title>
</head>
<body>
    <h1>공항 삭제</h1>
    
    <form action="/project/airport/delete" method="post">
        <label for="aiNum">삭제할 IATA 코드:</label>
        <input type="text" id="aiNum" name="aiNum" required><br><br>
        
        
        
        <button type="submit">삭제</button>
    </form>
    
    <a href="<c:url value='/airport/list'/>">공항 리스트</a>
    
</body>
</html>
