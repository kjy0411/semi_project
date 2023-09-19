<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>스케쥴검색리스트</title>
</head>
<body>
	<nav class="table-container">
		<div class="table-list">
		</div>
		<div class="select-go">
		</div>
		<div class="select-back">
		</div>
		<form action="<c:url value='/reservation/seat/select'/>" method="get">
			<c:if test="${search.ticketType == 1}">
				<input type="number" class="go_sk_num" name="sk_num" readonly hidden>
				<a data-toggle="tooltip" title="가는편 항공편을 선택해주세요.">
					<button class="btn btn-outline-success btn-select" disabled style="float: right; display: block;margin-right: 15px;">선택완료</button>
				</a>
			</c:if>
			<c:if test="${search.ticketType == 2}">
				<input type="number" class="go_sk_num" name="sk_num" readonly hidden>
				<input type="number" class="back_sk_num" name="sk_num" readonly hidden>
				<a data-toggle="tooltip" title="가는편과 오는편 항공편을 선택해주세요.">
					<button class="btn btn-outline-success btn-select" disabled style="float: right; display: block;margin-right: 15px;">선택완료</button>
				</a>
			</c:if>
		</form>
	</nav>
	<script type="text/javascript">
		
		let res = true;
		printSchedule(res);
		
		
		$(document).on('click', '.sk_num', function(){
			if(confirm("선택하시겠습니까?")){
				alert("선택되었습니다.");
				$(this).siblings().css('border','1px solid black');
				$(this).css('border','3px solid black');
				let sk_num = $(this).data('num');
				if(!res && ${search.ticketType} == 2){
					selectSchedule(sk_num, res);
					$('.back_sk_num').val(sk_num);
				}else{
					selectSchedule(sk_num, res);
					$('.go_sk_num').val(sk_num);
				}
				if(${search.ticketType} == 1){
					if($('.go_sk_num').val() != ''){
						$('.btn-select').prop('disabled', false);
					}
				}else{
					if($('.go_sk_num').val() != '' && $('.back_sk_num').val() != ''){
						$('.btn-select').prop('disabled', false);
					}
				}
			}else{
				alert("취소되었습니다.");
			}
		});
		$(document).on('click','.btn-prev', function() {
			res = true;
			printSchedule(res)
			$('.go_sk_num').val('')
			str = '';
			$('.select-go').html(str);
			if($('.go_sk_num').val() == ''){
				$('.btn-select').prop('disabled', true);
			}
		});
		$(document).on('click','.btn-next', function() {
			res = false;
			printSchedule(res)
			$('.back_sk_num').val('')
			str = '';
			$('.select-back').html(str);
			if(${search.ticketType} == 2){
				if($('.go_sk_num').val() != '' || $('.back_sk_num').val() != ''){
					$('.btn-select').prop('disabled', true);
				}
			}
		});
		
		function printSchedule(res) {
			let str = ``;
			$.ajax({
				async : false,
				method : 'post',
				url : '<c:url value="/reservation/list"/>',
				data : JSON.stringify(res),
				contentType : "application/json; charset=UTF-8",
				dataType : 'json',
				success : function(data) {
					if(data.res){
						str += `
							<h1>가는편</h1>
						`;
						if(${search.ticketType} == 2){
							str += `<button class="btn btn-outline-primary btn-next" style="float: right; display: block;margin-right: 15px;">오는편</button>`;
						}
					}else{
						str += `
							<h1>오는편</h1> <button class="btn btn-outline-primary btn-prev" style="float: right; display: block;margin-right: 15px;">가는편</button>
						`;						
					}
					str += `
						<h2>\${data.msg}</h2>
						<div class="container">
						  <table class="table table-bordered" style="text-align: center;width: 100%;">
						    <thead style="background-color: grey;">
						     	<tr>
									<th>항공사</th>
									<th>출발시간</th>
									<th>도착시간</th>
									<th>비행시간</th>
									<th>비용(이코노미 1인)</th>
								</tr>
						    </thead>
						<tbody>
						`;
					for(sch of data.scheduleList){
						str += `
							<tr class="sk_num" data-num="\${sch.sk_num}">
								<td>\${sch.ap_al_name}</td>
								<td>\${sch.sk_start_time_str}</td>
								<td>\${sch.sk_end_time_str}</td>
								<td>\${sch.sk_time_str}</td>
								<td>\${sch.sk_price_str}(원)</td>
							</tr>
						`;
					}
					str += `
								</tbody>
							</table>
						</div>
					`;
				}
			});
			$('.table-list').html(str);
			$('.sk_num').hover(function(){
				$(this).css('background', 'yellow');
			}, function(){
				$(this).css('background', 'white');
			});
		}
		function selectSchedule(sk_num, res){
			str = ``;
			$.ajax({
				async : false,
				method : 'post',
				url : '<c:url value="/reservation/select"/>',
				data : JSON.stringify(sk_num),
				contentType : "application/json; charset=UTF-8",
				dataType : 'json',
				success : function(data) {
					if(data.res){
						if(res){
							str += `
								<h4>가는편</h4>
							`;
						}else{
							str += `
								<h4>오는편</h4>
							`;
						}
						str += `
							<table class="table table-bordered" style="text-align: center;">
						`;
								if(res){
									str += `<thead style="background-color: cyan;">`;
								}else{
									str += `<thead style="background-color: hotpink;">`;
								}
						str += `
							     	<tr>
										<th>항공사</th>
										<th>출발시간</th>
										<th>도착시간</th>
										<th>비행시간</th>
										<th>비용(이코노미 1인)</th>
									</tr>
							    </thead>
							    <tbody>
							     	<tr>
										<td>\${data.schedule.ap_al_name}</td>
										<td>\${data.schedule.sk_start_time_str}</td>
										<td>\${data.schedule.sk_end_time_str}</td>
										<td>\${data.schedule.sk_time_str}</td>
										<td>\${data.schedule.sk_price_str}</td>
									</tr>
							    </tbody>
						    </table>
						`;
					}else{
						str = `
							<h6>선택된 항공편이 없습니다.</h6>
						`;
					}
					if(res){
						$('.select-go').html(str);					
					}else{
						$('.select-back').html(str);					
					}
				}
				
			});
		}
	</script>
</body>
</html>