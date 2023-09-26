 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.airline-box::after{clear: both; content: ''; display: block;}
</style>
</head>
<body>
	<h1>스케쥴 등록</h1>
	<form action="#">
		<h5>비행기 코드 선택</h5>
		<div class="airline-box" style="width: 200px">
			<select class="airline">
				<option class="select-option">항공사 선택</option>
				<c:forEach items="${alList}" var="al">
					<option value="${al.al_name}">
						${al.al_name}
					</option>
				</c:forEach>
			</select>
			<div class="airplane-box" style="float: right;">
			</div>
		</div>
		<h5>노선</h5>
		<h5>출발시간</h5>
		<input type="datetime-local" name="sk_start_time"> <br>
		<h5>비행시간</h5>
		<input type="time" name="sk_time"> <br>
		<h5>기본비용</h5>
		<input type="number" name="sk_price"> <br>
	</form>
	<script type="text/javascript">
		$('.airline').change(function() {
			$('.select-option').prop('disabled', true);
			let str = ``;
			let al_name = $(this).val();
			
			$.ajax({
				async : false,
				method : 'post',
				url : '<c:url value="/schedule/insert"/>',
				data : JSON.stringify(al_name),
				contentType : 'application/json; charset=utf-8',
				dataType : 'json',
				success : function(data){
					if(data.res){
						str += `
							<select class="airplane">
						`;
						for(ap of data.apList)
							str += `
								<option value="\${ap.ap_num}">
									\${ap.ap_num}
								</option>
							`;
						str += `
							</select>
						`;
					}else{
						str = `항공사에 등록된 비행기가 없습니다.`;
					}
					$('.airplane-box').html(str);
				}
			});
		})
	</script>
</body>
</html>