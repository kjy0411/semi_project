<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>공항 상세 정보</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        
        .airport-info {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="mt-4">공항 상세 정보</h1>
        
        <!-- 공항 정보 -->
        <div class="row airport-info">
            <div class="col-md-4">
                <h2>공항 이름</h2>
                <p>${airport.ai_name}</p>
            </div>
            <div class="col-md-4">
                <h2>국가</h2>
                <p>${airport.ai_na_name}</p>
            </div>
            <div class="col-md-4">
                <h2>표준 시간대(UTC)</h2>
                <p>${airport.ai_standard_time_str}</p>
            </div>
        </div>
        
        <!-- 출발 노선 -->
        <div class="airport-info">
            <h2>출발 노선</h2>
            <ul>
                <c:forEach items="${departureRoutes}" var="departureRoute">
                    <li>${departureRoute.ro_num} - ${departureRoute.ro_ai_start} - ${departureRoute.ro_ai_end}</li>
                </c:forEach>
            </ul>
        </div>
        
        <!-- 도착 노선 -->
        <div class="airport-info">
            <h2>도착 노선</h2>
            <ul>
                <c:forEach items="${arrivalRoutes}" var="arrivalRoute">
                    <li>${arrivalRoute.ro_num} - ${arrivalRoute.ro_ai_start} - ${arrivalRoute.ro_ai_end}</li>
                </c:forEach>
            </ul>
        </div>
        
        <a href="<c:url value='/airport/list'/>" class="btn btn-primary">공항 목록으로 돌아가기</a>
    </div>
    
    
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>