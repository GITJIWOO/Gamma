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
    <h1>내가 팔로우하는 친구 목록</h1>
    <a href="/friends/followerlist">팔로우한 친구</a>
    <a href="/friends/followinglist">팔로잉한 친구</a>
    <form action="/friends/followerremove" method="post">
      <table border="1" id="followertbl">
      	<c:forEach items="${followerList }" var="followerList">
	        <tr>
	          <td>${followerList.cid }</td>
	          <!-- 현재 팔로우 상태이기 때문에 '팔로잉(default_white)' -->
	          <td rowspan="2">
		          <input type="hidden" name="cid" value=""/><!-- 로그인 계정 -->
		          <input type="hidden" name="follower" value="${followerList.cid }"/><!-- 로그인 계정이 팔로우 하는 계정 -->
		          <input type="submit" value="팔로잉" id="btnFollower"/>
	          </td>
	        </tr>
	        <tr>
	          <td>${followerList.nickname }</td>
	        </tr>
      	</c:forEach>
      </table>
    </form>
</body>
</html>