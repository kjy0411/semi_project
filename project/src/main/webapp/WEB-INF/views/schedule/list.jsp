<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length;
			
			$("input[name='allCheck']").click(function(){
				var chk_listArr = $("input[name='RowCheck']");
				for (var i=0; i<chk_listArr.length; i++){
					chk_listArr[i].checked = this.checked;
				}
			});
			$("input[name='RowCheck']").click(function(){
				if($("input[name='RowCheck']:checked").length == rowCnt){
					$("input[name='allCheck']")[0].checked = true;
				}
				else{
					$("input[name='allCheck']")[0].checked = false;
				}
			});
		});
		function deleteValue(){
			var url = "<c:url value='/delete'/>";    // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
			var valueArr = new Array();
		    var list = $("input[name='RowCheck']");
		    for(var i = 0; i < list.length; i++){
		        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
		            valueArr.push(list[i].value);
		        }
		    }
		    /*list.each(function(){
		    	if($(this).checked){ //선택되어 있으면 배열에 값을 저장함
		            valueArr.push($(this).val());
		        }
		    })*/
		    if (valueArr.length == 0){
		    	alert("선택된 글이 없습니다.");
		    }
		    else{
				var chk = confirm("정말 삭제하시겠습니까?");				 
				$.ajax({
				    url : url,                    // 전송 URL
				    type : 'POST',                // GET or POST 방식
				    traditional : true,
				    data : {
				    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
				    },
	                success: function(jdata){
	                    if(jdata = 1) {
	                        alert("삭제 성공");
	                        location.replace("list")
	                    }
	                    else{
	                        alert("삭제 실패");
	                    }
	                }
				});
			}
		}
	</script>
</head>
<body>
	<h1>스케줄 조회</h1>
	<table class="table table-hover">
	    <thead>
	      <tr>
	      	<th><input id="allCheck" type="checkbox" name="allCheck"></th>
	        <th>스케줄 번호</th>
	        <th>등록번호</th>
	        <th>노선번호</th>
	        <th>출발시간</th>
	        <th>비행시간</th>
	        <th>기본비용</th>
	      </tr>
	    </thead>
	    <tbody>
	      <c:forEach items="${list }" var="board">
		      <tr>
		      	<td><input name="RowCheck" type="checkbox" value="${board.sk_num}"></td>
		        <td>${board.sk_num}</td>
		        <td>${board.sk_ap_num }</td>
		        <td>${board.sk_ro_num }</td>
		        <td>${board.sk_start_time_str }</td>
		        <td>${board.sk_time_str }</td>
		        <td>${board.sk_price }</td>
		      </tr>
	      </c:forEach>
	
	    </tbody>
	</table>  
  	<div class="text-center">	
  		<input type="button" value="스케줄 추가" class="btn btn-outline-info" onclick="location.href='/project/schedule/insert'">
		<input type="button" value="스케줄 삭제" class="btn btn-outline-info" onclick="deleteValue();">
	</div>
</body>
</html>