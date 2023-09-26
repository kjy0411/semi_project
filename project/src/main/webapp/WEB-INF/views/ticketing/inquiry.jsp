<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>애매내역조회</title>
</head>
<body>
<select class="filter">
	<option class="zero" value="0">전체</option>
	<option class="one" value="1">확정</option>
	<option class="two" value="2">미확정</option>
	<option class="three" value="3">취소</option>
</select>
<!-- 예매내역 조회 -->
<div class="ticketing-box container">
  
 </div>
 <script type="text/javascript">
 selectTicketing(0);
 $('.filter').change(function() {
	 let ticketing = $(this).val();

	 selectTicketing(ticketing);
	})
	 //alert($(this).val());
	$(document).on('click', '.btn-update', function(){
		let ti_me_id = $(this).parents('tr').find('.id').text(); // class는 text() *클래스는 꼭 .을 붙여줘야한다.!!*
		let ti_state = $(this).parents('tr').find('.state').text(); 
		let ti_num = $(this).parents('tr').find('.num').text();
		
		let ticketing = {
				ti_me_id : ti_me_id,
				ti_state : ti_state,
				ti_num : ti_num
		}
		ticketingCancel(ticketing);
	})
	function selectTicketing(ticketing) {
	 let str = ``;
	 $.ajax({
			method : 'post',
			url : '<c:url value="/ticketing/inquiry"/>',
			data : JSON.stringify(ticketing),
			contentType : 'application/json; charset=utf-8',
			dataType : 'json',
			success : function(data){
				str += `
					<table class="table table-hover">
					    <thead>
					      <tr>
					        <th>예매번호</th>
					        <th>아이디</th>
					        <th>예매좌석수</th>
					        <th>출발지</th>
					        <th>도착지</th>
					        <th>상태</th>
					        <th>예매상태</th>
					      </tr>
					    </thead>
					    <tbody>
				`;
				for(ti of data.ticketingList){
					str += `
				      <tr>
				      	<td class="num">\${ti.ti_num}</td>
				        <td class="id">\${ti.ti_me_id}</td>
				        <td>\${ti.ti_amount}</td>
				        <td>\${ti.ai_start_name}</td>
				        <td>\${ti.ai_end_name}</td>
				        <td class="state">\${ti.ti_state}</td>
				    `;
				    if(ti.ti_state == "미확정"){
						str += `
					        <td><button class="btn btn-outline-warning btn-update">예매취소</button></td>
					    `;
				    }
					str += `
				      </tr>
					`;
				}
					str += `
					    </tbody>
					  </table>
				`;
				$('.ticketing-box').html(str);
			}
		});
	}
 function ticketingCancel(ticketing) {
	 $.ajax({
			method : 'post',
			url : '<c:url value="/ticketing/update"/>',
			data : JSON.stringify(ticketing),
			contentType : 'application/json; charset=utf-8',
			dataType : 'json',
			success : function(data){
				if(data.res){
					alert('예매취소 완료!')
				}else{
					alert('예매취소 실패!');
				}
				let num = $('.filter').val();
				selectTicketing(num);
			}
		});
}
 </script>
</body>
</html>