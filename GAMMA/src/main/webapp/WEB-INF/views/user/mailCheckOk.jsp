<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
*{
	text-align : center;
}
.border {
	margin: 0 auto;
	width: 380px;
	height: 440px;
	border: 1px solid #000;
	border-radius: 10%;
}
img {
	width: 150px;
	height: 150px;
	padding:0;
	margin:0;
}
button {
	width: 100px;
	height: 40px;
	padding: 0;
	display: inline;
	border-radius: 4px;
	background: #212529;
	color: #fff;
	margin-top: 5px;
	border: solid 2px #212529;
	transition: all 0.5s ease-in-out 0s;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="border">
			<img src="/resources/css/image/mainIcon.png" />
			<div class="main">
				<h1 class="IPvalue">이메일 인증체크</h1>
				<label for="email">이메일 인증발송</label>
				
				<p>이메일을 발송 했습니다. 확인해주세요.
				
			</div>
			<a href="/main/main"><button onclick="opener.location.href='http://localhost:8181/main/main';window.close();">
					홈페이지로
				</button></a>
			</div>
	
</body>
</html>