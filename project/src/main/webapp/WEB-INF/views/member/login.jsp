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
	</form>
	<script type="text/javascript">
	</script>
</body>
</html>