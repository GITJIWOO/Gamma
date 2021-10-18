<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/styles.css" />
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<style>
	.consumer {
		width: 18%;
		position: relative;
		text-align: center;
		height: 10%;
		buttom: 100;
	}
	.consumer__imgPro {
		float: left;
		padding: 0;
		margin: 0;
	}
	.conimg {
		width: 100px;
		height: 100px;
	}
	.consumer__nickname {
		float: right;
		font-size: 25px;
		font-weight: bold;
		color: white;
	}
	.consumer__info {
		display: none;
		position: absolute;
		left: 100%;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="display">
      <!-- side-bar -->
      <div class="side-bar">
        <!-- logo -->
        <div class="side-bar__row">
          <!-- 클릭하면 main화면으로 돌아오도록 a 태그 수정 -->
          <span
            ><a href="#"><img src="/resources/css/image/logo.png" /></a
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
            <input type="text" name="keyword" placeholder="Search Game"value="${btnMaker.cri.keyword }" />
            <!-- origin처럼 버튼 숨겼음, enter 치면 검색됨 -->
            <input type="submit" value="" />
          </form>
        </div>
        <!-- category -->
        <div class="side-bar__row">
          <span><a href="#">게임 스토어</a></span>
          <span><a href="#">라이브러리</a></span>
        </div>
        <!-- qna -->
        <div class="side-bar__row">
          <span><a href="#">Q&A</a></span>
          &nbsp;&nbsp;|&nbsp;&nbsp;
          <span><a href="#">자주하는 질문</a></span>
        </div>
        <!-- about user -->
        <div class="side-bar__row">
          <!-- c:if로 로그인 전에는 회원가입+로그인 / 로그인 후에는 프로필 -->
          <span><a href="#">로그인</a></span>
          <span><a href="#">가입하기</a></span>
          <!--
        <span>
          <a href="#"><button class="profile">Profile</button></a>
        </span>
        --></div>
      </div>
      <div class="main">
        <div class="contents">
          <div class="detail">

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