<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/styles.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.detail{
  height: 300vh;
  width: 90%;
  margin: 0 auto;
}
.hidden {
  display: none;
}
.searchresult {
  display: flex;
  align-items: flex-end;
  margin-top: 20px;
}
.searchresult h1 {
  font-size: 30px;
}
.searchresult h2 {
  font-size: 19px;
}
.searchfriendsdiv input[type="text"] {
  margin: 20px 0;
  padding: 15px;
  font-size: large;
  border-radius: 50px;
  border: none;
  width: 400px;
}
.searchfriendsdiv input:not([type="text"]) {
  display: none;
}
.userList {
  position: relative;
  z-index: 9;
  border-radius: 1px solid black;
  width: 700px;
}
.background {
  position: absolute;
  width: 100%;
  height: 77%;
  opacity: 70%;
  z-index: 11;
  background-color: black;
}
.userList:nth-child(odd) {
  float: left;
}
.userList:nth-child(even) {
  float: right;
}
.userList__pro {
  position: absolute;
  z-index: 10;
  top: 25px;
  left: 240px;
}
.userList__pro img {
  border-radius: 50%;
}
.userList__proBack {
  filter: brightness(40%) opacity(50%) blur(1px);
  border: 1px solid black;
}
.userList__proBack img {
  z-index: -1;
}
.userList__cid {
  padding: 30px 10px;
  background-color: white;
}
.profileBtn {
  position: absolute;
  border: none;
  font-size: 17px;
  padding: 13px 70px;
  border-radius: 5px;
  background-color: var(--mainColor);
  color: white;
  top: 100px;
  left: 230px;
  z-index: 12;
}
.profileBtn:hover{
  background-color: rgba(245, 109, 46, 0.8);
  cursor: pointer;
}
.notyet {
  display: none;
}
.page-item.active .page-link {
  background-color: var(--mainColor);
  border-color: var(--mainColor);
}
.page-link {
  color: black;
}
</style>
<script>
/*
	// infinite scroll 미룸
	window.onload = function (){
		const endPage = ${page.endPage};
		function aboutScroll() {
	        const pagination = document.querySelector(".pagination");
	        const fullContent = document.querySelector(".infinite");
	        // 스크린 크기
	        const screenHeight = document.body.offsetHeight;
	        console.log("스크린 크기는: " + screenHeight);
	        // 바닥에 닿는걸 감지하는 변수
	        let oneTime = false;
	        console.log("false 면 바닥에 닿지 않음: " + oneTime);
	        document.addEventListener('scroll', function () {
	          // .infinite 높이
	          const fullHeight = window.innerHeight;
	          //log.info("infinite 높이는: " + fullHeight);
	          // 스크롤 위치
	          const scrollPosition = pageYOffset;
	          //log.info("스크롤 위치는: " + scrollPostion);
	          if (fullHeight - screenHeight / 2 <= scrollPosition && !oneTime) {
	            // 바닥에 닿으면 true로 변경해 nextScroll() 한번만 호출
	            oneTime = true;
	            console.log("true 면 바닥에 닿음: " + oneTime);
	            // 다음 페이지를 불러오는 함수
	            makeUserList();
	          }
	        });

	        const nextPage = pagination.querySelector(".nextPage");
	        const nextLink = nextPage.getAttribute("href");
	        console.log("href확인: " + nextLink);
	        function makeUserList(){
	        	const xhr = new XMLHttpRequest();
	        	console.log("xhr이란?: " + xhr)
	            xhr.onreadystatechange = function () {
	              if (xhr.readyState === xhr.DONE) {
	                if (xhr.status === 200 || xhr.status === 201) {
	                	// 다음 페이지의 정보
	                    const data = xhr.response;
	                    // 다음 페이지에서 .list를 얻음
	                    const addList = data.querySelector(".userList");
	                    // .infinite에 list 추가
	                    fullContent.appendChild(addList);
	                    // nextScroll()을 다시 불러올수 있도록 false로 변경
	                    oneTime = false;
	                    /*
	                  	*** 해결해야되는거 ***
	                  	스크롤 무한생성은 됨 
	                  	jstl과의 문제인것 같음.. c:forEach를 인식못하는것같기도하고...
	                  	1. 다음 페이지를 불러와야되는데 그러려면 스크롤이 내려갔을 때, 현재페이지가 1-2-3 이렇게 변경되야함
	                  	2. 리스트를 10개씩 불러와야하는데 하나를 여러번 불러오고 있음 
	                    */
/*
	                    if(typeof(history.pushState) == 'function'){                    
	                    	console.log("진입!");
	                    	let currentUrl = location.href;
		                    console.log("현재 url 확인: " + currentUrl);
		                    let currentPage = ${page.cri.pageNum };
		                    console.log("현재페이지 확인: " + currentPage);
		                    const endPage = ${page.endPage };
		                    console.log("마지막페이지 확인: " + endPage);
		                    if(currentPage <= endPage){
		                    	currentUrl = currentUrl.replace(/\&pageNum=([0-9]+)/ig,'');
		                    	currentUrl += '&pageNum=' + (currentPage + 1);
		                    	history.pushState(null, null, currentUrl);
		                    	return;
	                    	};
	                    }
	                }else {
	                    console.error(xhr.reponse);
	                }
	              }
	            };
	            xhr.open("GET", nextPage);
	            xhr.send();
	            xhr.responseType = "document";
	        }	        
	      }
	      aboutScroll();
	}
*/
</script>
<body>
<!-- 
		criteria 정보 확인: ${page }<br>
		page 확인: ${page.cri.pageNum }<br>
		시작페이지: ${page.startPage }<br>
		끝페이지: ${page.endPage }<br>
		keyword 확인: ${page.cri.keyword }<br>
		parameter로 넘어온 cid 확인: ${param.cid }<br>
 -->
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
          <form action="#" method="get">
            <input type="text" placeholder="   Search Game" />
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
          -->
        </div>
      </div>
      <div class="main">
        <div class="contents">
          <div class="detail">
	<div class="searchresult">
	<h1>검색</h1>	
	<h2 class="searchtotal hidden">(${page.total })</h2>
	</div>
	<div class="searchfriendsdiv">
	<form action="/friends/searchfriends?cid=${param.cid }&keyword=${page.cri.keyword }">
		<input class="searchfriendsinput" type="text" name="keyword" value="${page.cri.keyword }" placeholder="닉네임 또는 아이디로 친구 검색"/>
		<input type="hidden" name="cid" value="${param.cid }" />
		<input type="submit" value="검색"/>
	</form>
	</div>
	<!-- 처음에는 비어있다가 검색하면 나타나도록 작성 -->
	<div class="infinite hidden">
		<c:forEach items="${userList }" var="userList">
			<div class="userList" onmouseover="showProfile()" onmouseout="showProfile()">
				<div class="background notyet"></div>
				<div class="userList__pro"><img src="/resources/css/image/friends.png" width="200"/></div>
				<div class="userList__proBack"><img src="/resources/css/image/friends.png" width="700" height="250"/></div>
				<div class="userList__cid">${userList.cid }(${userList.nickname })</div>
				<!-- 해당 유저 프로필로 이동하고 거기서 친구 추가 혹은 삭제 로직 진행, url 바꾸면서 아래 hidden 삭제 예정 -->
				<form action="/user/userGet" method="get">
					<input type="hidden" name="following" value="${param.cid }" />
					<input type="hidden" name="follower" value="${userList.cid }" />
					<input class="profileBtn notyet" type="submit" value="프로필 보기" />
				</form>
			</div>
		</c:forEach>
	</div>
	<nav class="pageList hidden" aria-label="...">
	<div class="pagination justify-content-center">
	 <c:if test="${page.prev }">
	 	<li class="page-item">
	 		<a class="page-link" href="/friends/searchfriends?cid=${param.cid }&pageNum=${page.startPage - 1 }&keyword=${page.cri.keyword }">이전</a>
	 	</li>
	 </c:if>
	 <c:forEach var="pageNum" begin="${page.startPage }" end="${page.endPage }">
	 	<li class="page-item ${page.cri.pageNum == pageNum ? 'active' : '' }">
			<a class="page-link" href="/friends/searchfriends?cid=${param.cid }&pageNum=${pageNum }&keyword=${page.cri.keyword }">${pageNum }</a>
		</li>	
	 </c:forEach>
	 	 <c:if test="${page.next }">
	 	<li class="page-item">
	 		<a class="page-link" href="/friends/searchfriends?cid=${param.cid }&pageNum=${page.endPage + 1 }&keyword=${page.cri.keyword }">다음</a>
	 	</li>
	 </c:if>
	</div>
	</nav>
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
    <script>

	// 처음에는 안보이다가 검색하면 나타나도록 작성
	const input = document.querySelector(".searchfriendsinput");
	const searchtotal = document.querySelector(".searchtotal");
	let keyword = input.getAttribute("value");
	console.log(keyword);
	if(keyword != ""){
		const infinite = document.querySelector(".infinite");
		const pageList = document.querySelector(".pageList");
		console.log("pageList 확인: " + pageList);
		infinite.classList.remove("hidden");
		pageList.classList.remove("hidden");
		searchtotal.classList.remove("hidden");
	}
	
    let num;
    const total = ${page.total };
	const userList = document.querySelectorAll(".userList");
	console.log(userList[0])
    for(num = 0; num < total; num++){
		if(userList[num]){
			//userList.setAttribute("onmouseover", "showProfile(num)")
			//userList.setAttribute("onmouseout", "showProfile(num)")
		}
    }
    const showBtn = document.querySelector(".profileBtn");
    const backGround = document.querySelector(".background");
    console.log(showBtn);
    console.log(backGround);
    function showProfile(num) {
      showBtn.classList.toggle("notyet");
      backGround.classList.toggle("notyet");
    }
    const detail = document.querySelector(".detail");
    //	userList[num].addEventListener("mouseover", showProfile);
    //	userList[num].addEventListener("mouseout", showProfile);
  </script>
</body>
</html>