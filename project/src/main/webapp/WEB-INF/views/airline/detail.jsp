<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<table class="table table-condensed">
  <h1>항공 상세정보</h1>
    <thead>
	      <tr>
	        <th>Airplane Name</th>
      		<th>Model</th>   
	      </tr>
		  <tr>
		<c:set var="selectedAirline" value="${param.al_name}" />
            <c:forEach items="${list}" var="airplane">
                <c:if test="${selectedAirline eq airplane.ap_al_name}">
                    <tr>
                        <td>${airplane.ap_al_name}</td>
                        <td>${airplane.ap_am_model}</td>
                    </tr>
                </c:if>
            </c:forEach>
		</tr>
	</thead>	
	</table>
</body>
</html>