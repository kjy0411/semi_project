<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<title>스프링</title>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<!-- Brand/logo -->
	<a class="navbar-brand" href="<c:url value='/' />">
		<img src="<c:url value='/resources/img/logo.jpg'/>" alt="logo" style="height: 40px">
	</a>
	
	<c:if test="${user == null}">
		<a href="<c:url value='/member/signup'/>">회원가입</a>
		<a href="<c:url value='/member/login'/>">로그인</a>
	</c:if>
	<c:if test="${user != null}">
		<a href="<c:url value='/member/logout'/>">로그아웃</a>
	</c:if>
	<a href="<c:url value='/menu/admin'/>">관리자</a>
	<a href="<c:url value='/menu/user'/>">사용자</a>
</nav>