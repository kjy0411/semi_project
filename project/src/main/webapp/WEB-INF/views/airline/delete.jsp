<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
</head>
<body>
	<h1>항공사 삭제</h1>
	
	<form action="<c:url value='/airline/delete'/>" method="post">
			<div class="form-group">
				<input type="text" class="form-control" name="al_name" placeholder="항공사명 입력" >
			</div>
		<button class="btn btn-outline-success col-12">삭제하기</button>
		
		
		 <tbody>
	      <c:forEach items="${list }" var="board">
		      <tr>
		      	<td><input name="RowCheck" type="checkbox" value="${board.sk_num}"></td>
		        <td>${board.sk_num}</td>
		        <td>${board.sk_ap_num }</td>
		        <td>${board.sk_ro_num }</td>
		        <td>${board.sk_start_time }</td>
		        <td><fmt:formatDate pattern="hh:mm:ss" value="${board.sk_time }"/></td>
		        <td>${board.sk_start_time_str }</td>
		        <td>${board.sk_time_str }</td>
		        <td>${board.sk_price }</td>
		      </tr>
	      </c:forEach>
	
	    </tbody>
</body>
</html>