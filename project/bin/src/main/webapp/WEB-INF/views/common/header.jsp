<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<style>
	span{height: 40px; line-height: 40px;}
</style>
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
			<img src="<c:url value='/resources/img/mainlogo2.png'/>" alt="logo" style="height:70px">
		</a>
		<ul class="navbar-nav">
			<c:if test="${user == null}">
				<li class="nav-item">
					<a class="nav-link " href="<c:url value='/member/signup'/>">회원가입</a>
				</li>
				<span>|</span>
				<li class="nav-item">
					<a class="nav-link " href="<c:url value='/member/login'/>">로그인</a>
				</li>
				<span>|</span>
			</c:if>
			<c:if test="${user != null}">
				<li class="nav-item">
					<a class="nav-link " href="<c:url value='/member/logout'/>">로그아웃</a>
				</li>
				<span>|</span>
				<li class="nav-item">
					<a class="nav-link" href="<c:url value='/member/check'/>">회원정보 관리</a>
				</li>
				<span>|</span>
			</c:if>
			<li class="nav-item">
				<a class="nav-link" href="<c:url value='#'/>">예매</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="<c:url value='#'/>">예매내역 조회</a>
			</li>
			<c:if test="${user != null && user.me_authority == 'ADMIN'}">
				<span>|</span>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="<c:url value='/menu/admin'/>" id="navbardrop" data-toggle="dropdown">
					관리자
					</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="<c:url value='/menu/admin'/>">회원 권한</a>
						<a class="dropdown-item" href="<c:url value='/menu/airport'/>">항공사/비행기</a>
						<a class="dropdown-item" href="<c:url value='/menu/route'/>">공항/노선</a>
						<a class="dropdown-item" href="<c:url value='/menu/schedule'/>">스케줄</a>
					</div>
				</li>
			</c:if>
		</ul>
	</nav>
</body>