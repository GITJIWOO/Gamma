<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>친구 검색</h1>
	<form>
		<input type="text" name="keyword" value="${keyword }" placeholder="닉네임 또는 아이디로 친구 검색"/>
		<input type="submit" value="검색"/>
	</form>
	<!-- 처음에는 비어있다가 검색하면 나타나도록 작성 -->
	<table>
		<c:forEach items="${userList }" var="userList">
			<tr>
				<td>${userList.cid }</td>
				<td>${userList.nickname }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>