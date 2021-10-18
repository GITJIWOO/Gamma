<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
h1>a {
	text-decoration: none
}
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/styles.css" />
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
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
	
	<h1>
		<a href="/gameInfo/gamelist"> 게임 목록</a>
	</h1>
	<!--  
	${gameList }<br/>
	${btnMaker }<br/>
	-->
	<a href="/gameInfo/gameregister"><input type="button" value="게임등록"
		style="float: right;"></a>
	<table class="table table-hover">
		<tr>
			<th>게임이름</th>
			<th>출시일</th>
			<th>가격</th>
			<th>태그</th>
		</tr>
		<c:forEach var="gameList" items="${gameList }">
			<tr>
				<td><a
					href="/gameInfo/get?gnum=${gameList.gnum }&pageNum=${btnMaker.cri.pageNum }&searchType=${btnMaker.cri.searchType}&keyword=${btnMaker.cri.keyword}">
						${gameList.gname }</a></td>
				<td>${gameList.glaunch }</td>
				<td>${gameList.gprice }</td>
				<td>${gameList.tagname }</td>
			</tr>
		</c:forEach>
	</table>
	
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">

			<!-- prev 버튼 
  	btnMaker의 prev가 true일떄만 뒤로가기 버튼 출력-->
			<c:if test="${btnMaker.prev }">
				<li class="page-item"><a class="page-link"
					href="/gameinfo/gamelist?pageNum=${btnMaker.startPage -1 }&searchType=${btnMaker.cri.searchType}&keyword=${btnMaker.cri.keyword}"
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
					href="/gameinfo/gamelist?pageNum=${btnMaker.endPage + 1 }&searchType=${btnMaker.cri.searchType}&keyword=${btnMaker.cri.keyword}"
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
	
	
	
	

	<div class="modal" id="myModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">게임등록 확인</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>${gname }게임이 등록되었습니다</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	  
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
		
	<script type="text/javascript">
		var result = "${success}";
		var gname = "${gname}";

		var myModal = new bootstrap.Modal(document.getElementById('myModal'), focus)
		console.log(result);
		console.log(gname);
		if (result === "success") {
			alert("'" + gname + "'" + "게임이 삭제되었습니다");
		} else if (result === "register") {
			myModal.show();
		}
		// 		var keyword = "${keyword}";
		// 		if (keyword === "") {
		// 			alert("검색어를 입력해주세요");
		// 		}else{
		// 			alert("찾으시는 내용이 없습니다");
		// 			location.href = "/gameInfo/list";
		// 		}
	</script>
	
	
	
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
    </script>
	
</body>
</html>