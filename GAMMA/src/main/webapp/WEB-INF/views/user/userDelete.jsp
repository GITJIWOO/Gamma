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
	<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cencle").on("click", function() {

			location.href = "/user/userHome";

		})

		$("#submit").on("click", function() {
			if ($("#password").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#password").focus();
				return false;
			}
			/* $.ajax({d
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
			}) */

		});

	})
</script>
<body>
	<section id="container">
		<form action="/user/userDelete" method="post" id="delForm">
			<div class="form-group has-feedback">
				<label class="control-label" for="cid">아이디</label> <input
					class="form-control" type="text" id="cid" name="cid"
					value="${member.cid}" readonly="readonly" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="password">패스워드</label> <input
					class="form-control" type="password" id="password" name="password" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="nickname">별칭</label> <input
					class="form-control" type="text" id="nickname" name="nickname"
					value="${member.nickname}" readonly="readonly" />
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">회원탈퇴</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
		</form>
		<div>
			<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
		</div>
	</section>

</body>

</html>