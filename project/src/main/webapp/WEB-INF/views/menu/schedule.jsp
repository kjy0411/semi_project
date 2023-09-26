 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>스케쥴</h1>
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>항공사</th>
					<th>출발지</th>
					<th>도착지</th>
					<th>출발시간</th>
					<th>비행시간</th>
					<th>도착시간</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${scList}" var="sc">
					<tr>
					 	<th class="sk_num">${sc.sk_num}</th>
					 	<th>${sc.ap_al_name}</th>
					 	<th>${sc.ai_start_name}</th>
					 	<th>${sc.ai_end_name}</th>
					 	<th>${sc.sk_start_time_str}</th>
				 		<th>${sc.sk_time_str}</th>
					 	<th>${sc.sk_end_time_str}</th>
					 	<c:if test="${sc.del_res == true}">
						 	<th><button class="btn-del btn btn-danger">x</button></th>
					 	</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button class="btn-insert btn-outline-primary">스케쥴 등록</button>
		<!-- 댓글 페이지네이션 -->
		<ul class="pagination justify-content-center">
			<c:if test="${pm.prev}">
				<li class="page-item">
					<a class="page-link" href="<c:url value='/menu/schedule${pm.cri.getUrl(pm.startPage-1)}'/>">이전</a>
				</li>
			</c:if>
			<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
				<li class="page-item <c:if test='${pm.cri.page == i}'>active</c:if>">
					<a class="page-link" href="<c:url value='/menu/schedule${pm.cri.getUrl(i)}'/>">${i}</a>
				</li>
			</c:forEach>
			<c:if test="${pm.next}">
				<li class="page-item">
					<a class="page-link" href="<c:url value='/menu/schedule${pm.cri.getUrl(pm.endPage+1)}'/>">다음</a>
				</li>
			</c:if>
		</ul>
	</div>
	<script type="text/javascript">
	$('.btn-insert').click(function() {
		location.href="<c:url value='/schedule/insert'/>";
	});
	$('.btn-del').click(function() {
		let sk_num = $(this).parents('th').siblings('.sk_num').text();
		$.ajax({
			async : false,
			method : 'post',
			url : '<c:url value="/schedule/delete"/>',
			data : JSON.stringify(sk_num),
			contentType : 'application/json; charset=utf-8',
			dataType : 'json',
			success : function(data){
				if(data.res){
					alert("삭제 성공");
					location.href="<c:url value='/menu/schedule'/>"
				}else{
					alert("삭제 실패");
				}
			}
		});
	});
	</script>
</body>
</html>