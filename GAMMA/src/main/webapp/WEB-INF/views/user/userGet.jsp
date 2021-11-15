<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<!-- Bootstrap cdn 설정 -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="<c:url value="/resources/js/main.js"/>"></script>
<link rel="stylesheet" href="/resources/css/styles.css" />
<link rel="icon" type="image/png" href="http://example.com/myicon.png">

<style>
.display {
  display: flex;
  flex-direction: row;
  height: 200vh;
}
.side-bar {
  z-index: 99;
  width: 18%;
  height: 100%;
  position: fixed;
  background-color: var(--sideColor);
  color: var(--fontColor);
}
.side-bar__row:first-child img {
  display: block;
  margin: 50px auto;
  width: 170px;
}
.side-bar__row:nth-child(2) input[type="text"] {
  padding: 15px;
  font-size: large;
  width: 90%;
  margin-left: 5%;
  border-radius: 50px;
  border: none;
  transition: border 0.4s ease-in-out;
}
.side-bar__row:nth-child(2) input[type="text"]::placeholder {
  color: var(--fontColor);
}
.side-bar__row:nth-child(2) input[type="text"]:focus {
  border: 1.5px solid var(--mainColor);
}
.side-bar__row:nth-child(2) input:not([type="text"]) {
  display: none;
}
.side-bar__row:nth-child(3) {
  margin: 20px 0;
  font-size: 25px;
  display: flex;
  flex-direction: column;
  align-items: center;
  padding-bottom: 30px;
  border-bottom: 1px solid var(--opacity);
}
.side-bar__row:nth-child(3) span {
  padding: 15px 0;
  margin: 5px 0;
  width: 100%;
  text-align: center;
}
.side-bar__row:nth-child(3) span:hover {
  background-color: var(--opacity);
  border-left: 5px solid var(--mainColor);
}
.side-bar__row:nth-child(4) {
  display: flex;
  justify-content: center;
  margin: 30px;
}
.side-bar__row:nth-child(4) span {
  transition: color 0.6s ease-in-out;
}
.side-bar__row:nth-child(4) span:hover {
  color: white;
}

.side-bar__row:last-child {
  /* margin-top: 500px; */
}
.side-bar__row:last-child span {
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  width: 90%;
  color: white;
  border-radius: 5px;
  padding: 15px 0;
  margin: 10px auto;
}
.side-bar__row:last-child span:first-child {
  background-color: var(--mainColor);

  transition: background-color 0.4s ease-in-out;
}
.side-bar__row:last-child span:first-child:hover {
  background-color: rgba(245, 108, 45, 0.8);
}
.side-bar__row:last-child span:last-child {
  background-color: inherit;
  border: 1px solid white;
  transition: border-color 0.4s ease-in-out;
  transition: color 0.2s ease-in-out;
}
.side-bar__row:last-child span:last-child:hover {
  border-color: var(--fontColor);
  color: var(--fontColor);
}
.side-bar a:hover {
  color: white;
}
.main {
  width: 82%;
  padding-left: 18%;
  height: 100%;
  position: relative;
}
.footer {
  width: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  background-color: var(--footerColor);
  bottom: 0;
  height: 100px;
  color: rgb(161, 161, 161);
  position: absolute;
}
.footer-info {
  display: flex;
  justify-content: center;
  position: absolute;
  top: 0;
  padding: 20px 0;
  font-weight: 600;
  font-size: 14px;
}
.footer-copyright {
  padding-top: 30px;
  display: flex;
  font-weight: 300;
  font-size: 13px;
}
.consumer {
	position: relative;
	text-align: center;
	display: flex;
	flex-flow: row;
	align-items: center;
	margin: 10px;
	height:100px;
}
.consumer__imgPro {
	float: left;
	padding: 0;
	margin: 0;
	width: 100px;
}
.conimg {
	width: 130px;
	height: 130px;
}
.consumer__nickname {
	float: left;
	font-size: 25px;
	font-weight: bold;
	color: white;
	height: 70px;
	align-items: center;
	width: 250px;
	margin:0;
	padding:0;
	line-height:60%;
	
}
.logout{
	font-size:13px; 
}
.consumer__info {
	background-color: white;
	border: 2px solid black;
	font-size: 120%;
	display: none;
	position: absolute;
	top: 40px;
	left: 100%;
	width: 130px;
	border-radius: 10%;
	text-align:left;
 }
.detail {
	display: flex;
	flex-flow: row;
}

.table1 {
	position: relative;
	left: 50px;
}

h2 {
	font-weight: bold;
	font-size: big;
}

.img {
	display: flex;
	flex-flow: row;
	padding: 10px;
}

.table {
	font-weight: bold;
}


button {
	width: 100px;
	height: 40px;
	padding: 0;
	display: inline;
	border-radius: 4px;
	background: #212529;
	color: #fff;
	margin-top: 5px;
	border: solid 2px #212529;
	transition: all 0.5s ease-in-out 0s;
}


.imgProA {
	width: 250px;
	height: 250px;
	padding: 0;
	margin: 0;
}


</style>
<meta charset="UTF-8">

<title>회원정보 상세 페이지</title>

</head>
<body>
<div class="display">
		<!-- side-bar -->
		<div class="side-bar">
			<!-- logo -->
			<div class="side-bar__row">
				<!-- 클릭하면 main화면으로 돌아오도록 a 태그 수정 -->
				<span><a href="/main/main">
				<img src="/resources/css/image/logo.png" /></a></span>
			</div>
			<!-- search -->
			<div class="side-bar__row">
				<form action="/gameInfo/gamelist" method="get">
				<select name="searchType" style="display:none">
          	<option  value="n"
				<c:out value="${btnMaker.cri.searchType eq 'n' ? 'selected' : '' }"/>>
				</option>
            </select>
					<input type="text" placeholder="   Search Game" />
					<!-- origin처럼 버튼 숨겼음, enter 치면 검색됨 -->
					<input type="submit" value="" />
				</form>
			</div>
			<!-- category -->
			<div class="side-bar__row">
				<span><a href="/gameInfo/gamelist">게임 스토어</a></span> 
				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal" var="secuInfo" />
          	<span><a href="/library/conLibrary?cid=${secuInfo.consumer.cid}">라이브러리</a></span>
          	</sec:authorize>
			</div>
			<!-- qna -->
			<div class="side-bar__row">
				<span><a href="/qna/questionlist">Q&A</a></span> &nbsp;&nbsp;|&nbsp;&nbsp; <span><a
					href="/qna/commonquestion">자주하는 질문</a></span>
			</div>
			<!-- about user -->
			<div class="side-bar__row">
				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal" var="secuInfo" />
					<div class="consumer">
						<div class="consumer__imgPro">
							<img class="conimg" src="/resources/css/image/chaIcon.png" />
						</div>
						<div class="consumer__nickname">
							<p>${secuInfo.consumer.nickname}</p>
							<form action="/user/userLogout" method="post">
								<input type="hidden" name="${_csrf.parameterName }"
									value="${_csrf.token }" /> <input class="logout" type="submit"
									value="LOGOUT" />
							</form>
						</div>
						<div class="consumer__info">
							<a href="/user/userGet">* 유저정보창</a><br /> <a
								href="/user/userLogout">* 로그아웃</a><br /> <a
								href="/friends/followerlist">* 팔로워리스트</a><br /> <a
								href="/friends/followinglist">* 팔로윙리스트</a><br /> <a
								href="/friends/searchfriends">* 친구 검색</a><br />
						</div>
					</div>
				</sec:authorize>
			</div>
		</div>
		<div class="main">
			<div class="contents">
				<div class="detail">
					<!-- 여기에 각자 content 붙여넣기 -->
					<!-- about user -->
					<div class="main">
						<div class="container">
							<div class="detail">
								<div class="rowA">
									<form name="form1" method="post">
										<div class="img">
											<div class="row">&nbsp;</div>
											<img class="imgProA" src="/resources/css/image/chaIcon.png" />
											<div>
												<br> <br> <br>
												<h2>[[프로필이미지]]</h2>
												<div class="uploadDiv">
													<input type="file" name="uploadFile" multiple>
												</div>

												<div class="uploadResult">
													<ul>
														<!-- 업로드된 파일이 들어갈 자리 -->
													</ul>
												</div>
												<button id="uploadBtn">upload</button>

											</div>
										</div>
										<sec:authorize access="isAuthenticated()">
											<sec:authentication property="principal" var="principal" />
											<table class="table table1" width="400px">

												<c:if test="${principal.consumer.cid eq 'kjw011231' }">
													<tr>
														<td>유저고유번호</td>
														<td><input id="cnum" name="cnum"
															value="${principal.consumer.cnum}" readonly="readonly"></td>
													</tr>
												</c:if>
												<tr>
													<td>아이디</td>
													<td id="cid" name="cid"><a
														href="/user/userPro?cid=${principal.consumer.cid }">${principal.consumer.cid}</a></td>
												</tr>
												<tr>
													<td>닉네임</td>
													<td id="nickname" name="nickname">${principal.consumer.nickname}</td>
												</tr>
												<tr>
													<td>이메일</td>
													<td id="email" name="email">${principal.consumer.email}</td>
												</tr>
												<tr>
													<td>회원가입일자</td>
													<td><fmt:formatDate
															value="${principal.consumer.userregdate}"
															pattern="yyy-MM-dd" /></td>
												</tr>
												<tr>
													<td>회원정보 수정일자</td>
													<td><fmt:formatDate
															value="${principal.consumer.userupdatedate}"
															pattern="yyy-MM-dd" /></td>
												</tr>
											</table>
										</sec:authorize>
									</form>
									<div class="row">&nbsp;</div>
									<div class="Mbtn">
										<button id="emailAcc">이메일인증</button></a>
										<button id="uModify">유저수정</button>
										<button id="uRemove">탈퇴</button>
										<a href="/gamepayment/consumerBreakdown"><button>결제
												목록</button></a> <input type="hidden" name="${_csrf.parameterName }"
											value="${_csrf.token }" />
									</div>
								</div>

							</div>

						</div>
					</div>
					<!--  row main-->

					<div class="footer">
						<div class="footer-info">
							<div>CREATORS&nbsp;&nbsp;김영훈, 김지우, 조훈현, 최재인</div>
							<div>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</div>
							<div>
								CONTACT&nbsp;&nbsp;<a href="https://github.com/GITJIWOO">https://github.com/GITJIWOO</a>
							</div>
						</div>
						<div class="footer-copyright">
							<div>Copyright © GAMMA All right reserved.</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {

			$(".loginA").on("click", function() {
				location.href = "/user/customLogin";
			});
			$(".joinA").on("click", function() {
				location.href = "/user/join";
			});
			$(".consumer").mouseover(function() {
				$(".consumer__info").show();
			});

			$(".consumer").mouseout(function() {
				$(".consumer__info").hide();
			});

		});

		window.onload = function() {
			var myBtn = document.getElementById("uRemove");
			myBtn.onclick = theRemove;
		}
		function theRemove() {
			window.open("/user/userDelete", "userDelete",
							"width=400px,height=430px",
							"left=200px,top=20px,scrollbars=yes, toolbar=no,location=no");
		}

		window.addEventListener('load', function() {
			var myTtn = document.getElementById("uModify");
			myTtn.onclick = theModify;
		})
		function theModify() {
			window.open("/user/userModify", "userModify",
							"width=450px,height=500px",
							"left=400px,top=100px,scrollbars=yes, toolbar=no,location=no, fullscreen=no");
		}
		window.addEventListener('load', function() {
			var myEtn = document.getElementById("emailAcc");
			myEtn.onclick = theEmail;
		})
		function theEmail() {
			window.open("/user/mailCheck", "EmailAcc",
							"width=450px,height=450px",
							"left=400px,top=100px,scrollbars=yes, toolbar=no,location=no,fullscreen=no");
		}
	</script>
</body>
</html>