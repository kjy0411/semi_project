<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>삭제할 스케줄의 번호를 입력해 주세요.</h1>
	<form action="<c:url value='/schedule/delete'/>" method="post">
		<div class="form-group">
			<label>스케줄 번호</label>
			<input type="text" class="form-control" name="sk_num"><button class="btn btn-outline-warning col-12">스케줄 삭제</button>
		</div>
	</form>
</body>
</html>