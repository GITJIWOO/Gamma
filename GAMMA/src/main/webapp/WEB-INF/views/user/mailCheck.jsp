<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
* {
	margin: 0;
	padding: 0;
	text-align: center;
}

form {
	text-align: center;
	margin: 0 auto;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 80vh;
}

.main {
	position: relative;
	bottom: 25px;
	font-weight: bold;
}

.border {
	margin: 0 auto;
	width: 380px;
	height: 440px;
	border: 1px solid #000;
	border-radius: 10%;
}

.border2 {
	margin: 0 auto;
	width: 230px;
	height: 350px;
	border: 1px solid #000;
	border-radius: 10%;
}

img {
	width: 150px;
	height: 150px;
}

#checkB {
	display: flex;
	flex-flow: row;
}

input {
	
}
#lo{
	
}

#IPvalue {
	font-family: 'Cafe24Ssurround';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

button {
	width: 150px;
	height: 40px;
	padding: 0;
	display: inline;
	border-radius: 4px;
	background: #212529;
	color: #fff;
	margin-top: 20px;
	border: solid 2px #212529;
	transition: all 0.5s ease-in-out 0s;
}
</style>
<title>Insert title here</title>
</head>
<body>
<form action="/user/mailCheck" method="POST">
<sec:authorize access="isAuthenticated()">
          	<sec:authentication property="principal" var="principal" />
<!-- 본인확인 이메일 -->
			<div class="border">
			<img src="/resources/css/image/mainIcon.png" />
			<div class="main">
				<h1 class="IPvalue">이메일 인증</h1>
				<label for="email">이메일</label>
				<input type="text" class="form-control" name="email" id="email" placeholder="${principal.consumer.email}" value="${principal.consumer.email}" required>
				<input type="hidden" name="cid" value="${principal.consumer.cid }"/>
			</div>
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
			<button id="email_check">
					인증하기
				</button>
			</div>
			</sec:authorize>
		</form>
		<script>
		window.onload('load', function() {
			var myEtn = document.getElementById("email_check");
			myEtn.onclick = theEmailCheck;
		})
		function theEmailCheck() {
			window.open("/user/mailCheckOk", "email_check",
							"width=600px,height=600px",
							"left=400px,top=100px,scrollbars=yes, toolbar=no,location=no,fullscreen=no");
		}
		</script>
</body>
</html>