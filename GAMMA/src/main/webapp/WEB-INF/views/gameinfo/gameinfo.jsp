<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/styles.css" />
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<style type="text/css">
input[type="radio"] {
		visibility:hidden;
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
	height: 1500px;
}

.bottom1 {
	height: 300px;
}

.bottom2 {
	height: 300px;
}
.bottom3{
	height: 200px;
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
		<c:if test="${cadmin ne null}">
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
		</c:if>
		<c:if test="${cid ne null }">
			<c:if test="${lvo eq null && basket eq null }">
				<form action="/gamepayment/basketAdd" method="post">
					<input type="hidden" name="gnum" value="${gvo.gnum }">
					<input type="submit" value="장바구니 추가">
				</form>
			</c:if>
			<c:if test="${lvo eq null && basket ne null }">
				<form action="/gamepayment/basketList" method="get">
					<input type="submit" value="장바구니 가기">
				</form>
			</c:if>
		</c:if>
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
			
			<div class="bottom3">
				<c:if test="${cid ne null && lvo ne null}">
                     <c:choose>
                         <c:when test="${getReview ne null}">
							${getReview }	
                         </c:when>
                         <c:when test="${getReview eq null}">
							<form action="/review/reviewWrite" method="post">
								<input type="hidden" name="cid" value="${cid}">
								<input type="hidden" name="gnum" value="${gvo.gnum}">
								<textarea class="form-control" id="exampleFormControlTextarea1" name="grcontent" rows="7" cols="70" placeholder="내용" required></textarea><br/>
								<div id="isLike" class="btn btn-secondary">
									<input type="radio" class="isLike" name="grlike" value="1"><i class="far fa-thumbs-up fa-lg"> 추천</i>
								</div>
								<div id="notLike" class="btn btn-secondary">
									<input type="radio" class="notLike" name="grlike" value="0"><i class="far fa-thumbs-down fa-lg"> 비추천</i>
								</div>
								<input type="submit" class="btn btn-success" id="reviewWrite" value="작성">
							</form>
                         </c:when>
                     </c:choose>
                 </c:if>
		<br>
		<br>
		<br>
		<br>
	
	
	<a  href="/review/reviewList/${gvo.gnum }">
			<input  type="button" value="리뷰전체보기" style="float: right;"></a>
	<table class="table table-hover">
		<tr>
			<th>리뷰번호</th>
			<th>글쓴이</th>
			<th>등록일</th>
		</tr>
		<c:forEach var="reviewList" items="${reviewList }" end="4">
		<tr>
			<td>${reviewList.grnum }</td>
			<th>${reviewList.cid }</th>
			<th>${reviewList.grdate }</th>
		</tr>
		</c:forEach>
	</table>				
	<script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
	
			</div><!-- end bottom3 -->
		</div><!-- end bottom -->
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
	
	<script>

	$("div#notLike").click(function() {
		let isCheck = $(".isLike").is(":checked");
		$(".notLike").prop("checked", true);
		$("#notLike").toggleClass().addClass("btn btn-danger");
		$(".fa-thumbs-down").toggleClass().addClass("fas fa-thumbs-down fa-lg");
		if(isCheck === true) {
			$(".isLike").prop("checked", false);
			$("#isLike").toggleClass().addClass("btn btn-secondary");
			$(".fa-thumbs-up").toggleClass().addClass("far fa-thumbs-up fa-lg");
		}
	});
	
	$("div#isLike").click(function() {
		let notCheck = $(".notLike").is(":checked");
		$(".isLike").prop("checked", true);
		$("#isLike").toggleClass().addClass("btn btn-success");
		$(".fa-thumbs-up").toggleClass().addClass("fas fa-thumbs-up fa-lg");
		if(notCheck === true) {
			$(".notLike").prop("checked", false);
			$("#notLike").toggleClass().addClass("btn btn-secondary");
			$(".fa-thumbs-down").toggleClass().addClass("far fa-thumbs-down fa-lg");
		}
	});

	$("#reviewWrite").click(function updateCheck(){
		let isCheck = $(".isLike").is(":checked");
		let notCheck = $(".notLike").is(":checked");
		
		if(isCheck === false && notCheck === false) {
			alert("평가를 선택하십시오.");
			return false;
		} else {
			return true;
		}
	});

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