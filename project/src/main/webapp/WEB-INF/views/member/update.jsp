<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<h1>회원정보 수정</h1>
	<form action="<c:url value='/member/update'/>" method="post">
		<div class="form-group">
			<label>아이디 :</label>
			<input type="text" class="form-control" name="me_id" value="${member.me_id}" readonly> <br>
		</div>
		<div class="form-group">
			<label>이름 :</label>
			<input type="text" class="form-control" name="me_name" value="${member.me_name}"> <br>
		</div>
		<div class="form-group">
			<label>영어이름 :</label>
			<input type="text" class="form-control" name="me_eng_name" value="${member.me_eng_name}"> <br>
		</div>
		<div class="form-group">
			<label>생년월일 :</label>
			<input type="date" class="form-control" name="me_birthday" value="${str}"> <br>
		</div>
		<div class="form-group">
			<label>전화번호 :</label>
			<input type="text" class="form-control" name="me_phone" value="${member.me_phone}"> <br>
		</div>
		<div class="form-group">
			<label>이메일 :</label>
			<input type="email" class="form-control" name="me_email" value="${member.me_email}"> <br>
		</div>
		<button class="btn btn-outline-warning col-12">수정하기</button>
	</form>
</body>
</html>