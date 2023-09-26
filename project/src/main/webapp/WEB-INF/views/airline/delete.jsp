<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
</head>
<body>
	<h1 style="font-size:25px;">항공사 삭제</h1>
	
	 <form action="<c:url value='/airline/delete'/>" method="post">
        <div class="form-group">
	            <select class="form-control" name="al_name" id="al_name">
	                <c:forEach items="${list}" var="airline">
	                    <option value="${airline.al_name }">
	                        ${airline.al_name }
	                    </option>
	                </c:forEach>
	            </select>
        </div>
        <button class="btn btn-outline-success col-12">삭제하기</button>
    </form>
</body>
</html>