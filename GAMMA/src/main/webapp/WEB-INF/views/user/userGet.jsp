<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/css/styles.css" />
<style>
* {
	padding: 5px;
	margin: 5px;
}
.userGet {
	position: relative;
	left: 20px;
}


.nick {
	display: flex;
	flex-flow: row;
}

h2 {
	font-weight: bold;
	font-size: big;
}
.img{display:flex; 
	flex-flow:row;
	padding:10px;
}
.cidPro{
color:orange;
}
.table{
	font-weight: bold;
}

p {
	font-weight: bold; 
	font-size:big;
}

strong {
	color: blue;
}

#modDiv {
	border-radius: 2px;
	width: 310px;
	height: 140px;
	background-color: black;
	position: absolute;
	padding: 10px;
	top: 40%;
	left: 30%;
	z-index: 1000;
	width: 310px;
}

modBtn {
	display: flex;
	flex-flow: row;
	background-color: white;
	color: gray;
}

#replytext {
	position: relative;
	right: 7px;
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
 .proImg{
 text-align:center;
 }
 .imgPro{
 width: 350px;
	height:350px;
	padding:0;
	margin:0;
 }
 .uid{
 	 position: relative;
 	 top:10px;
	font-weight:bold;
	color:white;
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
				<span><a href="#"><img
						src="/resources/css/image/logo.png" /></a></span>
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
				<span><a href="#">게임 스토어</a></span> <span><a href="#">라이브러리</a></span>
			</div>
			<!-- qna -->
			<div class="side-bar__row">
				<span><a href="#">Q&A</a></span> &nbsp;&nbsp;|&nbsp;&nbsp; <span><a
					href="#">자주하는 질문</a></span>
			</div>
			<!-- about user -->
			
		<div class="proImg">
          <div>
          <p class="uId">${member.nickname }(${member.cid  })</p>
          </div>
          <img class="imgPro" src="/resources/css/image/chaIcon.png"/>
          
          <div>
   				<a href="/user/userGet">유저정보창</a>
   				<a href="/user/userDelete">탈퇴창</a>
   				</div>
          </div>
		</div>
		<div class="main">
			<div class="container">
				<div class="row">
					<div class="userGet">
						<form name="form1" method="post">
							<div class="img">							
							<div class="row">&nbsp;</div>
							<img class="imgPro" src="/resources/css/image/chaIcon.png"/>
							</div>
							<table class="table" width="400px">

								<c:if test="${member eq 'kjw011231' }">
									<tr >
										<td>유저고유번호</td>
										<td><input id="cnum" name="cnum" value="${member.cnum}"
											readonly="readonly"></td>
									</tr>
								</c:if>
								<tr >
									<td>아이디</td>
									<td id="cid" name="cid">${member.cid}
										</td>
								</tr>
								<tr>
									<td>닉네임</td>
									<td id="nickname" name="nickname">${member.nickname}</td>
								</tr>
								<tr>
									<td>이메일</td>
									<td id="email" name="email">${member.email}
										</td>
								</tr>
								<tr>
									<td>회원가입일자</td>
									<td><fmt:formatDate value="${member.userregdate}"
											pattern="yyy-MM-dd" /></td>
								</tr>
								<tr>
									<td>회원정보 수정일자</td>
									<td><fmt:formatDate value="${member.userupdatedate}"
											pattern="yyy-MM-dd" /></td>
								</tr>
							</table>
						</form>
							<div class="row">&nbsp;</div>
						<div class="Mbtn">
						<c:if test="${member != null}">
							<a href="/user/userLogin"><button>로그인</button></a>
							<a href="/user/userLogout"><button>로그아웃</button></a>
							<a href="/user/userModify"><button>유저수정</button></a>
							<a href="/user/userDelete"><button>탈퇴</button></a>
						</c:if>
						</div>
						<br>
						<br />
						
						<br />
						<div class="modAub">
							<div class="row">
								<div class="col-md-3">
									<p>${member.nickname } (방명록)</p>
								</div>
								<div class="col-md-6">
									<textarea style="resize: none;" name="reply" id="newReply"
										rows="2" cols="30"></textarea>
									<input type="hidden" name="nickname"
										value="${member.nickname }" id="newReplyWriter" readonly>
								</div>
								<div class="col-md-3">
									<button id="replyAddBtn">방명록 남기기</button>
									<br />
								</div>
							</div>

							<ul id="replies">

							</ul>
						</div>
					</div>
				</div>
			</div>
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
							<!-- 모달 요소는 안 보이기 때문에 어디 넣어도 되지만 보통 html요소들 끼리 놨을때
	제일 아래쪽에 작성하는 경우가 많습니다. -->
							<div id="modDiv" style="display: none;">
								<div class="modal-title" style="color: white"></div>
								<div>
									<textarea style="resize: none;" name="reply" id="replytext"
										rows="2" cols="41"></textarea>
								</div>
								<div class="modBtn">
									<button type="button" id="replyModBtn">수정</button>
									<button type="button" id="replyDelBtn">삭제</button>
									<button type="button" id="closeBtn">닫기</button>
								</div>
							</div>

	<script>
	$(document).ready(function() {
		// 취소
		$(".loginA").on("click", function() {
			location.href = "/user/userLogin";
		})
		$(".joinA").on("click", function() {
			location.href = "/user/userJoin";
		})
	});
		var cnum = ${member.cnum};
		function getAllList() {
			$.getJSON("/userrp/all/" + cnum,
							function(data) {
								//data 변수가 바로 얻어온 json데이터의 집합
								console.log(data);

								// str 변수 내부에 문자 형태로 html 코드를 작성함
								var str = "";

								$(data).each(
												function() {
													// $(data).each()는 향상된 for문처럼 내부데이터를 하나하나 반복합니다.
													// 내부 this는 댓글 하나하나입니다.
													// 시간 형식을 우리가 쓰는 형식으로 변경
													var timestamp = this.uupdatedate;
													var date = new Date(
															timestamp);
													// date만으로도 시간표시는 우리가 아는 형태로 할 수 있지만 보기 불편함
													console.log(date);
													// date 내부의 시간을 형식(format)화 해서 출력
													var formattedTime = "게시일 : "
															+ date
																	.getFullYear() // 년도 추출
															+ "/"
															+ (date.getMonth() + 1) // month는 0월부터시작
															+ "/"
															+ date.getDate() // 날짜 추출
															+ "/"
															+ date.getHours() // 시간 추출
															+ ":"
															+ date.getMinutes() // 분 추출
															+ ":"
															+ date.getSeconds() // 초 추출	

													// this.updateDate를 표출하면 시간이 unix시간으로 표시됨  요소분석으로 a태그 찾아서 본거고 http://로 시작해야 앞에 짜잘한거 안붙어요.
													str += "<div class='replyLi' data-rno='" + this.rno + "'><br/><a href='http://localhost:8181/user/userPro?cid=${member.cid}'><strong>@"
															+ this.nickname
															+ "</strong></a> - "
															+ formattedTime
															+ "<br>"
															+ "<div class='reply'>"
															+ this.reply
															+ "</div><br/>"
															+ "<button type='button' class='btn btn-info'>수정/삭제</button><br/>"
															+ "</div>";
												});

								// #replies인 ul태그 내부에 str을 끼워넣음
								$("#replies").html(str);
							});
		}
		getAllList();

		// 비동기 코드
		// 글쓰기 부분
		$("#replyAddBtn").on("click", function() {
			// 각 input태그에 들어있던 글쓴이, 본문의 value값을 변수에 저장함.
			var nickname = $("#newReplyWriter").val();
			var reply = $("#newReply").val();
			// 디버깅시는 console.log() 내부에 적어서 확인합니다.
			//console.log(replyer + "/" + reply);
			console.log("디버깅 : " + cnum + "/" + nickname + "/" + reply);
			$.ajax({
				type : 'post',
				url : '/userrp/',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					cnum : cnum,
					nickname : nickname,
					reply : reply
				}),
				success : function(result) {
					if (result == 'SUCCESS') {
						alert("등록 되었습니다.");
						// 댓글 쓰고 나서 다시 새롭게 갱신된 목록을
						// 넣어주도록 전체 댓글 목록 다시 조회
						getAllList();
						// 댓글 다 썼으면 댓글창 비워지도록 처리
						$("#newReply").val("");
					}
				}
			})
		});

		// 글 삭제 로직
		$("#replyDelBtn").on("click", function() {
			// 삭제에 필요한 댓글번호를 모달 타이틀 부분에서 얻기
			var rno = $(".modal-title").html();

			$.ajax({
				type : 'delete',
				url : '/userrp/' + rno,
				// 삭제로직은 rno만 전달함
				// 호출타입 delete, url정보 이외엔 처리할게 없음
				success : function(result) {
					if (result === 'SUCCESS') {
						alert(rno + "번 댓글이 삭제되었습니다.");
						// 댓글삭제 후에 모달창 닫고 새 댓글목록 갱신
						$('#modDiv').hide('slow');
						getAllList();
					}
				}
			})
		});

		// 글 수정 로직(rno, reply 필요)
		$('#replyModBtn').on("click", function() {
			// rno(수정에 필요한 댓글번호 모달 타이틀에서 얻기)
			var rno = $(".modal-title").html();
			// 수정에 필요한 본문내역을 #replytext의 value값으로 얻기
			var reply = $("#replytext").val();

			$.ajax({
				type : 'put',
				url : '/userrp/' + rno,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PUT"
				},
				dataType : 'text',
				data : JSON.stringify({
					reply : reply
				}),
				success : function(result) {
					if (result === 'SUCCESS') {
						alert(rno + "번 댓글이 수정되었습니다.");
						// 댓글 삭제 후 모달창 닫고 새 댓글목록 갱신
						$("#modDiv").hide("slow");
						getAllList();
					}
				}
			});
		});

		// 이벤트 위임
		// 내가 현재 이벤트를 걸려는 집단(button) 을 포함하면서 범위가 제일 좁은
		// #replies로 시작조건을 잡습니다.
		// .on("click", "목적지 태그까지 요소들", function(){실행문})
		// 과 같이 위임시는 파라미터가 3개 들어갑니다.
		$("#replies").on("click", ".replyLi button", function() {
			// this는 최 하위태그인 button, button의부모면 결국 .replyLi
			var replyLi = $(this).parent();

			// .attr("속성명") 을 하면 해당 속성의 값을 얻습니다.
			var rno = replyLi.attr("data-rno");// data-rno=this.rno 얻어오기
			//버튼의 형제(.reply)의 내부텍스트 얻기
			var reply = $(this).siblings(".reply").text();
			// 버튼의 부모(replyLi)의 자식(.reply) div class="reply"의 내부텍스트얻기
			// var reply = $(this).parent().childrens(".reply").text();

			// 클릭한 버튼에 해당하는 댓글번호 + 본문이 얻어지나 디버깅
			console.log(rno + ":" + reply);

			// 모달 열리도록 추가
			$(".modal-title").html(rno + "번 댓글");// 모달 상단에 댓글번호 넣기
			$("#replytext").val(reply);// 모달 수정창에 댓글본문 넣기
			$("#modDiv").show("slow"); // 창에 애니메이션 효과 넣기
		});

		// 모달 닫기 : closeBtn을 눌렀을때 #modDiv가 hide되도록 해야함
		$("#closeBtn").on("click", function() {
			$("#modDiv").hide("slow");
		});

		$(document).ready(function() {
			$("#btnUpdate").click(function() {
				// 확인 대화상자
				if (confirm("수정하시겠습니까?")) {
					document.form1.action = "localhost:8181/user/userModify";
					document.form1.submit();
				}
			});
		});
		$(document).ready(function() {
			$("#btnDelete").click(function() {
				//확인 대화 상자
				if (confirm("삭제하시겠습니까?")) {
					document.form1.action = "localhost:8181/user/userDelete"
					document.form1.submit();
				}
			});
		});
	</script>
</body>
</html>