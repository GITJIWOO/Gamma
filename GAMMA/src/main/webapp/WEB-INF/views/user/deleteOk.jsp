<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>환영합니다!</title>
<style>
*{
margin: 0;
	padding: 0;
text-align:center;
}
.border {
	margin: 0 auto;
	width: 380px;
	height: 500px;
	border: 1px solid #000;
	border-radius: 10%;
}
img {
	width: 150px;
	height: 150px;
}
</style>
</head>
<body>

	<div style="margin: 100px;">
	<div class="border">
		<a><img src="/resources/css/image/mainIcon.png" /></a> <br>
				<br>
		<p>탈퇴가 완료 되었습니다 로그인을 다시 해주세요.</p>
		<br>
		<p>로그인 하시면 홈페이지 내의 모든 서비스를 이용하실 수 있습니다.</p>
		<br> <button onclick="window.opener.location.reload(); opener.location.href='http://localhost:8181/main/main'; window.close();"> 홈페이지로 이동하기</button>
		</div>
	</div>

</body>
</html>