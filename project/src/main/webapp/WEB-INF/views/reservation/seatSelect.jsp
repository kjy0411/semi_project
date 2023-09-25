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
	.payment-container::after{clear: both; content: ''; display: block;}
	.payment-input{width: 100%; float: right; text-align: right}
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
				<c:forEach begin="1" end="${search.seatAmount}">
					<div class="go-seat-box">
						<input type="text" class="go-seat-name seat-name" readonly>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${search.ticketType == 2}">
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
				<c:forEach begin="1" end="${search.seatAmount}">
					<div class="back-seat-box">
						<input type="text" class="back-seat-name seat-name" readonly>
					</div>
				</c:forEach>
			</c:if>
			<hr>
			<a data-toggle="tooltip" title="좌석을 모두 선택해주세요.">
				<button class="btn btn-outline-success btn-select-complete" disabled>선택완료</button>
			</a>
			<button class="btn btn-outline-danger btn-select-cancel">취소</button>
			<hr>
			<div class="payment-container" style="width: 100%; border: 1px solid black;">
				<table style="width: 100%">
					<tbody>
						<c:if test="${schedule!= null}">
							<tr>
								<th>퍼스트</th>
								<td><div class="payment-input"><span class="first-count-go">0</span>석</div></td>
							</tr>
							<tr>
								<th>비지니스</th>
								<td><div class="payment-input"><span class="business-count-go">0</span>석</div></td>
							</tr>
							<tr>
								<th>이코노미</th>
								<td><div class="payment-input"><span class="economy-count-go">0</span>석</div></td>
							</tr>
							<tr style="border-top: 1px solid black;">
								<th>가는편 금액</th>
								<td><div class="payment-input"><span class="ti_total_price-go">0</span>원</div></td>
							</tr>
						</c:if>
						<c:if test="${search.ticketType == 2}">
							<tr style="border-top: 1px solid black">
								<th>퍼스트</th>
								<td><div class="payment-input"><span class="first-count-back">0</span>석</div></td>
							</tr>
							<tr>
								<th>비지니스</th>
								<td><div class="payment-input"><span class="business-count-back">0</span>석</div></td>
							</tr>
							<tr>
								<th>이코노미</th>
								<td><div class="payment-input"><span class="economy-count-back">0</span>석</div></td>
							</tr>
							<tr style="border-top: 1px solid black; width: 100%;">
								<th>오는편 금액</th>
								<td><div class="payment-input"><span class="ti_total_price-back">0</span>원</div></td>
							</tr>
						</c:if>
					</tbody>
					<tfoot class="total-price-box">
						<tr style="border-top: 1px solid black">
							<th>총 금액</th>
							<td><div class="payment-input"><span class="ti_total_price">0</span>원</div></td>
						</tr>
						<tr>
							<th>보유 마일리지</th>
							<td><div class="payment-input"><span class="have_point">${point.po_hold_point}</span>Point</div></td>
						</tr>
						<tr>
							<th>사용 마일리지</th>
							<td>
								<a data-toggle="tooltip" title="최대 ${point.po_hold_point}Point 사용가능">
									<input type="number" class="ti_use_point payment-input" value="0" min="0" max="${point.po_hold_point}">
								</a>
							</td>
						</tr>
						<tr style="border-top: 1px solid black">
							<th>결제금액</th>
							<td><div class="payment-input"><span class="ti_price">0</span>원</div></td>
						</tr>
					</tfoot>
				</table>
				<button style="float: right" class="btn btn-outline-success btn-payment-complete">결제</button>
			</div>
			<div>
				<c:forEach begin="1" end="${search.seatAmount}">
					<div class="go-seat-box">
						<input type="text" class="go-seat-num seat-num" name="tl_se_num" readonly>
					</div>
				</c:forEach>
				<c:if test="${search.ticketType == 2}">
					<c:forEach begin="1" end="${search.seatAmount}">
						<div class="back-seat-box">
							<input type="text" class="back-seat-num seat-num" name="tl_se_num">
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
		<div class="seat-container" style="flex: 2; padding-left: 5px;">
		</div>
	</div>
	<script type="text/javascript">
		const seatCount = ${search.seatAmount};
		let reservationCount = null;
		let num;	//1가는편 2오는편
		let nameArr = [];
		let numArr = [];
		let ratio;
		let fgo = 0;
		let bgo = 0;
		let ego = 0;
		let priceGo = 0;
		let fback = 0;
		let bback = 0;
		let eback = 0;
		let priceBack = 0;
		$('.total-price-box').hide();
		$('.btn-payment-complete').hide();
		
		$('.schedule-container').hover(function() {
			$(this).css("background-color", "yellow");
		},function(){
			$(this).css("background-color", "white");
		});
		
		$('.schedule-container').click(function() {
			nameArr = []
			numArr= []
			reservationCount = ${search.seatAmount}
			$(this).css("border-width", "5px");
			$(this).siblings('.schedule-container').css("border-width", "2px")
			$('.container').css("min-height", "1500px")
			
			num = $(this).children('.num').val();
			let sk_num = $(this).children('.sk_num').val();
			reset(num)
			print(num, seatCount)
			printSeat(num, sk_num);
			buttonActivation();
		});
		$(document).on('click', '.seat-select', function() {
			if(reservationCount > 0){
				$(this).removeClass('seat-select');
				$(this).addClass('seat-select-check');
				$(this).css('background', 'black');
				$(this).css('color', 'white');
				reservationCount--;
				
				ratio = $(this).children('.sc_ratio').val();
				price(num, ratio, 1);
				
				nameArr.push($(this).children('.se_name').val());
				numArr.push($(this).children('.se_num').val());
				
				print(num, seatCount);
				buttonActivation();
			}else{
				alert('좌석을 모두 선택했습니다.')
			}
		})
		$(document).on('click', '.seat-select-check', function() {
			$(this).removeClass('seat-select-check');
			$(this).addClass('seat-select');
			let ratio = $(this).children('.sc_ratio').val();
			if(ratio == 4){
				$(this).css('background', 'yellow')
			}else if(ratio == 2){
				$(this).css('background', 'aqua')
			}else if(ratio == 1){
				$(this).css('background', 'yellowgreen')
			}
			$(this).css('color', 'black')
			reservationCount++;
			
			ratio = $(this).children('.sc_ratio').val();
			price(num, ratio, 2);
			
			nameArr.splice(nameArr.indexOf($(this).children('.se_name').val()),1);
			numArr.splice(numArr.indexOf($(this).children('.se_num').val()),1);
			
			print(num, seatCount);
			buttonActivation();
		})
		$(document).on('click', '.btn-select-complete', function(){
			$('.seat-name').hide();
			$('.schedule-container').hide();
			$('.total-price-box').show();
			$('.btn-payment-complete').show();
			let totalPrice = Number($('.ti_total_price-go').text()) + Number($('.ti_total_price-back').text());
			let point = Number($('.ti_use_point').val());
			let realPrice = totalPrice - point;
			$('.ti_total_price').text(totalPrice);
			$('.ti_price').text(realPrice);
			$('.ti_use_point').val(0);
		});
		$(document).on('click', '.btn-select-cancel', function(){
			$('.seat-name').show();
			$('.schedule-container').show();
			$('.total-price-box').hide();
			$('.btn-payment-complete').hide();
		});
		$(document).on('change', '.ti_use_point', function() {
			let totalPrice = Number($('.ti_total_price').text());
			let point = Number($('.ti_use_point').val());
			let realPrice = totalPrice - point;
			$('.ti_price').text(realPrice);
		});
		$(document).on('click', '.btn-payment-complete', function(){
			payment();
		});
		function printSeat(num, sk_num) {
			let str = ``;
			$.ajax({
				async : false,
				method : 'post',
				url : '<c:url value="/reservation/seat/select"/>',
				data : {num:num, sk_num:sk_num},
				dataType : 'json',
				success : function(data) {
					str += `
						<h1>\${data.msg} : \${data.airplane.ap_am_model}</h1>
					`;
					for(i = 1; i <= data.airplane.am_row; i++){
						if(num == 1){
							str += `
								<div class="seat-select-box seat-select-go" style="border: 1px; width: 32px; height: 32px; float:left;
							`;
						}else if(num == 2){
							str += `
								<div class="seat-select-box seat-select-back" style="border: 1px; width: 32px; height: 32px; float:left;
							`;
						}
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
											line-height: 28px;">\${seat.se_name}
											<input readonly hidden class="sk_num" value="\${seat.sk_num}">
											<input readonly hidden class="se_num" value="\${seat.se_num}">
											<input readonly hidden class="se_name" value="\${seat.se_name}">
											<input readonly hidden class="sc_ratio" value="\${seat.sc_ratio}">
											</div>
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
		function print(num, seatCount){
			for(i = 0; i < seatCount; i++){
				if(num == 1){
					 $('.go-seat-name').eq(i).val(nameArr[i]);
					 $('.go-seat-num').eq(i).val(numArr[i]);
				}else if(num == 2){
					 $('.back-seat-name').eq(i).val(nameArr[i]);
					 $('.back-seat-num').eq(i).val(numArr[i]);
				}
			}
        }
		function buttonActivation(){
			let nullCount = 0;
			for(i = 0; i < seatCount*${search.ticketType}; i++){
				if($('.seat-num').eq(i).val() == ''){
					nullCount++
				}
			}
			if(nullCount == 0){
				$('.btn-select-complete').prop('disabled',false);
			}else{
				$('.btn-select-complete').prop('disabled',true);					
			}
		}
		function price(num, ratio, res) {//res 1 : insert, 2 : delete
			if(res == 1){
				if(num == 1){
					if(ratio == 4){
						fgo++;
					}else if(ratio == 2){
						bgo++;
					}else if(ratio == 1){
						ego++;
					}
				}else if(num == 2){
					if(ratio == 4){
						fback++;
					}else if(ratio == 2){
						bback++;
					}else if(ratio == 1){
						eback++;
					}
					
				}
			}else if(res == 2){
				if(num == 1){
					if(ratio == 4){
						fgo--;
					}else if(ratio == 2){
						bgo--;
					}else if(ratio == 1){
						ego--;
					}
				}else if(num == 2){
					if(ratio == 4){
						fback--;
					}else if(ratio == 2){
						bback--;
					}else if(ratio == 1){
						eback--;
					}
				}
			}
			priceGo = ${schedule.sk_price} * ((fgo * 4) + (bgo * 2) + (ego * 1));
			$('.first-count-go').text(fgo);
			$('.business-count-go').text(bgo);
			$('.economy-count-go').text(ego);
			$('.ti_total_price-go').text(priceGo);
			if(${search.ticketType} == 2){
				priceBack = ${schedule2.sk_price} * ((fback * 4) + (bback * 2) + (eback * 1));
				$('.first-count-back').text(fback);
				$('.business-count-back').text(bback);
				$('.economy-count-back').text(eback);
				$('.ti_total_price-back').text(priceBack);
			}
		}
		function reset(res) {
			if(res == 1){
				fgo = 0;
				bgo = 0;
				ego = 0;
				priceGo = 0;
				$('.first-count-go').text(0);
				$('.business-count-go').text(0);
				$('.economy-count-go').text(0);
				$('.ti_total_price-go').text(0);				
			}else if(res = 2){
				fback = 0;
				bback = 0;
				eback = 0;
				priceBack = 0;
				$('.first-count-back').text(0);
				$('.business-count-back').text(0);
				$('.economy-count-back').text(0);
				$('.ti_total_price-back').text(0);
			}
		}
		function payment(){
			let type = Number(${search.ticketType});
			let ti_sk_num = [];
			let ti_total_price = [];
			let ti_use_point = [];
			ti_sk_num.push(Number(${schedule.sk_num}));
			ti_total_price.push(Number($('.ti_total_price-go').text()));
			ti_use_point.push(Number($('.ti_use_point').val()));
			if(type == 2){
				ti_sk_num.push(Number(${schedule2.sk_num}));
				ti_total_price.push(Number($('.ti_total_price-back').text()));
				ti_use_point.push(0);
			}
			let ti_me_id = '${user.me_id}';
			let ti_amount = Number(${search.seatAmount});
			let se_num = [];
			for(i = 0; i < seatCount*${search.ticketType}; i++){
				se_num.push(Number($('.seat-num').eq(i).val()));
			}
			$.ajax({
				async : false,
				method : 'post',
				url : '<c:url value="/reservation/complete"/>',
				data : {type:type,
						ti_me_id:ti_me_id,
						ti_amount:ti_amount,
						ti_sk_num:ti_sk_num,
						ti_total_price:ti_total_price,
						ti_use_point:ti_use_point,
						se_num:se_num},
				dataType : 'json',
				success : function(data) {
					if(data.res){
						alert(data.msg);
						location.href='<c:url value="/"/>';
					}else{
						alert(data.msg);
						$('.seat-name').show();
						$('.schedule-container').show();
						$('.total-price-box').hide();
						$('.btn-payment-complete').hide();
						str = ``;
						$('.seat-container').html(str)
					}
				}
			});
		}
	</script>
</body>
</html>