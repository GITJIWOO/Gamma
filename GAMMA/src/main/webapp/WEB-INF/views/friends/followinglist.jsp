<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>나를 팔로잉하는 친구 목록</h1>
    <a href="/friends/followerlist">팔로우한 친구</a>
    <a href="/friends/followinglist">팔로잉한 친구</a>
      <table id="followingtbl">
      	<c:forEach items="${followingList }" var="followingList">
	        <tr>
	          <td>${followingList.cid }</td>
	          <!-- 현재 팔로잉된 상태이기 때문에 '삭제(default_white)'버튼만 있고 삭제되면 친구목록에서 삭제 -->
	          <td rowspan="2">
			    <form action="/friends/followingremove" method="post">
	          	  <input type="hidden" name="cid" value="${param.cid }"/><!-- 로그인 계정 -->
		          <input type="hidden" name="following" value="${followingList.cid }"/><!-- 로그인 계정이 팔로우 하는 계정 -->
	          	  <input type="submit" value="팔로워 삭제" />
			    </form>
	          </td>
	          <td rowspan="2">
			    <form action="/main" method="post">
	          	  <input type="hidden" name="follower" value="${param.cid }"/><!-- 로그인 계정 -->
		          <input type="hidden" name="following" value="${followingList.cid }"/><!-- 로그인 계정이 팔로우 하는 계정 -->
	          	  <input type="submit" value="채팅" />
			    </form>
	          </td>
	        </tr>
	        <tr>
	          <td>${followingList.nickname }</td>
	        </tr>
	     </c:forEach>
      </table>
      <script>
		const result = ${unfollow};
		const unfollowing = ${following};
		if(result === "undollow"){
			alert("팔로워 " + unfollower + "님을 삭제했습니다.");
		}
	  </script>
</body>
</html>