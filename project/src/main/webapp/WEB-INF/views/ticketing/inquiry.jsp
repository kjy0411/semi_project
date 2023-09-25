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
<!-- 예매내역 조회 -->
<form action="<c:url value='/ticketing/search'/>" method="get">
	<div class="input-group mb-3 mt-3">
		<div class="input-group-prepend">
		    <select class="form-control" id="ti_search" name="t">
		      <option value="all">전체</option>
		      <option value="second">아이디</option>
		      <option value="third">예매번호</option>
		    </select>
	    </div>
	    <input type="text" class="form-control" name="s" id="ti_title" placeholder="검색어를 입력하세요." value="${pm.cri.s}">
	    <button class="btn btn-outline-success btn-insert">찾기</button>
	</div>
</form>
<!-- 예매내역 조회 -->
<div class="container">
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
   	 <c:forEach items="${list}" var="ticketing" >
	      <tr>
	      	<td class="num">${ticketing.ti_num}</td>
	        <td class="id">${ticketing.ti_me_id}</td>
	        <td>${ticketing.ti_use_point}</td>
	        <td>${ticketing.ai_start_name}</td>
	        <td>${ticketing.ai_end_name}</td>
	        <td class="state">${ticketing.ti_state}</td>
	        <td><button class="btn btn-outline-warning btn-update">수정</button></td>
	      </tr>
      </c:forEach>
    </tbody>
  </table>
 </div>
 <script type="text/javascript">
 $('.btn-update').click(function(){
		let ti_me_id = $(this).parents('tr').find('.id').text(); // class는 text() *클래스는 꼭 .을 붙여줘야한다.!!*
		let ti_state = $(this).parents('tr').find('.state').text(); 
		let ti_num = $(this).parents('tr').find('.num').text();
		
		let ticketing = {
				ti_me_id : ti_me_id,
				ti_state : ti_state,
				ti_num : ti_num
		}
		$.ajax({
			method : 'post',
			url : '<c:url value="/ticketing/update"/>',
			data : JSON.stringify(ticketing),
			contentType : 'application/json; charset=utf-8',
			dataType : 'json',
			success : function(data){
				if(data.res){
					alert('수정 성공!')
				}else{
					alert('수정 실패!');
				}
			}
		});
	})
	$('.btn-insert').click(function(){
		let ti_title = $('#ti_title').val(); // #은 아이디를 의미 (아이디 bt_title의 값 가져오기)
		let ti_search = $('#ti_search').val();

		if(ti_title.trim().length == 0){
			alert('검색어를 입력해주세요.')
			return;
		}
		let ticketing = {
				ti_title : ti_title,
				ti_search : ti_search
		}
		$.ajax({
			method : 'get',
			url : '<c:url value="/ticketing/search"/>',
			data : JSON.stringify(ticketing),
			contentType : 'application/json; charset=utf-8',
			dataType : 'json',
			success : function(data){
				if(data.res){
					alert('검색 성공!')
				}else{
					alert('검색 실패!');
				}
			}
		});
	})
 </script>
</body>
</html>