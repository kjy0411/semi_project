<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>메인화면</h1>
<a href="<c:url value='/member/signup'/>">회원가입</a>
<a href="<c:url value='/member/login'/>">로그인</a>
<a href="<c:url value='/menu/admin'/>">관리자</a>
<a href="<c:url value='/menu/user'/>">사용자</a>


</body>
</html>
