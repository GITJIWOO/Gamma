<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
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
img {
	width: 120px;
	height: 120px;
}
.Title{
display:flex; 
	flex-flow:row;
}

	.border {
	margin: 0 auto;
	width: 370px;
	height: 400px;
	border: 1px solid #000;
	border-radius: 10%;
}
label{
	font-weight:bold;
	padding:5px;
}
form {
	text-align: center;
	margin: 0 auto;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 80vh;
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
input {
	width: 300px;
}

h1{
 position: relative;
 top:30px;
 font-weight:bold;
}
</style>	
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
	<div class="container">
		<form action="/user/userDelete" method="post" id="delForm">
		<sec:authorize access="isAuthenticated()">
          	<sec:authentication property="principal" var="principal" />
			<div class="row border">
				<div class="Title">
						<img src="/resources/css/image/mainIcon.png" />
						<h1 style="text-align: center;">회 원 탈 퇴</h1>
				</div>
				<label class="control-label" for="cid">아이디</label> <br/><input
					 type="text" id="cid" name="cid"
					value="${principal.consumer.cid}" readonly/><br/>
				<label class="control-label" for="password">패스워드</label> <br/><input
					 type="password" id="password" name="password" /><br/>
				<label class="control-label" for="nickname">닉네임</label> <br/><input
					 type="text" id="nickname" name="nickname"
					value="${principal.consumer.nickname}" readonly /><br/>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<button class="btn" type="submit" id="submit">회원탈퇴</button>
				<button class="cencle btn" type="button">취소</button>
			</div>
			</sec:authorize>
		</form>
		<div>
			<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
		</div>
	</div>
	

	<script type="text/javascript">
		$(document).ready(function() {
			// 취소
			$(".cencle").on("click", function() {

				location.href = "/user/userLogin?cid=${principal.consumer.cid}";

			})

			/* $("#submit").on("click", function() {
				if ($("#password").val() == "") {
					alert("비밀번호를 입력해주세요.");
					$("#password").focus();
					return false;
				}
				$.ajax({
					url : "/user/passChk",
					type : "POST",
					dataType : "json",
					data : $("#delForm").serializeArray(),
					success : function(data) {

						if (data == true) {
							if (confirm("회원탈퇴하시겠습니까?")) {
								$("#delForm").submit();
							} else {
								alert("패스워드가 틀렸습니다.");
								return;
							}

						}
					}
				})

			}); */

		});
	</script>
</body>

</html>