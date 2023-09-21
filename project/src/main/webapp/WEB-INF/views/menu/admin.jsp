<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<html>
<head>
	<title>회원 권한 수정</title>
</head>
<body>
<form action="<c:url value='/menu/admin'/>" method="get">
	<div class="input-group mb-3 mt-3">
		<div class="input-group-prepend">
		    <select class="form-control" id="me_authority" name="t">
		      <option value="all">전체</option>
		      <option value="second">아이디</option>
		      <option value="third">회원권한</option>
		    </select>
	    </div>
	    <input type="text" class="form-control" name="s" id="me_title" placeholder="검색어를 입력하세요." value="${pm.cri.s}">
	    <button class="btn btn-outline-success btn-insert">찾기</button>
	</div>
</form>
<!-- 회원정보 출력 -->
<div class="container">
  <table class="table table-hover">
    <thead>
      <tr>
        <th>회원아이디</th>
        <th>회원 권한</th>
        <th>권한변경</th>
      </tr>
    </thead>
    <tbody>
   	 <c:forEach items="${list}" var="member">
	      <tr>
	        <td class="id">${member.me_id}</td>
	        <td>
	        	<select class="form-control" name="type">
			      <option value="USER" <c:if test="${member.me_authority eq 'USER'}">selected</c:if>>USER</option>
			      <option value="ADMIN"<c:if test="${member.me_authority eq 'ADMIN'}">selected</c:if>>ADMIN</option>
			    </select>
	        </td>
	        <td><button class="btn btn-outline-warning btn-update">수정</button></td>
	      </tr>
      </c:forEach>
    </tbody>
  </table>
   <ul class="pagination justify-content-center">
    <li class="page-item"><a class="page-link" href="javascript:void(0);">이전</a></li>
    <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
    <li class="page-item"><a class="page-link" href="javascript:void(0);">다음</a></li>
  </ul>
 </div>
<script type="text/javascript">
	$('.btn-update').click(function(){
		let me_id = $(this).parents('tr').find('.id').text(); // class는 text() *클래스는 꼭 .을 붙여줘야한다.!!*
		let me_authority = $(this).parents('tr').find("[name=type]").val(); // select,input은 val()로
		let member = {
				me_id : me_id,
				me_authority : me_authority
		}
		$.ajax({
			method : 'post',
			url : '<c:url value="/menu/update"/>',
			data : JSON.stringify(member),
			contentType : 'application/json; charset=utf-8',
			dataType : 'json',
			success : function(data){
				if(data.res){
					alert('수정 성공!')
				}else{
					alert('수정 실패!');
				}
			}
		});
	})
	$('.btn-insert').click(function(){
		let me_title = $('#me_title').val(); // #은 아이디를 의미 (아이디 bt_title의 값 가져오기)
		let me_authority = $('#me_authority').val();

		if(me_title.trim().length == 0){
			alert('검색어를 입력해주세요.')
			return;
		}
		let member = {
				me_title : me_title,
				me_authority : me_authority
		}
		$.ajax({
			method : 'get',
			url : '<c:url value="/menu/search"/>',
			data : JSON.stringify(member),
			contentType : 'application/json; charset=utf-8',
			dataType : 'json',
			success : function(data){
				if(data.res){
					alert('검색 성공!')
				}else{
					alert('검색 실패!');
				}
			}
		});
	})
</script>
</body>
</html>
