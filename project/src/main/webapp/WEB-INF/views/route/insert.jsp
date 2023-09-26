<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1 class="mt-5">노선 등록</h1>
        <div class="row">
            <div class="col-md-6">
                <!-- 노선 리스트 표시 -->
                <h2>노선 리스트</h2>
                <ul class="list-group">
                    <c:forEach items="${routeList}" var="route">
                        <li class="list-group-item">${route.ro_ai_start} - ${route.ro_ai_end}</li>
                    </c:forEach>
                </ul>
            </div>
            <div class="col-md-6">
                <form id="insertRoute" action="/project/route/insert" method="post" class="mt-3">
                    <div class="form-group">
                        <label for="ro_ai_start">출발 공항:</label>
                        <input type="text" id="ro_ai_start" name="ro_ai_start" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label for="ro_ai_end">도착 공항:</label>
                        <input type="text" id="ro_ai_end" name="ro_ai_end" class="form-control" required>
                    </div>

                    <!-- 중복 메시지를 표시합니다. -->
                    <c:if test="${not empty duplicateMessage}">
                        <p style="color: red">${duplicateMessage}</p>
                    </c:if>

                    <!-- 인식할 수 없는 공항 메시지를 표시합니다. -->
                    <c:if test="${not empty invalidAirportMessage}">
                        <p style="color: red">${invalidAirportMessage}</p>
                    </c:if>
                    
                    <!-- 성공 메시지를 표시합니다. -->
                    <c:if test="${not empty successMessage}">
                        <p style="color: green">${successMessage}</p>
                    </c:if>

                    <button type="submit" class="btn btn-primary">노선 등록</button>
                    <a href="<c:url value='/airport/list'/>" class="btn btn-secondary mt-2">공항 리스트로 돌아가기</a>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
