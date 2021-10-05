<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
<meta charset="UTF-8">
	<title>userHome</title>
		<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
</head>
<a href="#">유저로그인</a><br />
<script type="text/javascript">
 $(document).ready(function(){
	$("#logoutBtn").on("click", function(){
		location.href="user/userLogout";
	})
	$("#registerBtn").on("click", function(){
		location.href="user/userJoin";
	})
	
	
	
	$("#userUpdateBtn").on("click", function(){
		location.href="user/userModify";
	})
	
	$("#usererDeleteBtn").on("click", function(){
		location.href="user/userDelete";
	})
	
}) 
</script>
<body>
	<form name='homeForm' method="post" action="/user/userLogin">
		<c:if test="${member == null}">
			<div>
				<label for="cid"></label>
				<input type="text" id="cid" name="cid">
			</div>
			<div>
				<label for="password"></label>
				<input type="password" id="password" name="password">
			</div>
			<div>
				<button type="submit">로그인</button>
				<a href="/user/userJoin"><button id=registerBtn type="button">회원가입</button></a>
			</div>
		</c:if>
		<c:if test="${member != null }">
			<div>
				<p>${member.cid}님 환영 합니다.</p>
				<a href="/user/userModify"><button id="userUpdateBtn" type="button">회원정보수정</button></a>
				<a href="/user/userDelete"><button id="userDeleteBtn" type="button">회원탈퇴</button></a>
				<a href="/user/userLogout"><button id="logoutBtn" type="button">로그아웃</button></a>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
		</c:if>
	</form>
</body>
</html>