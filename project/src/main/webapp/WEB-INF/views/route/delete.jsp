<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>노선 삭제</title>
    <style>
        .container {
            display: flex;
            justify-content: space-between;
        }
        .left {
            flex: 1;
        }
        .right {
            flex: 1;
            margin-left: 20px;
        }
        
        h1 {
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <h1>노선 삭제</h1>
    
    <div class="container">
        <!-- 왼쪽 컨테이너에 노선 리스트 표시 -->
        <div class="left">
            <h2>노선 리스트</h2>
            <ul>
                <c:forEach items="${routeList}" var="route">
                    <li>${route.ro_num} - ${route.ro_ai_start} - ${route.ro_ai_end}</li>
                </c:forEach>
            </ul>
        </div>
        
        <!-- 오른쪽 컨테이너에 삭제 폼 표시 -->
        <div class="right">
            <form id="deleteRouteByNumber" action="/project/route/delete" method="post">
                <label for="ro_num">노선 번호:</label>
                <input type="text" id="ro_num" name="ro_num" required><br><br>
                
                <!-- 인식할 수 없는 노선 번호 표시 -->
				<c:if test="${not empty notFoundMessage}">
				    <p style="color: red">${notFoundMessage}</p>
				</c:if>
				
				<!-- URL에 'success' 파라미터가 있는 경우 성공 메시지를 표시 -->
				<c:if test="${param.success == 'true'}">
				    <p style="color: green">노선이 성공적으로 삭제되었습니다.</p>
				</c:if>
                
                <button type="submit">노선 삭제</button>
            </form>
        </div>
    </div>
    <a href="<c:url value='/route/insert'/>">노선 등록</a>
</body>
</html>
