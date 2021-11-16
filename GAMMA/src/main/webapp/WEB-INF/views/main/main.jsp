<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gamma</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous"><!-- Bootstrap cdn 설정 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>	
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">	
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">	
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="<c:url value="/resources/js/main.js"/>"></script>
<link rel="stylesheet" href="/resources/css/styles.css" />
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
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
            <!-- carousel를 구성할 영역 설정 -->
			  <div style="width: 1370px; height: 500px; margin-left: 10px;" >
			    <div id="carousel-example-generic" class="carousel slide" >
			      <ol class="carousel-indicators">
			        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
			        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
			      </ol>
			      <div class="carousel-inner" role="listbox">
			      
			        
			        <c:forEach var="latestGame" items="${latestGame }" varStatus="status">
				      		<c:if test="${status.count eq 1 }">
				      			<div class="item active">
				        			<a href="/gameInfo/get?gnum=${latestGame.gnum }">
				          				<img src="${latestGame.gpicture }" style="width:100%; height: 400px;">
				          			</a>
				          			<div class="carousel-caption" style="color:red;">
			          				${latestGame.gname }
			          				</div>
				        	  	<div class="carousel-caption" style="color:white;">
			          				${latestGame.gname }
			          			</div>
				        		</div>
				      		</c:if>
				      	
				        	<c:if test="${status.count ne 1 }">
				        		<div class="item">
				        			<a href="/gameInfo/get?gnum=${latestGame.gnum }">
				          				<img src="${latestGame.gpicture }" style="width:100%; height: 400px;">
				          			</a>
				          			<div class="carousel-caption" style="color:red;">
			          				${latestGame.gname }
			          				</div>
				          		<div class="carousel-caption" style="color:white;">
			          			${latestGame.gname }
			          			</div>
				        		</div>
				        	</c:if>
				      </c:forEach>
			        
			        
			      </div>
			      <!-- 왼쪽 화살표 버튼 -->
			      <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			        <!-- 왼쪽 화살표 -->
			        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			      </a>
			      <!-- 오른쪽 화살표 버튼 -->
			      <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			        <!-- 오른쪽 화살표 -->
			        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			      </a>
			    </div>
			  </div>
			  <script>
			    $(function(){
			      $('#carousel-example-generic').carousel({
			        interval: 2000,	// 슬리아드 자동 순환 지연 시간 false는 자동순환x
			        
			        pause: "hover",	// hover 설정시 마우스를 가져대면 자동 순환 정지
			        wrap: true,
			        keyboard : true	// 키보드로 조작가능 tab
				  });
				});
			  </script>
			  
				<hr>
			  <h2>오늘의 게임</h2>
			  <hr>
			  <table>
			  <tr>
			  <c:forEach var="randomList" items="${randomList }">
			    <td>
			    <a href="/gameInfo/get?gnum=${randomList.gnum }">	
			    <img src="${randomList.gpicture }" width="300px" height="300px"/>
			    </a>
			    </td>
			 </c:forEach>
			  <tr>
			</table>
			
			<hr>
			  <h2>추천게임</h2>
			  <hr>
			  <table>
			  <tr>
			  <c:forEach var="actionList" items="${actionList }">
			    <td>
			    <a href="/gameInfo/get?gnum=${actionList.gnum }">	
			    <img src="${actionList.gpicture }" width="300px" height="300px"/>
			    </a>
			    </td>
			  </c:forEach>
			  <tr>
			</table>
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