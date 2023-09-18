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
<div class="container">
  <table class="table table-hover">
    <thead>
      <tr>
        <th>예매번호</th>
        <th>스케쥴번호</th>
        <th>아이디</th>
        <th>예매좌석수</th>
        <th>총급액</th>
        <th>결제 금액</th>
        <th>적립마일리지</th>
        <th>사용마일리지</th>
        <th>상태</th>
        <th>예매취소</th>
      </tr>
    </thead>
    <tbody>
   	 <c:forEach items="${ticketing}" var="inquiry">
	      <tr>
	      	<td>${ticketing.ti_num}</td>
	      	<td>${ticketing.ti_sk_num}</td>
	        <td>${ticketing.ti_me_id}</td>
	        <td>${ticketing.ti_amount}</td>
	        <td>${ticketing.ti_total_price}</td>
	        <td>${ticketing.ti_price}</td>
	        <td>${ticketing.ti_save_point}</td>
	        <td>${ticketing.ti_use_point}</td>
	        <td>${ticketing.ti_state}</td>
	        <td><button class="btn btn-outline-warning btn-update">예매 취소</button></td>
	      </tr>
      </c:forEach>
    </tbody>
  </table>
 </div>
</body>
</html>