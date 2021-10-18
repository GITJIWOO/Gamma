<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="<c:url value="/resources/js/main.js"/>"></script>
<link rel="stylesheet" href="/resources/css/styles.css" />
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<title>${game.gname} 리뷰</title>
<style>
	.detail {
		padding: 30px;
	}
	.card {
		background-color: gainsboro;
		border: 1px solid white;
		margin: 15px;
		padding: 1px;
		height: auto;
		float: left;
	}
	
	a:hover {
		color: dimgray;
	}
	.link {
		margin-bottom: 10px;
	}
	.gameTitle {
		font-size: 180%;
		color: black;
	}
	.reviewLink {
		font-size: 120%;
		color: black;
	}
	.option {
		background-color: darkgray;
	}
</style>
</head>
<body>
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
          	<option  value="n"
				<c:out value="${btnMaker.cri.searchType eq 'n' ? 'selected' : '' }"/>>
				</option>
            </select>
            <input type="text" placeholder="Search Game" name="keyword" value="${btnMaker.cri.keyword }"/>
            <!-- origin처럼 버튼 숨겼음, enter 치면 검색됨 -->
            <input type="submit" value="" />
          </form>
        </div>
        <!-- category -->
        <div class="side-bar__row">
          <span><a href="/gameInfo/gamelist">게임 스토어</a></span>
          <c:if test="${cid ne null}">
          	<span><a href="/library/conLibrary?cid=${cid}">라이브러리</a></span>
          </c:if>
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
          <c:if test="${cid eq null}">
            <div class="loginBtn">
		        <span><a href="/user/userLogin" class="loginA">로그인</a></span>
            </div>
            <div class="joinBtn">
		        <span><a href="/user/userJoin" class="joinA">가입하기</a></span>
            </div>
          </c:if>
          <c:if test="${cid ne null}">
	          <div class="consumer">
	          	  <div class="consumer__imgPro">
			        <img class="conimg" src="/resources/css/image/chaIcon.png"/>
	          	  </div>
		          <div class="consumer__nickname">
		          	<p>${cid}</p>
		          </div>
		          <div class="consumer__info">
	   				<a href="/user/userGet">유저정보창</a>
	   				<a href="/user/userLogout">로그아웃</a>
		   		  </div>
	          </div>
          </c:if>
        </div>
      </div>
      <div class="main">
        <div class="contents">
          <div class="detail">
            <!-- 여기에 각자 content 붙여넣기 -->
			<div class="link">
				<a href="/gameInfo/get?gnum=${game.gnum}" class="gameTitle">${game.gname}</a>
				> <a href="/review/reviewList/${game.gnum}" class="reviewLink">리뷰</a>
			</div>
			<div class="option">
				<form action="/review/reviewList/${game.gnum}" method="get">
					<select name="listKind">
						<option value="" selected>정렬 기준</option>
						<option value="famous">인기 순</option>
						<option value="new">최신 순</option>
					</select>
					<input type="submit" value="적용">
				</form>
			</div>
			<div id="review row">
				<c:forEach var="review" items="${review}">
					<div class="reviewCard col-md-5">
						<div class="card" data-grnum="${review.grnum}">
							<div class="card-header">
								${review.cid}
							</div>
							<div class="card-body">
								<h5 class="card-title">
									<c:choose>
										<c:when test="${review.grlike == 1}"><i class="fas fa-thumbs-up fa-2x"></i> 추천</c:when>
										<c:when test="${review.grlike == 0}"><i class="fas fa-thumbs-down fa-2x"></i> 비추천</c:when>
									</c:choose></h5>
							    <p class="card-text">
							    	${review.grdate}<br/>
							    	<strong>${review.grcontent}</strong><br/>
							    	${review.grrecommend}
							    </p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
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
	<!-- font-awesome code kit -->
	<script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
</body>
<script>
	$(".reviewCard").on("click", ".card", function(e){
		let reviewCard = $(this);
		let grnum = parseInt(reviewCard.attr("data-grnum"));
		location.href = "/review/reviewDetail/" + grnum;
	});
	
	$(".reviewCard").on("mouseover", ".card", function(){
		$(this).css("border", "1px solid dodgerblue");
	});
	$(".reviewCard").on("mouseout", ".card", function(){
		$(this).css("border", "1px solid white");
	});
</script>
</html>