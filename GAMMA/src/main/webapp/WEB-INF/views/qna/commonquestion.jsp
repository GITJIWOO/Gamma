<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<c:url value="/resources/js/main.js"/>"></script>
<link rel="stylesheet" href="/resources/css/styles.css" />
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<title>Insert title here</title>
<style>
.detail {
  color: black;
}
.detail a {
  color: #8bd1e9;
  font-weight: 800;
}
.contents-header {
  display: flex;
  flex-direction: column;
  align-items: center;
  font-weight: lighter;
}
.contents-header h1 {
  margin: 40px 0;
  font-size: 35px;
}
.contents-header h2 {
  margin-bottom: 40px;
  font-size: 20px;
}
.contents-main {
  display: flex;
  flex-direction: column;
  text-align: justify;
  width: 60%;
  margin: 0 auto;
  font-size: 18px;
}
.contents-main i {
  margin-right: 5px;
}
.topic {
  cursor: pointer;
  font-size: 20px;
  margin: 30px 0;
}
.topic-detail {
  line-height: 25px;
  padding: 0 10px;
  margin-bottom: 20px;
}
.fa-chevron-right {
  transition: color 0.3s ease-in;
  color: lightgray;
}
.hover {
  color: inherit;
}
.hidden {
  display: none;
}
.black {
  color: black;
}
.contents-footer {
  display: flex;
  flex-direction: column;
  margin: 20px;
  align-items: center;
  margin: 100px 0;
}
.contents-footer h2 {
  font-size: 30px;
  margin-bottom: 40px;
}
.contents-footer p {
  font-size: 17px;
}
.fa-chevron-down {
  color: #33c681;
}
.fa-check {
  color: #33c681;
}
.select {
  font-weight: 900;
  font-size: 23px;
}

</style>
<script
  src="https://kit.fontawesome.com/62b1f47417.js"
  crossorigin="anonymous"
></script>
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
	   				<a href="/user/userGet">* 유저정보창</a><br/>
	   				<a href="/user/userpro">* 유저프로필창</a><br/>
	   				<a href="/user/userLogout">* 로그아웃</a><br/>
	   				<a href="/user/userDelete">* 회원탈퇴</a><br/>
		   		  </div>
	          </div>
          </c:if>
        </div>
      </div>
      <div class="main">
        <div class="contents">
          <div class="detail">
            <!-- start -->
            <div class="contents-header">
              <h1>우수한 고객 서비스</h1>
              <h2>
                도움이 필요하신가요? 고객 지원 전문가가 여러분을 도와드립니다.
              </h2>
            </div>
            <div class="contents-main">
              <h4
                class="topic"
                onclick="openDetail(0)"
                onmouseover="fadeIn(0)"
                onmouseout="fadeIn(0)"
              >
                <i class="fas fa-chevron-right"></i>
                Gamma에서는 어떤 종류의 게임을 다운로드하여 플레이할 수 있나요?
              </h4>
              <p class="topic-detail">
                Gamma는 Battlefield, FIFA, The Sims, The Witcher, Assassin's
                Creed 등의 수많은 게임을 제공합니다. 어드벤처, 웅장한
                멀티플레이어 전투, 또는 가벼운 재미를 원하든 상관없습니다.
                여기에는 언제나 모두가 찾는 무언가가 있습니다. 왼쪽에 있는 검색
                탭을 눌러 어떤 게임이 있는지 알아보세요.
              </p>
              <h4
                class="topic"
                onclick="openDetail(1)"
                onmouseover="fadeIn(1)"
                onmouseout="fadeIn(1)"
              >
                <i class="fas fa-chevron-right"></i>
                Gamma는 어떤 운영체제에서 사용할 수 있나요?
              </h4>
              <p class="topic-detail">
                Gamma는 모든 운영체제에서 이용할 수 있습니다. 한 플랫폼에서
                게임을 구매하면 자동으로 다른 플랫폼에서도 플레이할 수 있습니다.
              </p>
              <h4
                class="topic"
                onclick="openDetail(2)"
                onmouseover="fadeIn(2)"
                onmouseout="fadeIn(2)"
              >
                <i class="fas fa-chevron-right"></i>
                Gamma 계정을 만드려면 어떻게 해야 하나요?
              </h4>
              <p class="topic-detail">
                <!-- url 수정 -->
                <a href="">여기</a>로 이동해 계정을 만들고 게임을
                플레이해보세요.
              </p>
              <h4
                class="topic"
                onclick="openDetail(3)"
                onmouseover="fadeIn(3)"
                onmouseout="fadeIn(3)"
              >
                <i class="fas fa-chevron-right"></i>
                Gamma에서 구입한 게임을 반품할 수 있나요?
              </h4>
              <p class="topic-detail">
                구입한 게임이 조금이라도 마음에 들지 않는다면
                <!-- url 수정 -->
                <a href="#">여기</a>로 이동해 직접 문의해주세요. 게임 보증
                정책에 참여하는 게임에 한해서는 전액 환불받을 수 있습니다.
              </p>
              <h4
                class="topic"
                onclick="openDetail(4)"
                onmouseover="fadeIn(4)"
                onmouseout="fadeIn(4)"
              >
                <i class="fas fa-chevron-right"></i>
                오프라인 상태에서 Gamma를 이용해 게임을 할 수 있나요?
              </h4>
              <p class="topic-detail">
                그렇습니다! 처음 게임을 시작할 때 온라인에 접속해 있어야
                작동하는 데 오류가 있는지 확인할 수 있습니다. 그러나 이후에는
                대부분의 싱글플레이어 게임을 오프라인에서 즐길 수 있습니다.
                무인도에 있더라도 게임을 즐길 수 있죠. 전원 코드를 연결할 수만
                있다면요.
              </p>
            </div>
            <div class="contents-footer">
              <h2>질문이 더 있나요?</h2>
              <p>
                <i class="fas fa-check"></i>
                &nbsp;
                <!-- QnA url작성 -->
                <a href="#">여기</a>를 눌러 주제를 선택하고 언제든지 지원팀에게
                직접 도움을 요청할 수 있습니다.
              </p>
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
    <script>
      const title = document.querySelectorAll(".contents-main .topic");
      const para = document.querySelectorAll(".contents-main .topic-detail");
      const right = document.querySelectorAll(
        ".contents-main .fa-chevron-right"
      );
      let num;
      for (num = 0; num < para.length; num++) {
        para[num].classList.add("hidden");
      }

      let no;
      function openDetail(no) {
        title[no].classList.toggle("black");
        title[no].classList.toggle("select");
        para[no].classList.toggle("hidden");
        if (right[no].classList.contains("fa-chevron-right")) {
          right[no].classList.remove("fa-chevron-right");
          right[no].classList.add("fa-chevron-down");
        } else {
          right[no].classList.remove("fa-chevron-down");
          right[no].classList.add("fa-chevron-right");
        }
      }
      function fadeIn(no) {
        right[no].classList.toggle("hover");
      }
      title[1].addEventListener("click", openDetail);
      title[1].addEventListener("mouseover", fadeIn);
      right[1].addEventListener("mouseover", fadeIn);
      title[1].addEventListener("mouseout", fadeIn);
      right[1].addEventListener("mouseout", fadeIn);
    </script>
</body>
</html>