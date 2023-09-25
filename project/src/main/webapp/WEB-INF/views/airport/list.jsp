<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>공항 리스트</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
    <h1>공항 리스트</h1>
    <div class="row">
        <div class="col-md-8">
            <form class="form-inline" action="/project/airport/search" method="get">
                <label for="keyword" class="sr-only">공항 입력:</label>
                <input type="text" class="form-control mb-2 mr-sm-2" id="keyword" name="keyword" placeholder="공항 입력">
                <button type="submit" class="btn btn-outline-primary mb-2">찾기</button>
            </form>
            <table class="table table-bordered">
                <thead>
        <tr>
            <th>공항 IATA 코드</th>
            <th>공항 이름</th>
        </tr>
    </thead>
    <tbody>
        <c:if test="${empty airportList}">
            <tr>
                <td colspan="2">리스트에 없습니다.</td>
            </tr>
        </c:if>
        <c:forEach items="${airportList}" var="airport">
            <tr>
                <td>
                    <a href="<c:url value='/airport/detail/${airport.ai_num}'/>">
                        ${airport.ai_num}
                    </a>
                </td>
                <td>
                    <a href="<c:url value='/airport/detail/${airport.ai_num}'/>">
                        ${airport.ai_name}
                    </a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
            </table>
        </div>
        <div class="col-md-2 text-left">
        
            <a href="<c:url value='/airport/insert'/>" class="btn btn-outline-primary">공항 등록</a>
            <a href="<c:url value='/airport/delete'/>" class="btn btn-outline-warning">공항 삭제</a>
            <a href="<c:url value='/route/delete'/>" class="btn btn-outline-danger">노선 삭제</a>
            <a href="<c:url value='/route/insert'/>" class="btn btn-outline-danger">노선 등록</a>
        </div>
    </div>
</div>
    
    
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
