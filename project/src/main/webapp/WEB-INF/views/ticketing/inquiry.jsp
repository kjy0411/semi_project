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
        <th>아이디</th>
        <th>예매좌석수</th>
        <th>출발지</th>
        <th>도착지</th>
        <th>상태</th>
      </tr>
    </thead>
    <tbody>
   	 <c:forEach items="${list}" var="ticketing" >
	      <tr>
	      	<td class="num">${ticketing.ti_num}</td>
	        <td>${ticketing.ti_me_id}</td>
	        <td>${ticketing.ti_amount}</td>
	        <td>${ticketing.ai_start_name}</td>
	        <td>${ticketing.ai_end_name}</td>
	        <td>${ticketing.ti_state}</td>
	      </tr>
      </c:forEach>
    </tbody>
  </table>
 </div>
 <script type="text/javascript">
 checkLogin()
 function checkLogin(){
		if(${user == null}){
			alert("로그인 후 이용가능한 기능입니다.")
			location.href="<c:url value='/member/login'/>"
		}
	}
 </script>
</body>
</html>