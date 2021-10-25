<!-- 재인 추가, 여기에 기존에 있는 로그인 ui 붙여넣으면 될듯.. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.loginDeniedAlert h2{
		color: red;
	}
</style>
</head>
<body>
	<div class="loginDeniedAlert">
	<h2><c:out value="${error }" /></h2>
	<h2><c:out value="${logout }" /></h2>
	</div>
	<form action="/login" method="post">
		<input type="text" name="username" placeholder="ID"/>
		<input type="text" name="password" placeholder="PASSWORD"/>
		<input type="submit" value="LOGIN" />
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
	</form>
</body>
</html>
