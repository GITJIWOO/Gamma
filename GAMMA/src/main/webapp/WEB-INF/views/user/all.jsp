<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>all</h2>
	<!-- 게스트 -->
	<sec:authorize access="isAnonymous()">
		<h1>로그인이 필요한 페이지입니다.</h1>
		<a href="/user/customLogin">로그인</a>
	</sec:authorize>
	
	<!-- 회원 -->
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.consumer.cid" />님 환영합니다.
		<a href="/user/customLogout">로그아웃</a>
	</sec:authorize>
</body>
</html>