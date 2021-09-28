<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>userLogin.jsp</h1>
	<form action=userLogin name="userLogin" method=post>
		<input type="text" name="cid" placeholder="id 입력"><br>
		<input type="password" name="password" placeholder="password 입력"><br>
		<input type="button" onclick ="login()" value="로그인">
		<input type="button" onclick ="join()" value="회원가입">
		
	</form>
</body>
<script>
	function login(){
		loginForm.submit();
	}
	function join(){
		location.href="userJoin";
	}
</script>
</html>