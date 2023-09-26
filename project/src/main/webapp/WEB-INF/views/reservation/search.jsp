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
	<div style="width: 100%; display: flex;">
		<div class="search-box container-fluid" style="flex: 2">
			<form action="<c:url value='/reservation/list'/>" method="get">
				<div class="input-group-prepend">
				   <select class="from-control" name="ticketType">
				   	<option value="2">왕복</option>
				   	<option value="1">편도</option>
				   </select>
				</div>
				<div class="search-box">
					<div class="start-airport form-group">
						<span class="col-1">출발지</span> <br>
						<input class="form-control" type="text" name="startAirport" readonly placeholder="출발지">
					</div>
					<div class="end-airport form-group">
						<span class="col-1">도착지</span> <br>
						<input class="form-control" type="text" name="endAriport" readonly placeholder="도착지">
					</div>
					<div class="start-time form-group">
						<span class="col-1">출발시간</span> <br>
						<input class="form-control" type="date" name="startDay" min="">
					</div>
					<div class="end-time form-group" style="height: 78px">
						<span class="col-1">도착시간</span> <br>
						<input class="form-control" type="date" name="endDay" min="">
					</div>
					<div class="seat-amount form-group">
						<span class="col-1">예매좌석수</span> <br>
						<input class="form-control" type="number" min="1" name="seatAmount" value="1">
					</div>
				</div>
				<input class="form-control" type="text" name="ro_ai_start" readonly hidden>
				<input class="form-control" type="text" name="ro_ai_end" readonly hidden>
				<button class="btn btn-outline-primary">검색</button>
			</form>
		</div>
		<div class="popUp-box container-fluid" style="flex: 3; padding: 10px; overflow: scroll; height: 750px">
		</div>
	</div>
	<script type="text/javascript">
		let str = ``;
		let today = new Date().toISOString().substring(0, 10); //2023-09-13
		$('[name=startDay]').val(today).prop('min', today);
		$('[name=endDay]').val(today).prop('min', today);
		
		$('.start-airport').click(function() {
			let route = true;
			let ai_num = "";
			printAirport(route, ai_num);
		})
		$('.end-airport').click(function() {
			if($('[name=startAirport]').val() == ""){
				alert("출발지를 선택해주세요")
				str = ``;
				$('.popUp-box').html(str);
			}else{
				let route = false;
				let ai_num = $('[name=ro_ai_start]').val();
				printAirport(route, ai_num);
			}
		})
		$(document).on('click', '.select-start-airport', function(){
			let value = $(this).text();
			let num = $(this).prev().text();
			$('[name=startAirport]').val(value);
			$('[name=ro_ai_start]').val(num);
			$('.popUp-box').empty();
		})
		
		function printAirport(route, ai_num) {
			str = ``;
			$.ajax({
				async : false,
				method : 'post',
				url : '<c:url value="/reservation/search/"/>',
				data : {route:route, ai_num:ai_num},
				dataType : 'json',
				success : function(data) {
					if(data.res){
						for(div of data.divisionList){
							str += `
								<h4>\${div.di_name}</h4>
							`;
							for(nat of data.nationList){
								if(div.di_name == nat.na_di_name){
									str += `
										<h6>\${nat.na_name}</h6>
									`;
									for(air of data.airportList){
										if(nat.na_name == air.ai_na_name){
											if(route == true){
												str += `
													<span class="ai_num" hidden="">\${air.ai_num}</span>
													-<a class="select-start-airport" href="#">\${air.ai_name}</a> <br>
												`;
											}else{
												str += `
													<span class="ai_num" hidden="">\${air.ai_num}</span>
													-<a class="select-end-airport" href="#">\${air.ai_name}</a> <br>
												`;
											}
											
										}
									}
								}
							}
						}
					}else {
						alert(data.msg);
					}
				$('.popUp-box').html(str);
				}
			});
		}
		
		$(document).on('click', '.select-end-airport', function(){
			let value = $(this).text();
			let num = $(this).prev().text();
			$('[name=endAriport]').val(value);
			$('[name=ro_ai_end]').val(num);
			$('.popUp-box').empty();
		})
		
		$('[name=ticketType]').change(function() {
			let str = ``;
			if($(this).val() == 2){
				str = `
					<span class="col-1">도착시간</span> <br>
					<input class="form-control" type="date" value=\${today} name="endDay" min=\${today}>
				`;
				$('.end-time').html(str);
			}else if($(this).val() == 1){
				str = `
					
					`;
				$('.end-time').html(str);
			}
		})
	</script>
</body>
</html>