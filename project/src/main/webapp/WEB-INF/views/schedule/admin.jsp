<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<title>스케줄 관리</title>
</head>
<body>
	<form action="<c:url value='/schedule/insert'/>" method="post">
		<button class="btn btn-outline-warning col-30">스케줄 등록</button>
	</form>
	<form action="<c:url value='/schedule/delete'/>" method="post">
		<button class="btn btn-outline-warning col-30">스케줄 삭제</button>
	</form>
	<form action="<c:url value='/schedule/list'/>" method="post">
		<button class="btn btn-outline-warning col-30">스케줄 조회</button>
	</form>
</body>
</html>