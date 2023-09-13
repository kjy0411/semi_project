<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<html>
<head>
	<title>회원 목록 조회</title>
</head>
<body>
<h1>회원목록</h1>
<div class="input-group mb-3 mt-3">
		<div class="input-group-prepend">
		    <select class="form-control" id="authority">
		      <option value="0">회원 검색</option>
		      <option value="id">아이디</option>
		    </select>
	    </div>
	    <input type="text" class="form-control" id="bt_title">
	    <button class="btn btn-outline-success btn-insert">찾기</button>
	</div>
<!-- 회원정보 출력 -->
<div class="container">
  <table class="table table-hover">
    <thead>
      <tr>
        <th>회원아이디</th>
        <th>회원 권한</th>
        <th>권한 수정</th>
      </tr>
    </thead>
    <tbody>
   	 <c:forEach items="${list}" var="member">
	      <tr>
	        <td>${member.me_id}</td>
	        <td>
	        	<select class="form-control" name="type">
			      <option value="USER" <c:if test="${me_authroity eq 'USER'}">selected</c:if>>회원</option>
			      <option value="ADMIN"<c:if test="${me_authority eq 'ADMIN'}">selected</c:if>>관리자</option>
			    </select>
	        </td>
	        <td><button class="btn btn-outline-warning btn-update" data-num='\${me_num}'>수정</button></td>
	      </tr>
      </c:forEach>
    </tbody>
     <script type="text/javascript">
     $(document).on('click','.btn-update',function(){
    	alert('클릭')
     })
     </script>
  </table>
</div>
</body>
</html>
