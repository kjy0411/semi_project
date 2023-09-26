<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<form action="<c:url value='/airline/insert_ap'/>" method="post">
		<h1>항공기 등록</h1>
			<div class="form-group">
				<input type="text" class="form-control" name="ap_num" placeholder="항공기번호 입력 (영문 1~3, 숫자 00001~9999)" >
			</div>
			<div class="form-group">
				 <select class="form-control" name="ap_al_name" id="ap_al_name">
	                <c:forEach items="${list}" var="airline">
	                    <option value="${airline.al_name }">
	                        ${airline.al_name }
	                    </option>
	                </c:forEach>
	            </select>
			</div>
			<div class="form-group">
				<select class="form-control" name="ap_am_model" id="ap_am_model">
					<c:forEach items="${modelList}" var="ml">
						<option value="${ml.am_model}">
							${ml.am_model}
						</option>
					</c:forEach>
				</select>
			</div>
		<button class="btn btn-outline-success col-12">등록하기</button>
	</form>

</body>
</html>