<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<h1 style="font-size:25px;">항공 상세정보</h1>
	<a href="<c:url value='/menu/airport'/>"> <button type="button" class="btn btn-primary" >뒤로가기</button></a>
	 <table class="table table-condensed">
    	<thead>
	      <tr>
	        <th style="text-align: center;border : 1px solid">항공사명</th>
	        <th style="text-align: center;border : 1px solid">항공기번호</th>
	        <th style="text-align: center;border : 1px solid">항공기명</th>    
	      </tr>
		  <tr>
		<c:set var="selectedAirline" value="${param.al_name}" />
            <c:forEach items="${list}" var="airplane">
                <c:if test="${selectedAirline eq airplane.ap_al_name}">
                    <tr>
                        <td style="text-align: center;border : 1px solid">${airplane.ap_al_name}</td>
                        <td style="text-align: center;border : 1px solid">${airplane.ap_num}</td>
                        <td style="text-align: center;border : 1px solid">${airplane.ap_am_model}</td>
                    </tr>
                </c:if>
            </c:forEach>
		</tr>
		
		</thead>
	</table>
</body>
</html>