<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>삭제할 스케줄의 번호를 입력해 주세요.</h1>
	<form action="<c:url value='/delete'/>" method="get">
		<div class="form-group">
			<label>스케줄 번호</label>
			<input type="text" class="form-control" name="sk_num">
		</div>
	</form>
</body>
</html>