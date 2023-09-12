<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>항공편 검색</title>
</head>
<body>
	<%
    request.setAttribute("minDate", "2023-09-12");
    %>
	<div style="width: 100%; display: flex;">
		<div class="search-box container-fluid" style="flex: 2">
		<div class="search-box">
			<div class="start-airport form-group">
				<span class="col-1">출발지</span> <br>
				<input class="form-control" type="text" name="startAirport" readonly>
			</div>
			<div class="end-airport form-group">
				<span class="col-1">도착지</span> <br>
				<input class="form-control" type="text" name="endAriport" readonly>
			</div>
			<div class="start-time form-group">
				<span class="col-1">출발시간</span> <br>
				<input class="form-control" type="text" name="" readonly>
			</div>
			<div class="end-time form-group">
				<span class="col-1">도착시간</span> <br>
				<input class="form-control" type="text" name="" readonly>
			</div>
			<div class="seat-amount form-group">
				<span class="col-1">예매좌석수</span> <br>
				<input class="form-control" type="text" name="" readonly>
			</div>
		</div>
		<form action="/reservation/list" method="get">
			<input class="form-control" type="text" name="ro_ai_start" readonly>
			<input class="form-control" type="text" name="ro_ai_end" readonly>
			<input class="form-control" type="text" name="" readonly>
			<input class="form-control" type="text" name="" readonly>
			<input class="form-control" type="text" name="" readonly>
		</form>
		</div>
		<div class="popUp-box container-fluid" style="flex: 3; padding: 10px">
		</div>
	</div>
	<script type="text/javascript">
		$('.start-airport').click(function() {
			let str = `
				<c:forEach items="${divisionList}" var="division">
				<h4>${division}</h4>
				<c:forEach items="${nationList}" var="nation">
					<c:if test="${nation.na_division == division}">
						<h6">${nation.na_name}</h6> <br>
						<c:forEach items="${airportList}" var="airport">
							<c:if test="${airport.ai_na_name == nation.na_name}">
								<span class="ai_num" hidden="">${airport.ai_num}</span>
								<a class="select-start-airport" href="#">${airport.ai_name}</a> <br>
							</c:if>
						</c:forEach>
					</c:if>
				</c:forEach>
			</c:forEach>
				`;
			$('.popUp-box').html(str);
			
		})
		$('.end-airport').click(function() {
			let str = `
				<c:forEach items="${divisionList}" var="division">
				<h4>${division}</h4>
				<c:forEach items="${nationList}" var="nation">
					<c:if test="${nation.na_division == division}">
						<h6">${nation.na_name}</h6> <br>
						<c:forEach items="${airportList}" var="airport">
							<c:if test="${airport.ai_na_name == nation.na_name}">
								<span class="ai_num" hidden="">${airport.ai_num}</span>
								<a class="select-end-airport" href="#">${airport.ai_name}</a> <br>
							</c:if>
						</c:forEach>
					</c:if>
				</c:forEach>
			</c:forEach>
			`;
			$('.popUp-box').html(str);
		})
		$('.start-time').click(function() {
			let str = `
				<div class="sear-amount">
				<input type="date" min="${minDate}">
			`;
			$('.popUp-box').html(str);
		})
		$('.end-time').click(function() {
			let str = `
				<input type="date" min="${minDate}">
			`;
			$('.popUp-box').html(str);
		})
		$('.seat-amount').click(function() {
			let str = `
				<input type="number" min="1">
			`;
			$('.popUp-box').html(str);
		})
		$(document).on('click', '.select-start-airport', function(){
			let value = $(this).text();
			let num = $(this).prev().text();
			$('[name=startAirport]').val(value);
			$('[name=ro_ai_start]').val(num);
			$('.popUp-box').children().remove();
		})
		$(document).on('click', '.select-end-airport', function(){
			let value = $(this).text();
			let num = $(this).prev().text();
			$('[name=endAriport]').val(value);
			$('[name=ro_ai_end]').val(num);
			$('.popUp-box').children().remove();
		})
	</script>
</body>
</html>