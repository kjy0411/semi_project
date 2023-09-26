<insert>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<body>
	<div style="width: 100%; display: flex;">
		<div class="search-box container-fluid" style="flex: 2">
			<form action="<c:url value='/schedule/insert'/>" method="post">
				<div class="search-box">
					<div class="resist-num form-group">
						<span class="col-1">등록번호</span> <br>
						<input class="form-control" type="text" name="sk_ap_num" readonly placeholder="등록번호">
						<span class="notice sk_ap_num-notice" style="color: red;">등록번호 입력은 필수사항 입니다.</span>
					</div>
					<div class="route-num form-group">
						<span class="col-1">노선번호</span> <br>
						<input class="form-control" type="text" name="sk_ro_num" readonly placeholder="노선번호">
						<span class="notice sk_ro_num-notice" style="color: red;">노선번호 입력은 필수사항 입니다.</span>
					</div>
					<div class="start-time form-group">
						<span class="col-1">출발시간</span> <br>
						<input class="form-control" type="datetime-local" name="sk_start_time" min="">
						<span class="notice sk_start_time-notice" style="color: red;">출발시간 입력은 필수사항 입니다.</span>
					</div>
					<div class="air-time form-group">
						<span class="col-1">비행시간</span> <br>
						<input class="form-control" type="time" name="sk_time" min="">
						<span class="notice sk_time-notice" style="color: red;">비행시간 입력은 필수사항 입니다.</span>
					</div>
					<div class="no-cost form-group">
						<span class="col-1">기본비용</span> <br>
						<input class="form-control" type="text" name="sk_price" placeholder="기본비용">
						<span class="notice sk_price-notice" style="color: red;">기본비용 입력은 필수사항 입니다.</span>
					</div>
				</div>
				<button type="submit" class="btn btn-outline-primary">등록</button>
			</form>
		</div>
		<div class="popUp-box container-fluid" style="flex: 3; padding: 10px; overflow: scroll; height: 750px">
		</div>
	</div>
	<script type="text/javascript">
		$('.notice').hide();		
		  $('form').submit(function() {
			  let sk_ap_num = $('[name=sk_ap_num]').val();
			  let sk_ro_num = $('[name=sk_ro_num]').val();
			  let sk_start_time = $('[name=sk_start_time]').val();
			  let sk_time = $('[name=sk_time]').val();
			  let sk_price = $('[name=sk_price]').val();
			    if (sk_ap_num == '') {
			      $('.sk_ap_num-notice').show();
			      return false;
			    }
				if(sk_ro_num == '') {
			      $('.sk_ro_num-notice').show();
			      return false;			    	
			    }
				if(sk_start_time == '') {
			      $('.sk_start_time-notice').show();
			      return false;			    	
			    }
				if(sk_time == '') {
			      $('.sk_time-notice').show();
			      return false;			    	
			    }
				if(sk_price == '') {
			      $('.sk_price-notice').show();
			      return false;			    	
			    }
			});
	</script>
	<script>
	/* 등록번호 */
	$('.resist-num').click(function() {
		let airline = true;
		let ap_num ="";
		printAirplane(airline,ap_num);
	})
			$(document).on('click', '.select-resist-num', function(){
			let value = $(this).text();
			let num = $(this).prev().text();
			$('[name=sk_ap_num]').val(value);
			$('[name=ap_num]').val(num);
			$('.popUp-box').empty();
		})
		
	
		function printAirplane(airline, ap_num) {
			str = ``;
			$.ajax({
				async : false,
				method : 'post',
				url : '<c:url value="/schedule/search/"/>',
				data : {airline:airline, ap_num:ap_num},
				dataType : 'json',
				success : function(data) {
					console.log(data)
					
					if(data.res){			
						for(air of data.airportList){	
							str += `
								<span class="ap_num" hidden="">\${air.ap_num}</span>
								-\${air.ap_al_name}<br>
								-\${air.ap_am_model}<br>
								-<a class="select-resist-num" href="#">\${air.ap_num}</a> <br>
								<br>
							`;												
						}											
					}else {
						alert(data.msg);
					}
					
				$('.popUp-box').html(str);
				}
			});
		}
	
	/* 노선번호 */
	$('.route-num').click(function() {
		let airline = true;
		let ap_num ="";
		printRoute(airline,ap_num);
	})
			$(document).on('click', '.select-route-num', function(){
			let value = $(this).text();
			let num = $(this).prev().text();
			$('[name=sk_ro_num]').val(value);
			$('[name=ap_num]').val(num);
			$('.popUp-box').empty();
		})
	
		function printRoute(airline, ap_num) {
			str = ``;
			$.ajax({
				async : false,
				method : 'post',
				url : '<c:url value="/schedule/route/"/>',
				data : {airline:airline, ap_num:ap_num},
				dataType : 'json',
				success : function(data) {
					console.log(data)
					if(data.res){			
						for(air of data.routeList){						
							str += `
								<span class="ro_num" hidden="">\${air.ro_num}</span>
								-<a class="select-route-num" href="#">\${air.ro_num}</a> <br>
								-\${air.ro_ai_start} (\${air.ai_name_start})<br>
								-\${air.ro_ai_end} (\${air.ai_name_end})<br>
								<br>
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