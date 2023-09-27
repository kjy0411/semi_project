<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>공항 리스트</title>
</head>
<body>
    <h1>공항 리스트</h1>
    <nav style="display: flex;">
	    <div class="info-box container-fluid" style="flex: 2;">
			<a href="<c:url value='/airport/insert'/>" class="btn btn-outline-primary">공항 등록</a>
			<a href="<c:url value='/route/insert'/>" class="btn btn-outline-danger">노선 등록</a>
		    <div class="detail-box">
		    	
		    </div>
	    </div>
	    <div class="popUp-box container-fluid" style="flex: 3; padding: 10px; overflow: scroll; height: 750px">
	    	<c:forEach items="${divisionList}" var="di">
	    		<h4>${di.di_name}</h4>
	    		<c:forEach items="${nationList}" var="na">
	    			<c:if test="${di.di_name == na.na_di_name}">
	    				<h6>${na.na_name}</h6>
	    				<c:forEach items="${airportList}" var="ai">
	    					<c:if test="${na.na_name == ai.ai_na_name}">
	    						<a class="ai_name" href="#">-${ai.ai_name}<span hidden>${ai.ai_num}</span></a> <br>
	    					</c:if>
	    				</c:forEach>
	    			</c:if>
	    		</c:forEach>
	    	</c:forEach>
		</div>
    </nav>
    <script type="text/javascript">
	    $(document).on('click', '.ai_name', function() {
			let num = $(this).children('span').text();
			let str = ``;
			$.ajax({
				async : false,
				method : 'post',
				url : '<c:url value="/airport/list"/>',
				data : JSON.stringify(num),
				contentType : "application/json; charset=UTF-8",
				dataType : 'json',
				success : function(data) {
					let airport = data.airport;
					console.log(data);
					if(data.res){
						str += `
							<h4>\${airport.ai_name}(\${airport.ai_num})</h4>
							<h5>국가 : \${airport.ai_na_name}(UTC : \${airport.ai_standard_time_str})</h5>
							<button class="btn-go btn btn-outline-danger">가는편 노선</button>
							<button class="btn-back btn btn-outline-primary">오는편 노선</button>
							<div class="route-box"></div>
						`;
					}else{
						str += `
							<h1>등록된 공항 코드가 아닙니다.<h1>
						`;
					}
					$('.detail-box').html(str);
					let routestr = ``;
					$('.btn-go').click(function() {
						routestr = ``;
						routestr += `
							<table style="text-align: center; width: 100%;">
								<thead>
									<tr style="display: flex; border-bottom: 3px solid black">
										<th style="flex: 4";>출발</th>
										<th style="flex: 4";>도착</th>
									</tr>
								</thead>
						`;
						for(go of data.route_go){
							routestr += `
								<tbody>
									<tr style="display: flex; border-bottom: 2px solid black">
										<td style="flex: 4";>
											\${go.ro_ai_start} <br>
											\${go.ai_name_start}
										</td>
										<td style="flex: 4";>
											\${go.ro_ai_end} <br>
											\${go.ai_name_end}
										</td>
									</tr>
								</tbody>
							`;
						}
						routestr += `
							</table>
						`;
						if(data.route_go.length == 0){
							routestr = `<h2>등록된 노선이 없습니다.</h2>`;
						}
						$('.route-box').html(routestr);
					});
					$('.btn-back').click(function() {
						routestr = ``;
						routestr += `
							<table style="text-align: center; width: 100%;">
								<thead>
									<tr style="display: flex; border-bottom: 3px solid black">
										<th style="flex: 4";>출발</th>
										<th style="flex: 4";>도착</th>
									</tr>
								</thead>
						`;
						for(back of data.route_back){
							routestr += `
								<tbody>
									<tr style="display: flex; border-bottom: 2px solid black">
										<td style="flex: 4";>
											\${back.ro_ai_start} <br>
											\${back.ai_name_start}
										</td>
										<td style="flex: 4";>
											\${back.ro_ai_end} <br>
											\${back.ai_name_end}
										</td>
									</tr>
								</tbody>
							`;
						}
						routestr += `
							</table>
						`;
						if(data.route_back.length == 0){
							routestr = `<h2>등록된 노선이 없습니다.</h2>`;
						}
						$('.route-box').html(routestr);
					});
					$(document).on('click', '.btn-route-delete', function() {
						if(confirm("해당 노선을 삭제하시겠습니까?")){
							let ro_num = $(this).data('num');
							routeDelete(ro_num)
						}
					});
				}
				
			});
		});
	    function routeDelete(num) {
	    	$.ajax({
				async : false,
				method : 'post',
				url : '<c:url value="/route/delete"/>',
				data : JSON.stringify(num),
				contentType : "application/json; charset=UTF-8",
				dataType : 'json',
				success : function(data) {
				}
			});
		}
    </script>
</body>
</html>