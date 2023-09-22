<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>항공사 삭제</h1>
	
	<form action="<c:url value='/airline/delete'/>" method="post">
			<div class="form-group">
				<input type="text" class="form-control" name="al_name" placeholder="항공사명 입력" >
			</div>
		<button class="btn btn-outline-success col-12">삭제하기</button>
</body>
</html>