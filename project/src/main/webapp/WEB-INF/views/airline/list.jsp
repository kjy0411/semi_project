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
		<thead>
		      <table class="table table-bordered">
			    <thead>
			      <tr>
			        <br>
			        <th>항공사명</th><br>
			      </tr>
			    </thead>
			    </table>
			    <table class="table table-bordered">
				<tbody>
		      	<tr>
				<c:forEach items="${list}" var="airline">
					<td>
					<a href="<c:url value='/airline/detail'/>">${airline.al_name }</a>
					</td> <br>
					</c:forEach>
				</tr>
		   	   </tbody>
 			 </table>
 			 <div class="container">
  
  <button type="button" class="btn btn-primary">항공사 등록</button>

</div>
		</thead>
	</body>
</html>