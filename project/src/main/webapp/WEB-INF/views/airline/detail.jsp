<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>항공 상세정보</h1>
					<c:forEach items="${list}" var="airplane">
					<td>
					<a>${airplane.ap_al_name }</a>
					<a>${airplane.ap_am_name }</a>
					</td> <br>
					</c:forEach>
</body>
</html>