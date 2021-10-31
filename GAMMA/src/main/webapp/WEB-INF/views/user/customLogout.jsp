<!-- 재인 추가 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 로그아웃 페이지 따로 만들지 말고,(헤당 페이지 삭제하고) 아래 코드를 페이지마다 작성할 에정 -->
	<form action="/user/customLogout" method="post">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		<input type="submit" value="LOGOUT" />
	</form>
</body>
</html>