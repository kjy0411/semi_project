<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>항공편 검색</title>
</head>
<body>
	<%
    request.setAttribute("minDate", "2023-09-12");
    request.setAttribute("maxDate", "2022-04-25");
    %>
	<div style="width: 100%; display: flex;">
		<div class="search-box container-fluid" style="flex: 2">
		<form action="/reservation/list" method="get">
			<div class="search-box">
				<div class="start-airport form-group">
					<span class="col-1">출발지</span> <br>
					<input class="form-control" type="text" name="ro_ai_start" readonly>
				</div>
				<div class="end-airport form-group">
					<span class="col-1">도착지</span> <br>
					<input class="form-control" type="text" name="ro_ai_end" readonly>
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
		</form>
		</div>
		<div class="popUp-box container-fluid" style="flex: 3; padding: 10px">
		</div>
	</div>
	
	<script type="text/javascript">
		$('.start-airport').click(function() {
			let str = `
				`;
			$('.popUp-box').html(str);
		})
		$('.end-airport').click(function() {
			let str = `
				<div class="sear-amount">
					<span class="col-1">도착시간</span> <br>
					<input type="text" name="" readonly>
				</div>`;
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
				<input type="date">
			`;
			$('.popUp-box').html(str);
		})
		$('.seat-amount').click(function() {
			let str = `
				<input type="number" min="1">
			`;
			$('.popUp-box').html(str);
		})
	</script>
</body>
</html>