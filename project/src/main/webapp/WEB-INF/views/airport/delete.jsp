<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>공항 삭제</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        .delete-form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <div class="row">
            <!-- 왼쪽에 공항 리스트 표시 -->
            <div class="col-md-6">
                <h1>공항 삭제</h1>
                <ul class="list-group">
                    <c:forEach items="${airportList}" var="airport">
                        <li class="list-group-item">${airport.ai_num} - ${airport.ai_name}</li>
                    </c:forEach>
                </ul>
            </div>
            <!-- 오른쪽에 삭제 폼 표시 -->
            <div class="col-md-6">
                <form class="delete-form" action="/project/airport/delete" method="post">
                    <div class="form-group">
                        <label for="aiNum">삭제할 IATA 코드:</label>
                        <input type="text" class="form-control" id="aiNum" name="aiNum" required>
                    </div>
                    
                    <!-- 삭제 성공 메시지를 표시합니다. -->
					<c:if test="${not empty successMessage}">
					    <p style="color: green">${successMessage}</p>
					</c:if>

                    <button type="submit" class="btn btn-danger">삭제</button>
                    <a href="<c:url value='/airport/insert'/>" class="btn btn-outline-primary">공항 등록</a>
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