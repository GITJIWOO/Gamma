<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
    <h1>내가 팔로우하는 친구 목록</h1>
    <a href="/friends/followerlist">팔로우한 친구</a>
    <a href="/friends/followinglist">팔로잉한 친구</a>
      <table border="1" id="followertbl">
      	<c:forEach items="${followerList }" var="followerList">
	        <tr>
	          <td><a href="/user/userPro?cid=${followerList.cid }">${followerList.cid }</a></td>
	          <!-- 현재 팔로우 상태이기 때문에 '팔로잉(default_white)' -->
	          <td rowspan="2">
    			<form action="/friends/followerremove" method="post">    				
		          <input type="hidden" name="following" value="${cid }"/><!-- 로그인 계정이 팔로우 하는 계정 -->
		          <input type="hidden" name="follower" value="${followerList.cid }"/><!-- 로그인 계정이 팔로우 하는 계정 -->
		          <input type="submit" value="팔로우 취소" />
			    </form>
	          </td>
	          <td rowspan="2">
    			<form action="/main" method="post">
		          <input type="hidden" name="following" value="${param.cid }"/><!-- 로그인 계정 -->
		          <input type="hidden" name="follower" value="${followerList.cid }"/><!-- 로그인 계정이 팔로우 하는 계정 -->
		          <input type="submit" value="채팅"/>
			    </form>
	          </td>
	        </tr>
	        <tr>
	          <td>${followerList.nickname }</td>
	        </tr>
      	</c:forEach>
      </table>
      <!-- 페이징 처리 -->
      ${page }
      <nav aria-label="...">
	  <ul class="pagination justify-content-center">
	  	<c:if test="${page.prev }">
		    <li class="page-item">
		      <a class="page-link" href="/friends/followerlist?pageNum=${page.startPage - 1 }">Previous</a>
		    </li>
		</c:if>
		<c:forEach var="pageNum" begin="${page.startPage }" end="${page.endPage }">
		    <li class="page-item ${page.cri.pageNum == pageNum ? 'active' : '' }">
		    	<a class="page-link"href="/friends/followerlist?pageNum=${pageNum }">${pageNum }</a>
		    </li>
		</c:forEach>
		<c:if test="${page.next }">
		    <li class="page-item">
		      <a class="page-link" href="/friends/followerlist?pageNum=${page.endPage + 1 }">Next</a>
		    </li>
		</c:if>
	  </ul>	
      </nav>
</body>
</html>