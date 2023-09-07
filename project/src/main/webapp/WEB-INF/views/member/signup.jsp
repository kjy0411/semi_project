<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
	.form-group{height: 50px; width: 500px}
	input{float: right; margin-right: 200px}
</style>
</head>
<body>
	<h1>회원가입</h1>
	<form action="<c:url value='/member/signup'/>" method="post">
		<div class="form-group" style="height: 50px; width: 500px">
			<label>아이디 :</label>
			<input type="text" class="form-control" name="me_id" placeholder="아이디"> <br>
			<span class="notice" style="color: red;">영문으로 시작, 영문, 숫자 조합으로 10~20자</span>
		</div>
		<div class="form-group" style="height: 50px">
			<label>비번 :</label>
			<input type="password" class="form-control" name="me_pw" placeholder="비밀번호"> <br>
			<span class="notice" style="color: red;">영문, 숫자, !@#$ 조합으로 12~25자</span>
		</div>
		<div class="form-group" style="height: 50px">
			<label>이름 :</label>
			<input type="text" class="form-control" name="me_name" placeholder="이름"> <br>
		</div>
		<div class="form-group" style="height: 50px">
			<label>영어이름 :</label>
			<input type="text" class="form-control" name="me_eng_name" placeholder="영어 이름"> <br>
		</div>
		<div class="form-group" style="height: 50px">
			<label>생년월일 :</label>
			<input type="time" class="form-control" name="me_birthday"> <br>
			<span></span>
		</div>
		<div class="form-group" style="height: 50px">
			<label>전화번호 :</label>
			<input type="text" class="form-control" name="me_phone" placeholder="전화번호"> <br>
			<span class="notice" style="color: red;">'-'를 포함해서 입력하세요</span>
		</div>
		<div class="form-group" style="height: 50px">
			<label>이메일 :</label>
			<input type="email" class="form-control" name="me_email" placeholder="이메일"> <br>
			<span></span>
		</div>
		<button class="btn btn-outline-warning col-12">회원가입</button>
	</form>
	<script type="text/javascript">
	$('.notice').hide();
	$('.form-group').focus(function(){
		$(this).children('.notice').toggle();
	});
	</script>
</body>
</html>