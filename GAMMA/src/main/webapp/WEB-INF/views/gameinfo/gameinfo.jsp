<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/styles.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

.container {
	width: 900px;
	margin: auto;
}

.top {
	margin-top: 20px;
	width: 900px;
	height: 40px;
}

.mid {
	height: 500px;
	position: relative;
}

.midLeft {
	position: absolute;
	top: 0px;
	width: 600px;
	height: 500px;
}

.midRight {
	position: absolute;
	top: 0px;
	left: 620px;
	width: 380px;
	height: 500px;
}

.mid1 {
	outline: 1px solid #9F9F9F;
	width: 300px;
	height: 150px;
}

.mid2 {
	margin-top: 10px;
	width: 300px;
	height: 150px;
}

.mid3 {
	margin-top: 10px;
	width: 300px;
	height: 180px;
}

.bottom {
	margin-top: 20px;
	margin-bottom: 10px;
	width: 900px;
	height: 600px;
}

.bottom1 {
	height: 300px;
}

.bottom2 {
	height: 300px;
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


	<div class="container">
		<!--top-->
		<div class="top">
			<span>${gvo.gname }</span>
		</div>

		<!--middle-->
		<div class="mid">

			<div class="midLeft">
			<script>
					var address = "${gvo.gaddress }";
					document.write("<iframe width='600' height='500' src='" + address + "' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>");
				</script>
			</div>
			<div class="midRight">

				<div class="mid1"><img src="${gvo.gpicture }" width="300px" height="150px"/></div>
				<div class="mid2">${gvo.gcontent }</div>
				<div class="mid3">

					<div class="container">
						<div class="row">
							<div class="col-md-2">출시날짜</div>
							<div class="col-md-2">${gvo.glaunch }</div>
						</div>
						<div class="row">
							<div class="col-md-2">개발사</div>
							<div class="col-md-2">${gvo.gdeveloper }</div>
						</div>
						<div class="row">
							<div class="col-md-2">배급사</div>
							<div class="col-md-2">${gvo.gfublisher }</div>
						</div>
						<div class="row">
							<div class="col-md-2">가격</div>
							<div class="col-md-2">₩&nbsp;${gvo.gprice }</div>
						</div>
						<br>
						<div class="row" >
							<div class="col-md">이 제품의 태그</div>
						</div>
						<div class="col-md" style="text-decoration: none;"><a href="/gameInfo/totallistbytag?pageNum=${param.pageNum }&searchType=${param.searchType}&keyword=${param.keyword}&tagname=${tvo.tagname}">${tvo.tagname}</a></div>
					</div>
				</div>
			</div>
		</div>

		<form action="/gameInfo/modifyform" method="post">
			<input type="hidden" name="gnum" value="${gvo.gnum }"> <input
				type="hidden" name="pageNum" value="${param.pageNum }"> <input
				type="hidden" name="searchType" value="${param.searchType }">
			<input type="hidden" name="keyword" value="${param.keyword }">
			<input type="submit" value="수정하기">
		</form>
		<!--  
		<a
			href="/gameInfo/gamelist?pageNum=${param.pageNum }&searchType=${param.searchType}&keyword=${param.keyword}">
			<input type="button" value="목록으로">
		</a>
		-->
		<form action="/gameInfo/gameremove" method="post" id="deleteForm">
			<input type="hidden" name="gnum" value="${gvo.gnum }"> <input
				type="button" value="삭제하기" onclick="confirm_delete();">
		</form>

		<!--bottom-->
		<div class="bottom">
			<div class="bottom1">
				시스템 요구사항<br>
				<hr>
				<div class="container">
					<div class="row">
						<div class="col-md-2">OS</div>
						<div class="col-md-10">${rvo.gos }</div>
					</div>
					<div class="row">
						<div class="col-md-2">프로세서</div>
						<div class="col-md-10">${rvo.gprocessor }</div>
					</div>
					<div class="row">
						<div class="col-md-2">메모리</div>
						<div class="col-md-10">${rvo.gmemory }</div>
					</div>
					<div class="row">
						<div class="col-md-2">그래픽</div>
						<div class="col-md-10">${rvo.ggraphic }</div>
					</div>
					<div class="row">
						<div class="col-md-2">directX</div>
						<div class="col-md-10">${rvo.gdirectx }</div>
					</div>
					<div class="row">
						<div class="col-md-2">저장공간</div>
						<div class="col-md-10">${rvo.gstore }</div>
					</div>
				</div>
			</div>
			<div class="bottom2">
				비슷한 제품
				<hr>
				<div align="right">
				<a href="/gameInfo/totallistbytag?pageNum=${param.pageNum }&searchType=${param.searchType}&keyword=${param.keyword}&tagname=${tvo.tagname}">
			<input type="button" value="전체보기"></a>
			</div>
				<table class="table table-hover">
					<tr>
						<th>게임이름</th>
						<th>가격</th>
						<th>태그</th>
					</tr>
					<c:forEach var="listByTag" items="${listByTag }">
					<c:if test="${listByTag.gname != gvo.gname }">
						<tr>
							<td><a
								href="/gameInfo/get?gnum=${listByTag.gnum }&keyword=${btnMaker.cri.keyword}">
									${listByTag.gname }</a></td>
							<th>${listByTag.gprice }</th>
							<th>${listByTag.tagname }</th>
						</tr>
						</c:if>
					</c:forEach>
				</table>

			</div>
		</div>
	</div>

	<script type="text/javascript">
		function confirm_delete() {
			var deleteForm = document.getElementById('deleteForm');
			if (confirm("정말 삭제하시겠습니까?")) {
				alert("삭제 확인")
				deleteForm.submit();
			} else {
				alert("삭제 취소")
			}
		}
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
	
	
</body>
</html>