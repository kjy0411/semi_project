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

	<form action="<c:url value='/airline/insert_ap'/>" method="post">
		<h1>항공기 등록</h1>
			<div class="form-group">
				<input type="text" class="form-control" name="ap_num" placeholder="항공기번호 입력" >
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="al_al_name" placeholder="항공기명 입력" >
			</div>
			<div class="form-group">
				<input type="text" class="form-control" name="ap_am_model" placeholder="항공기명 모델 입력" >
			</div>
		<button class="btn btn-outline-success col-12">등록하기</button>
	</form>

</body>
</html>