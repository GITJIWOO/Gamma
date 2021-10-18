<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="<c:url value="/resources/js/main.js"/>"></script>
<link rel="stylesheet" href="/resources/css/styles.css" />
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<title>Insert title here</title>
<style>
.detail{
  height: 300vh;
  width: 90%;
  margin: 0 auto;
}
.form-header {
  color: rgba(0, 0, 0, 0.8);
  font-size: 27px;
  font-weight: 600;
  padding: 20px 0 30px 0;
  border-bottom: 3px solid rgba(0, 0, 0, 0.8);
  margin-bottom: 30px;
}
.followlist {
  display: flex;
  align-items: center;
  margin:10px 0;
}
.followlist-id {
  display: flex;
  flex-direction: column;
  width:190px;
}
.followlist-id a {
  font-size: 20px;
  font-weight: 700;
  margin-bottom: 7px;
}
.followlist-img img {
  border-radius: 50%;
  margin-right: 20px;
}
.followlistBtn {
  display: flex;
}
.chatBtn {
  border: none;
  font-size: 17px;
  padding: 10px 20px;
  border-radius: 5px;
  background-color: var(--mainColor);
  color: white;
  top: 100px;
  left: 230px;
  z-index: 12;
  margin: 0 10px;
  cursor: pointer;
}
.unfollowBtn {
  border: none;
  color: black;
  font-size: 17px;
  padding: 10px 20px;
  border-radius: 5px;
  background-color: rgba(0, 0, 0, 0.1);
  cursor: pointer;
}
.chatBtn:hover {
  background-color: rgba(245, 109, 46, 0.9);
}
.unfollowBtn:hover {
  background-color: rgba(0, 0, 0, 0.2);
}
.page-item.active .page-link {
  background-color: var(--mainColor);
  border-color: var(--mainColor);
}
.page-link {
  color: black;
}

</style>
</head>
<body>
<!-- 
    <h1>내가 팔로우하는 친구 목록</h1>
    <a href="/friends/followerlist">팔로우한 친구</a>
    <a href="/friends/followinglist">팔로잉한 친구</a>
 -->
    <div class="display">
      <!-- side-bar -->
      <div class="side-bar">
        <!-- logo -->
        <div class="side-bar__row">
          <!-- 클릭하면 main화면으로 돌아오도록 a 태그 수정 -->
          <span
            ><a href="/main/main"><img src="/resources/css/image/logo.png" /></a
          ></span>
        </div>
        <!-- search -->
        <div class="side-bar__row">
          <form action="/gameInfo/gamelist" method="get">
          <select name="searchType" style="display:none">
            </select>
            <input type="text" placeholder="Search Game" name="keyword" value="${btnMaker.cri.keyword }"/>
            <!-- origin처럼 버튼 숨겼음, enter 치면 검색됨 -->
            <input type="submit" value="" />
          </form>
        </div>
        <!-- category -->
        <div class="side-bar__row">
          <span><a href="/gameInfo/gamelist">게임 스토어</a></span>
          	<span><a href="/library/conLibrary?cid=${cid }">라이브러리</a></span>
        </div>
        <!-- qna -->
        <div class="side-bar__row">
          <span><a href="/qna/questionlist">Q&A</a></span>
          &nbsp;&nbsp;|&nbsp;&nbsp;
          <span><a href="/qna/commonquestion">자주하는 질문</a></span>
        </div>
        <!-- about user -->
        <div class="side-bar__row">
          <!-- c:if로 로그인 전에는 회원가입+로그인 / 로그인 후에는 프로필 -->
	          <div class="consumer">
	          	  <div class="consumer__imgPro">
			        <img class="conimg" src="/resources/css/image/chaIcon.png"/>
	          	  </div>
		          <div class="consumer__nickname">
		          	<p>${cid}</p>
		          </div>
		          <div class="consumer__info">
	   				<a href="/user/userGet">* 유저정보창</a><br/>
	   				<a href="/user/userPro">* 유저프로필창</a><br/>
	   				<a href="/user/userLogout">* 로그아웃</a><br/>
	   				<a href="/friends/followerlist">* 팔로워리스트</a><br/>
	   				<a href="/friends/followinglist">* 팔로윙리스트</a><br/>
	   				<a href="/friends/searchfriends">* 친구 검색</a><br/>
		   		  </div>
	          </div>
        </div>
      </div>
      <div class="main">
        <div class="contents">
          <div class="detail">
          <!-- start -->
 <h1 class="form-header">내가 팔로우하는 친구</h1>

      	<c:forEach items="${followerList }" var="followerList">
      	  <div class="followlist">
           <div class="followlist-img">
      	      <img src="/resources/css/image/friends.png" width="100"/>
      	    </div>
            <div class="followlist-id">
	          <a href="/user/userPro?cid=${followerList.cid }">${followerList.cid }</a>
	          <span>(${followingList.nickname })</span>
                </div>
                <!-- 현재 팔로잉된 상태이기 때문에 '삭제(default_white)'버튼만 있고 삭제되면 친구목록에서 삭제 -->
                <div class="followlistBtn">
    			<form action="/main" method="post">
		          <input type="hidden" name="following" value="${param.cid }"/><!-- 로그인 계정 -->
		          <input type="hidden" name="follower" value="${followerList.cid }"/><!-- 로그인 계정이 팔로우 하는 계정 -->
		          <input class="chatBtn" type="submit" value="채팅"/>
			    </form>

	          <!-- 현재 팔로우 상태이기 때문에 '팔로잉(default_white)' -->

    			<form action="/friends/followerremove" method="post">    				
		          <input type="hidden" name="following" value="${cid }"/><!-- 로그인 계정이 팔로우 하는 계정 -->
		          <input type="hidden" name="follower" value="${followerList.cid }"/><!-- 로그인 계정이 팔로우 하는 계정 -->
		          <input class="unfollowBtn" type="submit" value="팔로우 취소" />
			    </form>
				</div>
			</div>
      	</c:forEach>

      <!-- 페이징 처리 
      ${page } -->
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
          </div>
        </div>
        <div class="footer">
          <div class="footer-info">
            <div>CREATORS&nbsp;&nbsp;김영훈, 김지우, 조훈현, 최재인</div>
            <div>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</div>
            <div>
              CONTACT&nbsp;&nbsp;<a href="https://github.com/GITJIWOO/Game-Project"
                >https://github.com/GITJIWOO/Game-Project</a
              >
            </div>
          </div>
          <div class="footer-copyright">
            <div>Copyright © GAMMA All right reserved.</div>
          </div>
        </div>
      </div>
    </div>
</body>
</html>