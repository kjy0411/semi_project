<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>메인화면</h1>
<a href="#">회원가입</a>
<a href="#">로그인</a>
<form action="<c:url value='/menu'/>" method="get">
	<input type="text" name="authority">
	<button class="btn-submit">로그인</button>
</form>

</body>
</html>
