<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.hidden{
		display: none;
	}
/*
	.userList{
		background-color: thistle;
		padding: 30px;
	}
*/
</style>
<script>
/*
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
	                  	jstl과의 문제인것 같음.. c:forEach를 인식못하는것같기도하고...
	                  	1. 다음 페이지를 불러와야되는데 그러려면 스크롤이 내려갔을 때, 현재페이지가 1-2-3 이렇게 변경되야함
	                  	2. 리스트를 10개씩 불러와야하는데 하나를 여러번 불러오고 있음 
	                    */
/*
				        const url = "/friends/searchfriends?cid=${param.cid }&pageNum=${pageNum + 1}";
				        const nnextLink = nextPage.setAttribute("href", url);
				        console.log("다다음페이지확인: " + nnextLink);
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
	<h1>친구 검색</h1>
		criteria 정보 확인: ${page }<br>
		page 확인: ${page.cri.pageNum }<br>
		시작페이지: ${page.startPage }<br>
		끝페이지: ${page.endPage }<br>
		keyword 확인: ${page.cri.keyword }<br>
		parameter로 넘어온 cid 확인: ${param.cid }<br>
	<form action="/friends/searchfriends?cid=${param.cid }&keyword=${page.cri.keyword }">
		<input class="input" type="text" name="keyword" value="${page.cri.keyword }" placeholder="닉네임 또는 아이디로 친구 검색"/>
		<input type="submit" value="검색"/>
	</form>
	<!-- 처음에는 비어있다가 검색하면 나타나도록 작성 -->
	<div class="infinite hidden">
		<c:forEach items="${userList }" var="userList">
			<div class="userList">
				<div class="userList__cid">${userList.cid }</div>
				<div class="userList__nick">${userList.nickname }</div>
				<form action="/friends/addfriends" method="post">
					<input type="hidden" name="cid" value="${param.cid }" />
					<input type="hidden" name="pageNum" value="${page.cri.pageNum }" />
					<input type="hidden" name="keyword" value="${page.cri.keyword }" />
					<input type="hidden" name="following" value="${param.cid }" />
					<input type="hidden" name="follower" value="${userList.cid }" />
					<input type="submit" value="친구 추가" />
				</form>
			</div>
		</c:forEach>
	</div>
	<div class="pagination">
		<span>1</span>
	 <c:forEach var="pageNum" begin="${page.startPage }" end="${page.endPage }">
			<a href="/friends/searchfriends?cid=${param.cid }&pageNum=${pageNum}" class="nextPage">>></a>
	 </c:forEach>
	</div>
	<script>
		// 처음에는 비어있다가 검색하면 나타나도록 작성
		const input = document.querySelector(".input");
		let keyword = input.getAttribute("value");
		console.log(keyword);
		if(keyword != ""){
			const infinite = document.querySelector(".infinite");
			infinite.classList.remove("hidden");	
		}
	</script>
</body>
</html>