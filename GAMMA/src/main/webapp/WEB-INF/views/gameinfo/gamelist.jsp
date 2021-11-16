<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gamma</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous"><!-- Bootstrap cdn 설정 -->	
<script src="<c:url value="/resources/js/main.js"/>"></script>
<link rel="stylesheet" href="/resources/css/styles.css" />
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<style type="text/css">
.content_list{
	padding-left: 150px;
	padding-top: 30px;
}
.search_list{
	
	padding-top: 50px;
}
.game_list{
	outline: 1px solid black;
	border: none;
	display: inline;  
	/*background: gray;*/
	
}
.gname{
	font-size: large;
	font-style: italic;
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
          <c:if test="${cid eq null }">
	          <div class="loginBtn">
	        	<span><a href="/user/userLogin" class="loginA">로그인</a></span>
	          </div>
	          <div class="joinBtn">
	        	<span><a href="/user/agreeJoin" class="joinA">가입하기</a></span>
	          </div>
       	  </c:if>
          <c:if test="${cid ne null}">
	          <div class="consumer">
	          	  <div class="consumer__imgPro">
			        <img class="conimg" src="/resources/css/image/chaIcon.png"/>
	          	  </div>
		          <div class="consumer__nickname">
		          	<p style="color:white;"><sec:authentication property="principal.consumer.nickname"/></p>
		          </div>
		          <div class="consumer__info">
	   				<a href="/user/userGet">* 유저정보창</a><br/>
	   				<a href="/user/userPro">* 유저프로필창</a><br/>
	   				<a href="/friends/followerlist">* 팔로워리스트</a><br/>
	   				<a href="/friends/followinglist">* 팔로윙리스트</a><br/>
	   				<a href="/friends/searchfriends">* 친구 검색</a><br/>
		   		  </div>
				  <form action="/user/userLogout" method="post">
					  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
					  <input class="logout" type="submit" value="로그아웃" />
				  </form>
	          </div>
          </c:if>
        </div>
      </div>
      <div class="main">
        <div class="contents">
          <div class="detail">
            <!-- 여기에 각자 content 붙여넣기 -->
	
	<h1>
		<a href="/gameInfo/gamelist"> 게임 목록</a>
	</h1>
	
	<div class="content_list">
		<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div class="row">
	 		<a href="/gameInfo/gameregister">
			<input type="button" value="게임등록" style="float: right;"></a>
		</div>
		</sec:authorize>
		<br>
	
		 <div class="container">
			 <c:forEach var="gameList" items="${gameList }">
				 <div class="game_list">
		 			<div class="row" id="ttt" onmouseover="mouseOver()" onmouseout=""
		 				style="cursor: pointer;" onclick="location.href='/gameInfo/get?gnum=${gameList.gnum }&pageNum=${btnMaker.cri.pageNum }&searchType=${btnMaker.cri.searchType}&keyword=${btnMaker.cri.keyword}';">
      					<div class="col-md-4" >
							<img src="${gameList.gpicture }"
							 width="300px" height="100px" />
						</div>
						<div class="col-md-5">
	      					<br><span class="gname">${gameList.gname }</span><br><br><br>
	      					${gameList.glaunch }
	      				</div>
	      				<div class="col-md-3" >
	      					₩&nbsp;${gameList.gprice }<br><br>
						</div>
      				</div>
      			</div>
      		</c:forEach>
    	</div> 
    	
    	
    	
		<c:set var = "cid" value = "${cid }"/>
		<c:if test="${fn:contains(cid, 'admin') }">	
    	<div class="search_list">
    	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">

			<!-- prev 버튼 
  	btnMaker의 prev가 true일떄만 뒤로가기 버튼 출력-->
  	
			<c:if test="${btnMaker.prev }">
				<li class="page-item"><a class="page-link"
					href="/gameInfo/gamelist?pageNum=${btnMaker.startPage -1 }&searchType=${btnMaker.cri.searchType}&keyword=${btnMaker.cri.keyword}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>

			<c:forEach var="pageNum" begin="${btnMaker.startPage }"
				end="${btnMaker.endPage }">
				<li
					class="page-item ${btnMaker.cri.pageNum == pageNum ? 'active' : ''}">
					<a class="page-link"
					href="/gameInfo/gamelist?pageNum=${pageNum }&searchType=${btnMaker.cri.searchType}&keyword=${btnMaker.cri.keyword}">${pageNum }</a>
				</li>
			</c:forEach>

			<!-- next 버튼 -->
			<c:if test="${btnMaker.next }">
				<li class="page-item"><a class="page-link"
					href="/gameInfo/gamelist?pageNum=${btnMaker.endPage + 1 }&searchType=${btnMaker.cri.searchType}&keyword=${btnMaker.cri.keyword}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>
			
		</ul>
	</nav>

			<form action="/gameInfo/gamelist" method="get" style="text-align: center;">
				<select name="searchType">
					<option value="n"
						<c:out value="${btnMaker.cri.searchType == null ? 'selected' : '' }"/>>
						-</option>
					<option value="n"
						<c:out value="${btnMaker.cri.searchType eq 'n' ? 'selected' : '' }"/>>
						이름</option>
					<option value="t"
						<c:out value="${btnMaker.cri.searchType eq 't' ? 'selected' : '' }"/>>
						태그</option>
					<option value="d"
						<c:out value="${btnMaker.cri.searchType eq 'd' ? 'selected' : '' }"/>>
						출시날짜</option>
				</select> <input type="text" name="keyword" placeholder="검색어 입력해라"
					value="${btnMaker.cri.keyword }"> <input type="submit"
					value="검색">
			</form>
		</div>
		</c:if>
    	
    	
    </div>
    
	  
	
		
	<script type="text/javascript">
		var result = "${success}";
		var gname = "${gname}";

		var myModal = new bootstrap.Modal(document.getElementById('myModal'), focus)
		console.log(result);
		console.log(gname);
		if (result === "success") {
			alert("게임이 삭제되었습니다");
		} else if (result === "register") {
			myModal.show();
		}
		
		function mouseOver() {
			var address = "${gvo.gaddress }";
    		ttt = document.getElemenById("ttt");
			ttt.write("<iframe width='600' height='500' src='" + address + "' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>");
		}
	
	</script>
	
	
	
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

<!-- 	<script>
		$(document).ready(function() {
			// 취소
			$(".loginBtn").on("click", function() {
				location.href = "/user/userLogin";
			})
			$(".joinBtn").on("click", function() {
				location.href = "/user/userJoin";
			})
			
			$(".consumer").mouseover(function(){
				$(".consumer__info").show();
			});

			$(".consumer").mouseout(function(){
				$(".consumer__info").hide();
			});
			
		});
    </script> -->
	
</body>
</html>