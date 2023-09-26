<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<body>
	<div style="width: 100%; display: flex;">
		<div class="search-box container-fluid" style="flex: 2">
			<form action="<c:url value='/reservation/list'/>" method="get">
				<div class="search-box">
					<div class="start-airport form-group">
						<span class="col-1">출발지</span> <br>
						<input class="form-control" type="text" name="startAirport" readonly placeholder="출발지">
					</div>
					<div class="end-airport form-group">
						<span class="col-1">도착지</span> <br>
						<input class="form-control" type="text" name="endAriport" readonly placeholder="도착지">
					</div>
				</div>
				<input class="form-control" type="number" name="ro_num" readonly>
				<button class="btn btn-outline-primary">검색</button>
			</form>
				<input class="form-control" type="text" name="ro_ai_start" readonly>
				<input class="form-control" type="text" name="ro_ai_end" readonly>
		</div>
		<div class="popUp-box container-fluid" style="flex: 3; padding: 10px; overflow: scroll; height: 750px">
		</div>
	</div>
	${endAirportList}
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
			
			let ro_ai_start = $('.ro_ai_start').val();
			let ro_ai_end = $('.ro_ai_end').val();
			
			findRo_num(ro_ai_start, ro_ai_end)
		})
		function findRo_num(ro_ai_start, ro_ai_end) {
			$.ajax({
				async : false,
				method : 'post',
				url : '<c:url value="/reservation/search/"/>',
				data : {ro_ai_start:ro_ai_start, ro_ai_end:ro_ai_end},
				dataType : 'json',
				success : function(data) {
		}
				
				
				
				
				
				$('.route-num').click(function() {
					let route = true;
					let ro_num ="";
					printRoute(route,ro_num);
				})
						$(document).on('click', '.select-route-num', function(){
						let value = $(this).text();
						let num = $(this).prev().text();
						$('[name=royte]').val(value);
						$('[name=ro_num]').val(num);
						$('.popUp-box').empty();
					})
				
				
					function printRoute(route, ro_num) {
						str = ``;
						$.ajax({
							async : false,
							method : 'post',
							url : '<c:url value="/schedule/insert/"/>',
							data : {route:route, ro_num:ro_num},
							dataType : 'json',
							success : function(data) {
								console.log(data)
								if(data.res){			
									for(air of data.routeList){						
										str += `
											<span class="ro_num" hidden="">\${air.ro_num}</span>
											-<a class="select-route-num" href="#">\${air.ro_num}</a> <br>
										`;												
									}											
								}else {
									alert(data.msg);
								}
							$('.popUp-box').html(str);
							}
						});
					}		
				
				
				
				
				
				
				
	</script>
</body>
</html>