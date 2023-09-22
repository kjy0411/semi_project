<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<h1>회원가입</h1>
	<form action="<c:url value='/member/signup'/>" method="post">
		<div class="form-group">
			<label>아이디 :</label>
			<input type="text" class="form-control" name="me_id" placeholder="아이디">
			<span class="notice" style="color: red;">영문으로 시작, 영문, 숫자 조합으로 6~10자</span>
		</div>
			<button class="btn btn-outline-success col-12" type="button" id="btn-check">아이디 중복검사</button><br>
		<div class="form-group">
			<label>비번 :</label>
			<input type="password" class="form-control" name="me_pw" placeholder="비밀번호"> <br>
			<span class="notice" style="color: red;">영문, 숫자, !@#$ 조합으로 12~25자</span>
		</div>
		<div class="form-group">
			<label>비번 :</label>
			<input type="password2" class="form-control" name="me_pw2" placeholder="비밀번호 확인"> <br>
			<span class="notice" style="color: red;">비밀번호가 일치하지 않습니다.</span>
		</div>
		<div class="form-group">
			<label>이름 :</label>
			<input type="text" class="form-control" name="me_name" placeholder="이름"> <br>
		</div>
		<div class="form-group">
			<label>영어이름 :</label>
			<input type="text" class="form-control" name="me_eng_name" placeholder="영어 이름"> <br>
		</div>
		<div class="form-group">
			<label>생년월일 :</label>
			<input type="date" class="form-control" name="me_birthday"> <br>
			<span></span>
		</div>
		<div class="form-group">
			<label>전화번호 :</label>
			<input type="text" class="form-control" name="me_phone" placeholder="전화번호"> <br>
			<span class="notice" style="color: red;">'-'를 포함해서 입력하세요</span>
		</div>
		<div class="form-group">
			<label>이메일 :</label>
			<input type="email" class="form-control" name="me_email" placeholder="이메일"> <br>
			<span></span>
		</div>
		<button class="btn btn-outline-warning col-12">회원가입</button>
	</form>
	<script type="text/javascript">
		$('.notice').hide();
		
		$('.form-group').click(function() {
			$(this).children('.notice').show();
		})
		
		$('#btn-check').click(function(){
			let id =$('[name=me_id]').val();
			if(id.trim() == ''){
				alert('아이디를 입력하세요.');
				return;
			}
			$.ajax({
				async : true,
				url : '<c:url value="/member/id/check"/>',
				type : 'post',
				data : {id : id},
				success : function (data){
					if(data){
						alert('사용 가능한 아이디입니다.');
						checkId = true;
					}else{
						alert('이미 사용중인 아이디입니다.')
					}
				},
				error : function(res){
					console.log(res)
				}
			});
		})
		$('form').submit(function(){
			if(!checkId){
				alert('아이디 중복검사가 필요합니다.');
				return false;
			}
		})
	</script>
</body>
</html>