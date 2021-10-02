<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	li {list-style: none; display:inline; padding: 6px;}
</style>
<meta charset="UTF-8">
<title>로그인 여부에 따른 메세지</title>
</head>
<body>
<ul>
	<li><a href="/board/?">목록</a></li>
	<li><a href="/board/?">글 작성</a></li>
	<li>
		<c:if test="${member != null}"><a href="/user/userLogout">로그아웃</a></c:if>
		<c:if test="${member == null}"><a href="/user/userLogin">로그인</a></c:if>
		<c:if test="${member != null}"><a href="/user/userModify">유저수정</a></c:if>
		<c:if test="${member != null}"><a href="/user/userDelete">탈퇴</a></c:if>
		<c:if test="${member != null}"><a href="/user/userGet">상세창</a></c:if>
		
	</li>
	<li>
		<c:if test="${member != null}">
			<p>${member.cid}님 안녕하세요.</p>
		</c:if>
	</li>
</ul>

</body>
</html>