<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>좌석선택</title>
<style type="text/css">
	.seat-container::after{clear: both; content: ''; display: block;}
</style>
</head>
<body>
	<h1>좌석선택</h1>
	<div style="width: 100%; display: flex;">
		<div class="container-fluid" style="flex: 1;">
			<c:if test="${schedule!= null}">
				<div class="schedule-container schedule-go" style="border: 2px solid black; text-align: center; margin-bottom: 10px;">
					<input class="sk_num" type="number" value="${schedule.sk_num}" hidden readonly>
					<input class="num" type="number" value="1" hidden readonly>
					<h2 style="display: block;">가는편</h2>
					<div style="display: flex; width: 100%">
						<h6 style="flex: 3">${schedule.ai_start_name}</h6>
						<h1 style="flex: 1">></h1>
						<h6 style="flex: 3">${schedule.ai_end_name}</h6>
					</div>
				</div>
			</c:if>
			<c:forEach begin="1" end="${search.seatAmount}">
				<span></span> <br>
			</c:forEach>
			<c:if test="${schedule2!= null}">
				<div class="schedule-container schedule-back" style="border: 2px solid black; text-align: center; margin-bottom: 10px;">
					<input class="sk_num" type="number" value="${schedule2.sk_num}" hidden readonly>
					<input class="num" type="number" value="2" hidden readonly>
					<h2 style="display: block;">오는편</h2>
					<div style="display: flex; width: 100%">
						<h6 style="flex: 3">${schedule2.ai_start_name}</h6>
						<h1 style="flex: 1">></h1>
						<h6 style="flex: 3">${schedule2.ai_end_name}</h6>
					</div>
				</div>
			</c:if>
		</div>
		<div class="seat-container" style="flex: 2; padding-left: 5px;">
		</div>
	</div>
	<script type="text/javascript">
		$('.schedule-container').hover(function() {
			$(this).css("background-color", "yellow");
		},function(){
			$(this).css("background-color", "white");
		});
		
		$('.schedule-container').click(function() {
			$(this).css("border-width", "5px");
			$(this).siblings('.schedule-container').css("border-width", "2px")
			$('.container').css("min-height", "1500px")
			
			let num = $(this).children('.num').val();
			let sk_num = $(this).children('.sk_num').val();
			
			printSeat(num, sk_num);
		});
		$(document).on('click', '.seat-select', function() {
			alert($(this).text());
			alert($(this).children('.se_sc_name').val());
		})
		
		function printSeat(num, sk_num) {
			let str = ``;
			$.ajax({
				async : false,
				method : 'post',
				url : '<c:url value="/reservation/seat/select"/>',
				data : {num:num, sk_num:sk_num},
				dataType : 'json',
				success : function(data) {
					console.log(data)
					str += `
						<h1>\${data.msg} : \${data.airplane.ap_am_model}</h1>
					`;
					for(i = 1; i <= data.airplane.am_row; i++){
						str += `
							<div class="seat-select-box" style="border: 1px; width: 32px; height: 32px; float:left;
						`;
						if(data.pathList[0] == i || data.pathList[1] == i){
							str += `margin-right: 30px;">`;
						}else{
							str += `margin-right: 10px;">`;
						}
						for(j = 1; j <= data.airplane.am_col; j++){
							let count = 0;
							for(seat of data.seatList){
								if(seat.row == i && seat.col == j){
									if(seat.tl_num != null){
										str += `<div class="seat-select-complet" style="background: gray;`;
									}else if(seat.se_sc_name == "퍼스트"){
										str += `<div class="seat-select" style="background: yellow;`;
									}else if(seat.se_sc_name == "비지니스"){
										str += `<div class="seat-select" style="background: aqua;`;
									}else if(seat.se_sc_name == "이코노미"){
										str += `<div class="seat-select" style="background: yellowgreen;`;
									}
									str += `border: 1px solid black;
											width: 30px;
											height: 30px;
											float:left;
											margin-top: 5px;
											font-size: 12px;
											text-align: center;
											line-height: 28px;">\${seat.se_name}<input readonly hidden class="se_sc_name" value="\${seat.se_sc_name}"></div>
									`;
								}else{
									count++;
								}
							}
							if(count == data.seatList.length){
								str += `
									<div style="border: 1px; width: 30px; height: 30px; float:left; margin-top: 5px;"></div>
								`;
							}
						}
						str += `</div>`;
					}
				}
			});
			$('.seat-container').html(str);
			$('.seat-select').hover(function() {
				$(this).css("border-color", "yellow")
			},function(){
				$(this).css("border-color", "black")
			});
		}
	</script>
</body>
</html>