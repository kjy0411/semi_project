<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>스케줄을 등록 해주세요.</h1>
	<form action="<c:url value='/schedule/insert'/>" method="get">
		<div class="form-group">
			<label>스케줄 번호</label>
			<input type="text" class="form-control" name="sk_num">
		</div>
		<div class="form-group">
			<label>비행기 번호</label>
			<input type="text" class="form-control" name="sk_ap_num">
		</div>
		<div class="form-group">
			<label>노선 번호</label>
			<input type="text" class="form-control" name="sk_ro_num">
		</div>
		<div class="form-group">
			<label>출발시간</label>
			<input type="datetime-local" class="form-control" name="sk_start_time">
		</div>
		<div class="form-group">
			<label>도착시간</label>
			<input type="datetime-local" class="form-control" name="sk_end_time">
		</div>
		<div class="form-group">
			<label>비행시간</label>
			<input type="time" class="form-control" name="sk_time">
		</div>
		<div class="form-group">
			<label>기본비용</label>
			<input type="text" class="form-control" name="sk_price">
		</div>
		<button class="btn btn-outline-warning col-12">스케줄 등록</button>
	</form>
</body>
</html>