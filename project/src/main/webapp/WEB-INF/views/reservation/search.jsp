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
						<input class="form-control" type="date" name="startTime" min="">
					</div>
					<div class="end-time form-group" style="height: 78px">
						<span class="col-1">도착시간</span> <br>
						<input class="form-control" type="date" name="endTime" min="">
					</div>
					<div class="seat-amount form-group">
						<span class="col-1">예매좌석수</span> <br>
						<input class="form-control" type="number" min="1" name="seatAmount" value="1">
					</div>
				</div>
			
				<input class="form-control" type="text" name="ro_ai_start" readonly>
				<input class="form-control" type="text" name="ro_ai_end" readonly>
				<button class="btn btn-outline-primary">검색</button>
			</form>
		</div>
		<div class="popUp-box container-fluid" style="flex: 3; padding: 10px; overflow: scroll; height: 750px">
		</div>
	</div>
	${endAirportList}
	<script type="text/javascript">
		let today = new Date().toISOString().substring(0, 10); //2023-09-13
		$('[name=startTime]').val(today).prop('min', today);
		$('[name=endTime]').val(today).prop('min', today);
		
		$('.start-airport').click(function() {
			let str = `
				<c:forEach items="${divisionList}" var="division">
				<h4>${division}</h4>
				<c:forEach items="${nationList}" var="nation">
					<c:if test="${nation.na_division == division}">
						<h6>-${nation.na_name}</h6>
						<c:forEach items="${startAirportList}" var="airport">
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
			let str = ``;
			if($('[name=startAirport]').val() == ""){
				alert("출발지를 선택해주세요")
				str = ``;
			}else{
				str = `
					<c:forEach items="${divisionList}" var="division">
						<h4>${division}</h4>
						<c:forEach items="${nationList}" var="nation">
							<c:if test="${nation.na_division == division}">
								<h6>-${nation.na_name}</h6>
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
			}
			$('.popUp-box').html(str);
		})
		$(document).on('click', '.select-start-airport', function(){
			let value = $(this).text();
			let num = $(this).prev().text();
			$('[name=startAirport]').val(value);
			$('[name=ro_ai_start]').val(num);
			$('.popUp-box').empty();
			$.ajax({
				async : false,
				method : 'post',
				url : '<c:url value="/reservation/search/"/>',
				data : JSON.stringify(num),
				contentType : 'application/json; charset=utf-8',
				dataType : 'json',
				success : function(data) {
					if(data.res){
						alert("댓글 삭제 성공");
						getCommentList(cri);
					}else{
						alert("댓글 삭제 실패");
					}
				}
			});
		})
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
					<input class="form-control" type="date" value=\${today} name="endTime" min=\${today}>
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