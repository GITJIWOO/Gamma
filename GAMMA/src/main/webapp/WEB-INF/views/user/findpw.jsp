<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function(){
	$("#findBtn").click(function(){
		console.log("email : " +$("#email").val());
		console.log("cid : "+$("#cid").val());
		var cid =$("#cid").val();
		var email=$("#email").val();
			$.ajax({
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				url : "/urest/findpw",
				type : "POST",
				dataType : 'text',
				data : JSON.stringify({
					cid ,
					email 
				}),
				success : function(result) {
					alert(result);
				}
			})
	});
})
</script>
<style type="text/css">
.mybtn{
  width:150px;
  height:40px;
  padding:0;
  display:inline; 
  border-radius: 4px; 
  background: #212529;
  color: #fff;
  margin-top: 20px;
  border: solid 2px #212529; 
  transition: all 0.5s ease-in-out 0s;
}
.mybtn:hover .mybtn:focus {
  background: white;
  color: #212529;
  text-decoration: none;
}
</style>
<title>비밀번호 찾기</title>
</head>
<body>
<div id="container">
	<form action="/login" method="post">
		<div class="border">
			<img src="/resources/css/image/mainIcon.png" />
			<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal" var="secuInfo" />
			<div class="main">
				<h1 class="IPvalue">비밀번호 찾기</h1>
				<p>인증된 이메일에서만 정보를 찾을 수 있습니다.</p>
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
				<button type="submit" value="LOGIN"> 비밀번호 찾기</button>
				<button class="cencle btn" type="button">취소</button>
					<input type="hidden"
					name="${_csrf.parameterName }" value="${_csrf.token }" />
			</div>
			</sec:authorize>
		</div>
	</form>
	</div>
<script type="text/javascript">
 	$(document).ready(function() {
		// 취소
		$(".cencle").on("click", function() {

			window.close();

		});

	
		});
		
</script>
</body>
</html>