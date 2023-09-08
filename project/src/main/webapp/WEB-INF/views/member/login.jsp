<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<h1>로그인</h1>
	<form action="<c:url value='/member/login'/>" method="post">
		<div class="form-group">
			<label>아이디 :</label>
			<input type="text" class="form-control" name="me_id" placeholder="아이디"> <br>
		</div>
		<div class="form-group">
			<label>비번 :</label>
			<input type="password" class="form-control" name="me_pw" placeholder="비밀번호"> <br>
		</div>
		<button class="btn btn-outline-warning col-12">로그인</button>
	</form>
</body>
</html>