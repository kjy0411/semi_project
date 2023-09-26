<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<c:url value='/airline/insert_con'/>" method="post">
	<div class="container">
	  <h>등록된 항공사에 항공기를 추가하시겠습니까?</h><br>
	  <a href="<c:url value='/airline/insert_ap'/>">
	  <button type="button" class="btn btn-primary btn-block">네.등록되어진 항공사입니다</button>
	  </a>
	  <a href="<c:url value='/airline/insert'/>">
	  <button type="button" class="btn btn-default btn-block">아니오. 새롭게 항공사를 등록하겠습니다</button>
	  </a>
	</div>
</form>
</body>
</html>