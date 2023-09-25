<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<body>
	<div style="width: 100%; display: flex;">
		<div class="search-box container-fluid" style="flex: 2">
			<form action="<c:url value='/schedule/insert'/>" method="get">
				<div class="search-box">
					<div class="resist-num form-group">
						<span class="col-1">등록번호</span> <br>
						<input class="form-control" type="text" name="resistNum" placeholder="등록번호">
					</div>
					<div class="line-num form-group">
						<span class="col-1">노선번호</span> <br>
						<input class="form-control" type="text" name="lineNum" placeholder="노선번호">
					</div>
					<div class="start-time form-group">
						<span class="col-1">출발시간</span> <br>
						<input class="form-control" type="date" name="startTime" min="">
					</div>
					<div class="air-time form-group">
						<span class="col-1">비행시간</span> <br>
						<input class="form-control" type="date" name="airTime" min="">
					</div>
					<div class="no-cost form-group">
						<span class="col-1">기본비용</span> <br>
						<input class="form-control" type="text" name="no-cost" placeholder="기본비용">
					</div>
				</div>
				<button class="btn btn-outline-primary">등록</button>
			</form>
		</div>
		<div class="popUp-box container-fluid" style="flex: 3; padding: 10px; overflow: scroll; height: 750px">
		</div>
	</div>
	<script>
	$('.resist-num').click(function() {
		let airline = true;
		let ap_num ="";
		printAirplane(airline,ap_num);
	})
			$(document).on('click', '.select-resist-num', function(){
			let value = $(this).text();
			let num = $(this).prev().text();
			$('[name=startAirport]').val(value);
			$('[name=ap_num]').val(num);
			$('.popUp-box').empty();
		})
	
	
		function printAirplane(airline, ap_num) {
			str = ``;
			$.ajax({
				async : false,
				method : 'post',
				url : '<c:url value="/schedule/insert/"/>',
				data : {airline:airline, ap_num:ap_num},
				dataType : 'json',
				success : function(data) {
					console.log(data)
					if(data.res){			
						for(air of data.airportList){						
							str += `
								<span class="ap_num" hidden="">\${air.ap_num}</span>
								-<a class="select-resist-num" href="#">\${air.ap_num}</a> <br>
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