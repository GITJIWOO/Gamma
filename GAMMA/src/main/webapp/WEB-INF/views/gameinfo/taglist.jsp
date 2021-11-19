<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
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
	        	<span><a href="/user/naverLogin" class="loginA">로그인</a></span>
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
	   				<a href="/user/userGet">* 내정보</a><br/>
	   				<a href="/user/userPro">* 프로필</a>
	   				<a href="/friends/followerlist">* 팔로워리스트</a><br/>
	   				<a href="/friends/followinglist">* 팔로잉리스트</a><br/>
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

	<h1>태그별 게임목록</h1>
	<table class="table table-hover">
		<tr>
			<th>게임이름</th>
			<th>출시일</th>
			<th>가격</th>
			<th>태그</th>
		</tr>
		<c:forEach var="tagList" items="${tagList }">
		<c:if test="${tagList.gname != gvo.gname }">
			<tr>
				<td><a
					href="/gameInfo/get?gnum=${tagList.gnum }">
						${tagList.gname }</a></td>
				<td>${tagList.glaunch }</td>
				<td>${tagList.gprice }</td>
				<td>${tagList.tagname }</td>
			</tr>
			</c:if>
		</c:forEach>
	</table>
	
		<!-- carousel를 구성할 영역 설정 -->
			  <div style="width: 900px; height: 100px; " >
			    <div id="carousel-example-generic" class="carousel slide" >
			      <ol class="carousel-indicators">
			        <li data-target="#carousel-example-generic" data-slide-to="1" class="active"></li>
			        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
			        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
			      </ol>
			      <div class="carousel-inner" role="listbox">
			      
				   			<div class="item active">
			      <c:forEach var="listByTag" items="${listByTag }">
				      <c:if test="${listByTag.gname != gvo.gname }">
				   		<c:if test="${listByTag[0]}">
				   		</c:if>   
				      
			      
			      
			        
			        <a href="/gameInfo/get?gnum=${listByTag[0].gnum }">
			          <img src="${listByTag[0].gpicture }" style="width:100%; height: 250px;">
			          </a>
			          <div class="carousel-caption" style="color:red;">
			           ${listByTag[0].gname }
			          </div>
			        </c:if>
			      </c:forEach>
			        </div>
			        <div class="item">
			        <a href="/gameInfo/get?gnum=${listByTag[1].gnum }">
			          <img src="${listByTag[1].gpicture }" style="width:100%; height: 250px;">
			          </a>
			          <div class="carousel-caption" style="color:red;">
			          ${listByTag[1].gname }
			          </div>
			        </div>
			        
			        <div class="item">
			        <a href="/gameInfo/get?gnum=${listByTag[2].gnum }">
			          <img src="${listByTag[2].gpicture }" style="width:100%; height: 250px;">
			          </a>
			          <div class="carousel-caption" style="color:red;">
			          ${listByTag[2].gname }
			          </div>
			        </div>
			        
			        
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
	
	
	</div>
        </div>
        <div class="footer">
          <div class="footer-info">
            <div>CREATORS&nbsp;&nbsp;김영훈, 김지우, 조훈현, 최재인</div>
            <div>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</div>
            <div>
              CONTACT&nbsp;&nbsp;<a href="https://github.com/GITJIWOO"
                >https://github.com/GITJIWOO</a
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