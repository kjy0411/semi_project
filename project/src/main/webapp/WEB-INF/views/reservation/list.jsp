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
	<nav>
		<h1>${msg}</h1>
		<h2>${goRoute.ai_name_start} -> ${goRoute.ai_name_end}</h2>
		<div class="container">
		  <table class="table table-bordered" style="text-align: center;">
		    <thead>
		     	<tr>
					<th>항공사</th>
					<th>출발시간</th>
					<th>도착시간</th>
					<th>비행시간</th>
					<th>비용(이코노미 1인)</th>
				</tr>
		    </thead>
		    <tbody>
		    	<c:forEach items="${scheduleList}" var="schedule">
			    	<tr class="sk_num" data-num="${schedule.sk_num}">
						<td>${schedule.ap_al_name}</td>
						<td>${schedule.sk_start_time_str}</td>
						<td>${schedule.sk_end_time_str}</td>
						<td>${schedule.sk_time_str}</td>
						<td>${schedule.sk_price_str}(원)</td>
					</tr>
		    	</c:forEach>
		    </tbody>
		  </table>
		</div>
		<a href="<c:url value='/reservation/search'/>"><button class="btn btn-outline-success">돌아가기</button></a>
	</nav>
	<script type="text/javascript">
		$('.sk_num').hover(function(){
			$(this).css('background', 'aqua');
		}, function(){
			$(this).css('background', 'white');
		});
		$(document).on('click', '.sk_num', function(){
			if(confirm("선택하시겠습니까?")){
				alert("선택되었습니다.");
			}else{
				alert("취소되었습니다.");
			}
		});
	</script>
</body>
</html>