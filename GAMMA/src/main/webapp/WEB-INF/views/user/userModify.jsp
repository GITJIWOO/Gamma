<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
input {
	width: 300px;
}
	.border {
	margin: 0 auto;
	width: 380px;
	height: 470px;
	border: 1px solid #000;
	border-radius: 10%;
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
h1{
 position: relative;
 top:30px;
 font-weight:bold;
}

	</style>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<script type="text/javascript">
 	$(document).ready(function() {
		// 취소
		$(".cencle").on("click", function() {

			location.href = "/user/userPro";

		})

		$("#submit").on("click", function() {
			if ($("#password").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#password").focus();
				return false;
			}
			if ($("#cid").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#cid").focus();
				return false;
			} 
		 	$.ajax({
				url : "/user/userModify",
				type : "POST",
				dateType : "json",
				data : $("#updateForm").serializeArray(),
				success : function(data) {

					if (data == true) {
						if (confirm("회원수정하시겠습니까?")) {
							$("#updateForm").submit();
						}

					} else {
						alert("패스워드가 틀렸습니다.");
						return;

					}
				}
			}) 
		});
	})
</script>
<body>
	<div id="container">
		<form action="/user/userModify" method="post">
		<div class="border">
		<div class="Title">
						<img src="/resources/css/image/mainIcon.png" />
						<h1 style="text-align: center;">회원정보 수정</h1>
				</div>
			<div class="row">
				<label class="control-label" for="cid">아이디</label><br/> <input
					 type="text" id="cid" name="cid"
					value="${member.cid}" readonly="readonly" />
					<div class="row">&nbsp;</div>
				<label class="control-label" for="password">패스워드</label> <br/><input
					 type="password" id="password" name="password" />
					 <div class="row">&nbsp;</div>
				<label class="control-label" for="nickname">닉네임</label><br/> <input
					 type="text" id="nickname" name="nickname"
					value="${member.nickname}" />
					<div class="row">&nbsp;</div>
				<label class="control-label" for="nickname">이메일</label> <br/><input
					 type="text" id="email" name="email"
					value="${member.email}" />
			</div>
			<div class="row">
				<button class="btn" type="submit" id="submit">회원정보수정</button>
				<button class="cencle btn" type="button">취소</button>
			</div>
			</div>
		</form>
	</div>

</body>

</html>