<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
		<form action="<c:url value='/airline/insert'/>" method="post">
		<h1>항공사 등록</h1>
			<div class="form-group">
				<input type="text" class="form-control" name="al_name" placeholder="항공사명 입력" >
			</div>
		<button class="btn btn-outline-success col-12">등록하기</button>
	</form>
</body>
</html>