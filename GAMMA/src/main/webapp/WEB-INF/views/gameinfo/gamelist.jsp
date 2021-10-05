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
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>
		<a href="/gameInfo/gamelist"> 게임 목록</a>
	</h1>
	<a href="/gameInfo/gameregister"><input type="button" value="게임등록"
		style="float: right;"></a>
	<table class="table table-hover">
		<tr>
			<th>게임이름</th>
			<th>출시일</th>
			<th>가격</th>
			<th>등급</th>
		</tr>
		<c:forEach var="gameList" items="${gameList }">
			<tr>
				<td><a
					href="/gameInfo/get?gnum=${gameList.gnum }&pageNum=${btnMaker.cri.pageNum }&searchType=${btnMaker.cri.searchType}&keyword=${btnMaker.cri.keyword}">
						${gameList.gname }</a></td>
				<td>${gameList.glaunch }</td>
				<td>${gameList.gprice }</td>
				<td>${gameList.ggrade }</td>
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

	<form action="/gameInfo/gamelist" method="get"
		style="text-align: center;">
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
		// 컨트롤러에서 success라는 이름으로 날린 자료가 들어오는지 확인
		// 그냥 list 페이지 접근시는 success를 날려주지 않아서 아무것도 들어오지 않고
		// remove 로직의 결과로 넘어왔을때만 데이터가 전달됨
		var result = "${success}";
		var gnum = "${gnum}";

		// 모달 사용을 위한 변수 선언
		// 모달 공식문서의 자바스크립트 관련 실행 코드를 복사합니다
		var myModal = new bootstrap.Modal(document.getElementById('myModal'),
				focus)
		console.log(result);
		console.log(bno);
		if (result === "success") {
			alert(bno + "번 글이 삭제되었습니다");
		} else if (result === "register") {
			// 공식 문서 하단의 myModal.show()
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


</body>
</html>