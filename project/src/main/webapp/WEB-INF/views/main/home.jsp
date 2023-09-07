<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>메인화면</h1>
<span style="color: red; font-size: 20px;">작업하기전 DDL과 샘플데이터를 작동시켜 DB를 초기화해주세요 변경사항이 있을 수 있습니다.</span> <br>
<span style="color: red; font-size: 20px;">관리자 계정은 ID : admin, PW : admin 입니다.</span> <br>
<span style="color: red; font-size: 20px;">사용자 계정은 ID : user,  PW : user  입니다.</span> <br>
<c:if test="${user == null}">
<a href="<c:url value='/member/signup'/>">회원가입</a>
<a href="<c:url value='/member/login'/>">로그인</a>
</c:if>
<c:if test="${user != null}">
<a href="<c:url value='/member/logout'/>">로그아웃</a>
</c:if>
<a href="<c:url value='/menu/admin'/>">관리자</a>
<a href="<c:url value='/menu/user'/>">사용자</a>


</body>
</html>
