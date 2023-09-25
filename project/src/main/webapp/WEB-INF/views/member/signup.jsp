<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<style type="text/css">
	.id-box::after{clear: both; content: ''; display: block;}
</style>
</head>
<body>
	<h1>회원가입</h1>
	<form action="<c:url value='/member/signup'/>" method="post">
		<div class="form-group">
			<label>아이디 :</label>
			<div class="id-box">
				<input type="text" class="form-control col-6" name="me_id" id="id" placeholder="아이디" style="float: left;">
				<button class="btn btn-outline-success col-6" type="button" id="btn-check" style="float: right;" disabled>아이디 중복검사</button>
			</div>
		</div> <br>
		<label class="error" id="error-id"></label>
		<div class="form-group">
			<label>비밀번호 :</label>
			<input type="password" class="form-control" name="me_pw" id="pw" placeholder="비밀번호">
		</div> <br>
		<label class="error" id="error-pw"></label>
		<div class="form-group">
			<label>비밀번호 확인 :</label>
			<input type="password" class="form-control" name="me_pw2" id="pw2" placeholder="비밀번호 확인">
		</div> <br>
		<label class="error" id="error-pw2"></label>
		<div class="form-group">
			<label>이름 :</label>
			<input type="text" class="form-control" name="me_name" id="name" placeholder="이름">
		</div> <br>
		<label class="error" id="error-name"></label>
		<div class="form-group">
			<label>영어이름 :</label>
			<input type="text" class="form-control" name="me_eng_name" id="engName" placeholder="영어 이름">
		</div> <br>
		<label class="error" id="error-engName"></label>
		<div class="form-group">
			<label>생년월일 :</label>
			<input type="date" class="form-control" name="me_birthday" id="birthday" >
		</div> <br>
		<label class="error" id="error-birthday"></label>
		<div class="form-group">
			<label>전화번호 :</label>
			<input type="text" class="form-control" name="me_phone" id="phone" placeholder="전화번호">
		</div> <br>
		<label class="error" id="error-phone"></label>
		<div class="form-group">
			<label>이메일 :</label>
			<input type="email" class="form-control" name="me_email" id="email" placeholder="이메일">
		</div> <br>
		<label class="error" id="error-email"></label>
		<button class="btn btn-outline-warning col-12" disabled>회원가입</button>
	</form>
	<script type="text/javascript">
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
		let option = {
			rules : {
				me_id : {
					required : true,
					regex : /^[a-zA-Z][a-zA-Z0-9]{8,15}$/
				},
				me_pw : {
					required : true,
					regex : /^[a-zA-z0-9!@#$]{12,20}$/
				},
				me_pw2 : {
					required : true,
					equalTo : password
				},
				me_name : {
					required : true,
					regex : /^[가-힣]{1,30}$/
				},
				me_eng_name : {
					required : true,
					regex : /^[a-zA-z]{1,30}$/
				},
				me_birthday : {
					required : true,
					date : true
				},
				me_phone : {
					required : true,
					regex : /^[a-zA-z]{1,30}$/
				},
				me_email : {
					required : true,
					email : true
				}
			},
			messages : {
				me_id : {
					required : '아이디는 필수항목입니다.',
					regex : '아이디는 영문으로 시작하며 영문,숫자를 포함하며 8~15자 이어야합니다.'
				},
				me_pw : {
					required : '비밀번호는 필수항목입니다.',
					regex : '비밀번호는 영문,숫자,특수문자(!@#$)를 포함하며 12~20자 이어야합니다.'
				},
				me_pw2 : {
					required : '비밀번호확인은 필수항목입니다.',
					equalTo : '비밀번호와 일치하지 않습니다.'
				},
				me_name : {
					required : '이름은 필수항목입니다.',
					regex : '이름은 한글만 입력할 수 있으며 최대 30자까지 입력 가능합니다.'
				},
				me_eng_name : {
					required : '영문 이름은 필수항목입니다.',
					regex : '영문 이름은 영어만 입력할 수 있으며 최대 30자까지 입력 가능합니다.'
				},
				me_birthday : {
					required : '영문 이름은 필수항목입니다.',
					regex : '영문 이름은 영어만 입력할 수 있으며 최대 30자까지 입력 가능합니다.'
				},
				me_phone : {
					required : '영문 이름은 필수항목입니다.',
					regex : '영문 이름은 영어만 입력할 수 있으며 최대 30자까지 입력 가능합니다.'
				},
				me_email : {
					required : '이메일은 필수항목입니다.',
					email : '이메일 형식에 맞지않습니다.'
				}
			}
		}
		$("form").validate(option);
		
		$.validator.addMethod(
			"regex",
			function (value, element, regexp) {
				var re = new RegExp(regexp);
				return this.optional(element) || re.test(value);
			},
			"Please check your input."
		);
	</script>
</body>
</html>