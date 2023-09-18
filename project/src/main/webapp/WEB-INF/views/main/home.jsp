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
