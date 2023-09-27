<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<h1>항공기 삭제</h1>
	<form action="<c:url value='/airline/delete_ap'/>" method="post">
			<div class="airline-box" style="width: 100%;display: flex;">
						<select class="form-control" name="ai_name" style="flex: 1; text-align: right;">
							<option class="select-option">항공사 선택</option>
							<c:forEach items="${alList}" var="al">
								<option value="${al.al_name}">
									${al.al_name}
								</option>
							</c:forEach>
						</select>
						<div class="airplane-box" style="flex: 1;">
							<select class="form-control" name="ap_num" style="text-align: right;">
								<option>항공사를 선택하세요</option>
							</select>
						</div>
					</div> <br>
		<button class="btn btn-outline-success col-12">삭제하기</button>
	</form>
	<script type="text/javascript">
	$('[name=ai_name]').change(function() {
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
						<select class="form-control" name="ap_num" style="flex: 1; text-align: right;">
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