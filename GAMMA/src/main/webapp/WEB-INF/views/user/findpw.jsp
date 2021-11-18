<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
*{
	text-align : center;
}
.border {
	margin: 0 auto;
	width: 380px;
	height: 480px;
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
<title>비밀번호 찾기</title>
</head>
<body>
<div id="container">
	<form action="/user/findpw" method="POST">
		<div class="border">
			<img src="/resources/css/image/mainIcon.png" />
			<div class="main">
				<h1 class="IPvalue">비밀번호 찾기</h1>
				<div>
					<label class="IPvalue" for="cid">아이디</label><br /> <input
						type="text" id="cid" name="cid" />
				</div>
				<br />
				<div>
					<label class="IPvalue" for="email">이메일</label><br /> <input
						type="email" id="email" name="email" />
				</div>
				<br />
					<input type="hidden"
					name="${_csrf.parameterName }" value="${_csrf.token }" />
				<button type="submit" id="findBtn"> 비밀번호 찾기</button>
				<button class="cencle" onclick="window.close();">취소</button>
			</div>
		</div>
	</form>
	</div>
	<script>
	$(document).ready(function() {

		$("#findBtn").on("click", function() {
			location.href = "/user/mailCheckOk";
		});
	});
	</script>
</body>
</html>