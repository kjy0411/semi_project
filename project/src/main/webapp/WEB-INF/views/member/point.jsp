<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.box{width: 50%; padding: 10px}
	input{float: right; width: 50%;}
</style>
</head>
<body>
	<h1>마일리지 보기</h1>
	<div class="info-container" style="width: 100%; border: 3px solid black; display: flex;">
		<div class="member-box box" style="flex: 3;">
			<span>ID :</span>
			<input type="text" class="me_id" value="${point.po_me_id }" readonly> <br>
			<span>등급 :</span>
			<input type="text" class="me_id" value="${point.po_mc_name }" readonly> <br>
			<span>누적 마일리지 :</span>
			<input type="text" class="me_id" value="${point.po_accumulate_point }" readonly> <br>
			<span>적립 마일리지 :</span>
			<input type="text" class="me_id" value="${point.po_hold_point }" readonly> <br>
		</div>
		<div class="point-box box" style="border-left: 2px solid black; flex: 5;">
			<table style="font-size: 5px;">
				<thead>
					<tr>
						<th>등급</th>
						<th>등급 조건</th>
						<th>등급 혜택</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<span>실버</span>
						</td>
						<td>
							<span>누적마일리지 50000 미만</span>
						</td>
						<td>
							<span>없음</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>골드</span>
						</td>
						<td>
							<span>누적마일리지 50000 이상</span>
						</td>
						<td>
							<span>마일리지 적립시 5% 추가</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>다이아몬드</span>
						</td>
						<td>
							<span>누적마일리지 100000 이상</span>
						</td>
						<td>
							<span>마일리지 적립시 10% 추가</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>다이아몬드 플러스</span>
						</td>
						<td>
							<span>누적마일리지 500000 이상</span>
						</td>
						<td>
							<span>마일리지 적립시 15% 추가</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>플래티넘</span>
						</td>
						<td>
							<span>누적마일리지 1000000 이상</span>
						</td>
						<td>
							<span>마일리지 적립시 20% 추가</span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>