<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<html>
<head>
<title>Home</title>
  <style>
  .user-wrap{
  width: 100%;
  margin : 10px auto;
  position : relative;
  }
  .user-wrap img{
  width:100%;
  vertical-align : middle;
  }
  .user-text{
  position : absolute;
  top : 50%;
  left : 23%;
  transform:translate(-50%, -50%);
  font-family : fantasy;
  text-align : left;
  }
  .box{
  background-color : white;
  position : absolute;
  width :300px;
  height : 100%;
  right : 65%;
  opacity : 0.8;
  }
  </style>
</head>
<body id="page-top">
	
<div class="user-wrap">
	<div class="user-image">
		<div class="box"></div>
			<img src="<c:url value='/resources/img/mainpic.jpg'/>">		
		</div>
	<div class="user-text">
		<h2>KH AIR-4</h2>
		<h4>4조 세미프로젝트 입니다.</h4>
		<br><br>
		<h5>작업하기 전</h5>
		<h6>DDL과 샘플데이터를 작동시켜 DB를 초기화 해주세요.</h6>
		<h6>변경사항이 있을 수 있습니다.</h6>
		<br>
		<h5>관리자 계정</h5>
		<h6>ID : admin, PW : admin</h6>
		<br>
		<h5>사용자 계정</h5>
		<h6>ID : user, PW : user</h6>
	</div>
</div> 
     <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
