<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<h1>회원정보 보기</h1>
	<div class="form-group">
		<label>아이디 :</label>
		<input type="text" class="form-control" name="me_id" value="${user.me_id}" readonly> <br>
	</div>
	<div class="form-group">
		<label>이름 :</label>
		<input type="text" class="form-control" name="me_name" value="${user.me_name}" readonly> <br>
	</div>
	<div class="form-group">
		<label>영어이름 :</label>
		<input type="text" class="form-control" name="me_eng_name" value="${user.me_eng_name}" readonly> <br>
	</div>
	<div class="form-group">
		<label>생년월일 :</label>
		<input type="date" class="form-control" name="me_birthday" value="${str}" readonly> <br>
		<span></span>
	</div>
	<div class="form-group">
		<label>전화번호 :</label>
		<input type="text" class="form-control" name="me_phone" value="${user.me_phone}" readonly> <br>
	</div>
	<div class="form-group">
		<label>이메일 :</label>
		<input type="email" class="form-control" name="me_email" value="${user.me_email}" readonly> <br>
		<span></span>
	</div>
	<button class="btn btn-outline-primary">뒤로</button>	
	<button class="btn btn-outline-warning btn-update">수정</button>
	
	<script type="text/javascript">
		$('.btn-update').click(function() {
			let pw = prompt("비밀번호를 입력하세요");
			location.href = '<c:url value="/member/update"/>';
		})
	</script>
</body>
</html>