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
    <h1>나를 팔로잉하는 친구 목록</h1>
    <a href="/friends/followerlist">팔로우한 친구</a>
    <a href="/friends/followinglist">팔로잉한 친구</a>
    <form action="/friends/followingremove" method="post">
      <table id="followingtbl">
      	<c:forEach items="${followingList }" var="followingList">
	        <tr>
	          <td>${followingList.cid }</td>
	          <!-- 현재 팔로잉된 상태이기 때문에 '삭제(default_white)'버튼만 있고 삭제되면 친구목록에서 삭제 -->
	          <td rowspan="2">
	          	  <input type="hidden" name="cid" value=""/><!-- 로그인 계정 -->
		          <input type="hidden" name="following" value="${followingList.cid }"/><!-- 로그인 계정이 팔로우 하는 계정 -->
	          	  <input type="submit" value="팔로워 삭제" />
	          </td>
	        </tr>
	        <tr>
	          <td>${followingList.nickname }</td>
	        </tr>
	     </c:forEach>
      </table>
    </form>
</body>
</html>