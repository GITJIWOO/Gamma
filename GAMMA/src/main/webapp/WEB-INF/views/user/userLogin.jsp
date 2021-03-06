<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<html>
<head>
<meta charset="UTF-8">
<title>userLogin</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
	text-align: center;
}

form {
	text-align: center;
	margin: 0 auto;
}
#naver_id_login{
padding :5px;
margin : 5px;
}
.main {
	position: relative;
	bottom: 25px;
	font-weight: bold;
}

#body {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.border {
	padding: 0;
	margin: 0;
	width: 380px;
	height: 500px;
	border: 1px solid #000;
	border-radius: 10%;
}

.img {
	width: 150px;
	height: 150px;
}
.loginDeniedAlert {

	padding: 0;
	margin: 0;
}

button {
	width: 150px;
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
</head>
<body>
	<div id="body">
			<div class="border">
				<img class="img" src="/resources/css/image/mainIcon.png" />
				<div class="main">
					<form action="/login" method="post">
						<h1 class="IPvalue">로그인</h1>
						<div>
							<label class="IPvalue" for="cid">아이디</label><br /> <input
								type="text" id="cid" name="username" />
						</div>
						<br />
						<div>
							<label class="IPvalue" for="password">비밀번호</label><br /> <input
								type="password" id="password" name="password" />
						</div>
						<br />
						<!-- 체크하면 7일간 로그인 유지됨 -->
						<label class="lo"><input type="checkbox"
							name="remember-me">로그인 상태 유지 </label><br />
						<button type="submit" value="LOGIN">로그인</button>
						<input type="hidden" name="${_csrf.parameterName }"
							value="${_csrf.token }" />
					</form>
					<c:if test="${url ne null }">
						<div id="naver_id_login">
			<a href="${url }"><button>네이버로 로그인</button></a>
		</div>
					</c:if>
					<a href ="/user/userLogin" onclick="window.open('/user/findpw', '_blank', 'width=450px,height=500px',
							'left=400px,top=100px,scrollbars=yes, toolbar=no,location=no,fullscreen=no');return false;" >비밀번호 찾기</a>
			</div>
			<div class="loginDeniedAlert">
			<br/><br/>
				<h3>
					<c:out value="${error }" />
				</h3>
				<h3>
					<c:out value="${logout }" />
				</h3>
			</div>
			</div>
	</div>
</body>
</html>
