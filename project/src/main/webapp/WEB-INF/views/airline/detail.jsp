<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	 <table class="table table-condensed">
  <h1>항공 상세정보</h1>
    <thead>
	      <tr>
	        <th>항공사명</th>
	        <th>항공기번호</th>
	        <th>항공기명</th>    
	      </tr>
		  <tr>
		<c:set var="selectedAirline" value="${param.al_name}" />
            <c:forEach items="${list}" var="airplane">
                <c:if test="${selectedAirline eq airplane.ap_al_name}">
                    <tr>
                        <td>${airplane.ap_al_name}</td>
                        <td>${airplane.ap_num}</td>
                        <td>${airplane.ap_am_model}</td>
                    </tr>
                </c:if>
            </c:forEach>
		</tr>
	</thead>	
	</table>
</body>
</html>