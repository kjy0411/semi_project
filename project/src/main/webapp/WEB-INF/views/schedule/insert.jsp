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
			<form action="<c:url value='/schedule/input'/>" method="post">
				<div class="search-box">
					<h5>비행기 코드 선택</h5>
					<div class="airline-box" style="width: 100%;display: flex;">
						<select class="form-control" name="ai_name" style="flex: 1; text-align: right;">
							<option class="select-option">항공사 선택</option>
							<c:forEach items="${alList}" var="al">
								<option value="${al.al_name}">
									${al.al_name}
								</option>
							</c:forEach>
						</select>
						<div class="airplane-box" style="flex: 1;">
							<select class="form-control" name="sk_ap_num" style="text-align: right;">
								<option>항공사를 선택하세요</option>
							</select>
						</div>
					</div> <br>
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
						<input class="form-control" type="datetime-local" name="sk_start_time_str">
					</div>
					<div class="time form-group" style="height: 78px">
						<span class="col-1">비행시간</span> <br>
						<div style="display: flex;">
							<select class="form-control" type="text" name="sk_time_hour" style="flex: 1; text-align: right;">
								<c:forEach begin="0" end="24" var="h">
									<option value="${h}">${h}시간</option>
								</c:forEach>
							</select>
							<select class="form-control" type="text" name="sk_time_minute" style="flex: 1; text-align: right;">
								<c:forEach begin="0" end="11" var="m">
									<option value="${m*5}">${m*5}분</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="seat-amount form-group">
						<span class="col-1">기본비용</span> <br>
						<input class="form-control" type="number" name="sk_price">
					</div>
				</div>
				<input class="form-control" type="text" name="ro_ai_start" readonly hidden>
				<input class="form-control" type="text" name="ro_ai_end" readonly hidden>
				<button class="btn btn-outline-primary">등록</button>
			</form>
		</div>
		<div class="popUp-box container-fluid" style="flex: 3; padding: 10px; overflow: scroll; height: 750px">
		</div>
	</div>
	<script type="text/javascript">
		let str = ``;
		let today = new Date().toISOString().substring(0, 10); //2023-09-13
		
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
		$('[name=ai_name]').change(function() {
			$('.select-option').prop('disabled', true);
			let str = ``;
			let al_name = $(this).val();
			
			$.ajax({
				async : false,
				method : 'post',
				url : '<c:url value="/schedule/insert"/>',
				data : JSON.stringify(al_name),
				contentType : 'application/json; charset=utf-8',
				dataType : 'json',
				success : function(data){
					if(data.res){
						str += `
							<select class="form-control" name="sk_ap_num" style="flex: 1; text-align: right;">
						`;
						for(ap of data.apList)
							str += `
								<option value="\${ap.ap_num}">
									\${ap.ap_num}
								</option>
							`;
						str += `
							</select>
						`;
					}else{
						str = `항공사에 등록된 비행기가 없습니다.`;
					}
					$('.airplane-box').html(str);
				}
			});
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
	</script>
</body>
</html>