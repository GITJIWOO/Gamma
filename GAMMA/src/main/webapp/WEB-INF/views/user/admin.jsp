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
	<h2>admin</h2>
	<!-- CustomUserDetailService에서 받아오는 정보 -->
	<p>ConsumerVO: <sec:authentication property="principal.consumer" /></p>
	<p>사용자 아이디: <sec:authentication property="principal.consumer.cid" /></p>
	<p>사용자 닉네임: <sec:authentication property="principal.consumer.nickname" /></p>
	<p>사용자 권한목록: <sec:authentication property="principal.consumer.authList" /></p>
	<a href="/user/customLogout"><button>로그아웃</button></a>
</body>
</html>