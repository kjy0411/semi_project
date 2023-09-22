<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>공항 상세 정보</title>
</head>
<body>
		    <h1>공항 상세 정보</h1>
		<h2>공항 이름: ${airport.ai_name}</h2>
		<h3>국가: ${airport.ai_na_name}</h3>
		<h4>표준 시간대: ${airport.ai_standard_time_str}</h4>
		
		<div style="float: left; width: 50%;">
		<h2>출발 노선:</h2>
		<ul>
		    <c:forEach items="${departureRoutes}" var="departureRoute">
		        <li>${departureRoute.ro_num} - ${departureRoute.ro_ai_start} - ${departureRoute.ro_ai_end}</li>
		    </c:forEach>
		</ul>
		</div>
		
		<div style="float: right; width: 50%;">
		<h2>도착 노선:</h2>
		<ul>
		    <c:forEach items="${arrivalRoutes}" var="arrivalRoute">
		        <li>${arrivalRoute.ro_num} - ${arrivalRoute.ro_ai_start} - ${arrivalRoute.ro_ai_end}</li>
		    </c:forEach>
		</ul>
		</div>
		
		<a href="<c:url value='/airport/list'/>">공항 목록으로 돌아가기</a>

</body>
</html>
