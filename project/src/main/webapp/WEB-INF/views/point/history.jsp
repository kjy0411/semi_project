<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.box{width: 50%; padding: 10px}
	input{float: right; width: 50%; text-align: right;}
	.popup-table tbody tr td{padding: 5px}
</style>
</head>
<body>
	<h1>회원등급/마일리지</h1>
	<div class="info-container container-fluid" style="width: 100%; display: flex;">
		<div class="member-point-box box form-group" style="flex: 3; border: 3px solid black;">
			<span>ID :</span>
			<input type="text" class="form-control input-outline-primary col-6" value="${point.po_me_id }" readonly> <br>
			<span>등급 :</span>
			<input type="text" class="form-control input-outline-primary col-6 input-class" value="${point.po_mc_name }" readonly> <br>
			<span>누적 마일리지 :</span>
			<input type="text" class="form-control input-outline-primary col-6" value="${point.po_accumulate_point }point" readonly> <br>
			<span>적립 마일리지 :</span>
			<input type="text" class="form-control input-outline-primary col-6" value="${point.po_hold_point }point" readonly> <br>
		</div>
		<div class="popup-box box" style="flex: 5;">
			<table class="popup-table" style="font-size: 10px;">
				<thead>
					<tr>
						<th>등급</th>
						<th>등급 조건</th>
						<th>등급 혜택</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>실버</td>
						<td>누적마일리지 50000 미만</td>
						<td>없음</td>
					</tr>
					<tr>
						<td>골드</td>
						<td>누적마일리지 50000 이상</td>
						<td>마일리지 적립시 5% 추가</td>
					</tr>
					<tr>
						<td>다이아몬드</td>
						<td>누적마일리지 100000 이상</td>
						<td>마일리지 적립시 10% 추가</td>
					</tr>
					<tr>
						<td>다이아몬드 플러스</td>
						<td>누적마일리지 500000 이상</td>
						<td>마일리지 적립시 15% 추가</td>
					</tr>
					<tr>
						<td>플래티넘</td>
						<td>누적마일리지 1000000 이상</td>
						<td>마일리지 적립시 20% 추가</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<hr>
	<h1>마일리지 내역</h1>
	<div class="container">
		<table class="table table-bordered">
			<thead>
				<tr style="text-align: center;">
					<th>번호</th>
					<th>내역</th>
					<th>예매번호</th>
					<th style="width: 90px">포인트</th>
					<th>누적 마일리지 포인트</th>
					<th>보유 마일리지 포인트</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${phList}" var="ph">
					<tr class="point-history">
						<td style="	text-align: center;">${ph.num}</td>
						<td style="	text-align: center;">${ph.ph_detail}</td>
						<td class="ti_num" style="	text-align: center;">${ph.ph_ti_num}</td>
						<c:if test="${ph.ph_detail == '사용'}">
							<td style="background: lightcoral; text-align: right;">${-ph.point}</td>
						</c:if>
						<c:if test="${ph.ph_detail == '적립'}">
							<td style="background: lightgreen; text-align: right;">+${ph.point}</td>
						</c:if>
						<td style="text-align: right;">${ph.po_accumulate_point}</td>
						<td style="text-align: right;">${ph.po_hold_point}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 댓글 페이지네이션 -->
		<ul class="pagination justify-content-center">
		<c:if test="${pm.prev}">
			<li class="page-item">
				<a class="page-link" href="<c:url value='/point/history${pm.cri.getUrl(pm.startPage-1)}'/>">이전</a>
			</li>
		</c:if>
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			<li class="page-item <c:if test='${pm.cri.page == i}'>active</c:if>">
				<a class="page-link" href="<c:url value='/point/history${pm.cri.getUrl(i)}'/>">${i}</a>
			</li>
		</c:forEach>
		<c:if test="${pm.next}">
			<li class="page-item">
				<a class="page-link" href="<c:url value='/point/history${pm.cri.getUrl(pm.endPage+1)}'/>">다음</a>
			</li>
		</c:if>
	</ul>
	</div>
	<script type="text/javascript">
		$('.popup-table').hide();
		$('.input-class').hover(function() {
			$('.popup-table').show();
		}, function() {
			$('.popup-table').hide();
		});
		$('.point-history').hover(function() {
			$(this).css('font-weight', 'bold')
		}, function() {
			$(this).css('font-weight', 'normal')
		})
		$('.point-history').click(function() {
			$(this).addClass('point-history-detail');
			$(this).removeClass('point-history');
			$(this).siblings().addClass('point-history');
			$(this).siblings().removeClass('point-history-detail');
			$(this).siblings('.ticketing').remove();
			
			let el = ``;
			
			let ti_num = $(this).children('.ti_num').text();
			
			$.ajax({
				async : false,
				method : 'post',
				url : '<c:url value="/point/history"/>',
				data : {ti_num: ti_num},
				dataType : 'json',
				success : function(data) {
					console.log(data);
					el = `
						<tr class="ticketing" style="text-align: center; background : slategrey;">
							<th>예매 번호</th>
							<th colspan="3">경로</th>
							<th>예매표 번호</th>
							<th>결제금액</th>
						</tr>
						<tr class="ticketing" style="background : rgb(188, 190, 192);">
							<td style="text-align: center;">
								\${data.ticketing.ti_num}
							</td>
							<td colspan="3" style="text-align: center;">
								\${data.ticketing.ai_start_name} -> \${data.ticketing.ai_end_name}
							</td>
							<td style="text-align: center;">
								`;
					for(ticket of data.ticketList){
						el += `\${ticket.tl_num} <br>`;
					}
					el += `
							</td>
							<td style="text-align: right;">
								\${data.ticketing.ti_price_str}원
							</td>
						</tr>
						`;					
				}
			});
			$(this).after(el);
			$('.point-history-detail').click(function() {
				$(this).siblings('.ticketing').remove();
			});
		})
		$('[name=bt_num]').change(function() {
			let bt_num = $(this).val();
			location.href = '<c:url value="/member/point?bt_num="/>'+bt_num;
		})
	</script>
</body>
</html>