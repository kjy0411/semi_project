<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>공항 리스트</title>
</head>
<body>
    <h1>공항 리스트</h1>
    <ul>
        <c:forEach items="${airportList}" var="airport">
            <li>
                <a href="<c:url value='/airport/detail/${airport.ai_num}'/>">
                    ${airport.ai_name}
                    ${airport.ai_num}
                </a>
            </li>
        </c:forEach>
    </ul>
    <a href="<c:url value='/airport/insert'/>">공항 등록</a>
    <a href="<c:url value='/route/delete'/>">노선 삭제</a>
</body>
</html>