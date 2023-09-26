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
		<table class="table table-bordered"  style="width:100%" "height=50">
		    <thead>
		      <tr  style="text-align:center">
		         <th>항공사명</th>
		      </tr>
		    </thead>
			<tbody>
				<c:forEach items="${list}" var="airline">
			      	<tr>
						<td>
							<a href="<c:url value='/airline/detail?al_name=${airline.al_name}'/>">${airline.al_name}</a>
						</td>
					</tr>
				</c:forEach>
	   	   </tbody>
			 </table>
			 <div class="container">
		     <a href="<c:url value='/airline/insert'/>"> <button type="button" class="btn btn-primary" >항공사 등록</button> </a>
			 <a href="<c:url value='/airline/insert_con'/>"> <button type="button" class="btn btn-primary" >항공기 등록</button> </a>
			 <a href="<c:url value='/airline/delete'/>"> <button type="button" class="btn btn-primary" >항공사 삭제</button> </a>
			 <a href="<c:url value='/airline/delete_ap'/>"> <button type="button" class="btn btn-primary" >항공기 삭제</button> </a>
		</div>
	</body>
</html>