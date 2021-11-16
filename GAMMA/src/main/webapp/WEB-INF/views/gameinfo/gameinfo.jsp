<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous"><!-- Bootstrap cdn 설정 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>	
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">	
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">	
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="<c:url value="/resources/js/main.js"/>"></script>
<link rel="stylesheet" href="/resources/css/styles.css" />
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<style type="text/css">
input[type="radio"] {
		visibility:hidden;
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
	font-size: large;
	font-style: italic;
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
	height: 1700px;
}

.bottom1 {
	height: 300px;
}

.bottom2 {
	height: 500px;
}
.bottom3{
	height: 200px;
}
</style>
<meta charset="UTF-8">
<title>Gamma</title>

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
          <c:if test="${cid eq null }">
	          <div class="loginBtn">
	        	<span><a href="/user/userLogin" class="loginA">로그인</a></span>
	          </div>
	          <div class="joinBtn">
	        	<span><a href="/user/agreeJoin" class="joinA">가입하기</a></span>
	          </div>
       	  </c:if>
          <c:if test="${cid ne null}">
	          <div class="consumer">
	          	  <div class="consumer__imgPro">
			        <img class="conimg" src="/resources/css/image/chaIcon.png"/>
	          	  </div>
		          <div class="consumer__nickname">
		          	<p style="color:white;"><sec:authentication property="principal.consumer.nickname"/></p>
		          </div>
		          <div class="consumer__info">
	   				<a href="/user/userGet">* 유저정보창</a><br/>
	   				<a href="/user/userPro">* 유저프로필창</a><br/>
	   				<a href="/friends/followerlist">* 팔로워리스트</a><br/>
	   				<a href="/friends/followinglist">* 팔로윙리스트</a><br/>
	   				<a href="/friends/searchfriends">* 친구 검색</a><br/>
		   		  </div>
				  <form action="/user/userLogout" method="post">
					  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
					  <input class="logout" type="submit" value="로그아웃" />
				  </form>
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
						<div class="col-md" style="display:flex: 1;">${tvo.tagname}</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 관리자 권한 수정, 삭제 -->
		<sec:authorize access="hasRole('ROLE_ADMIN')">
		<form action="/gameInfo/modifyform" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="hidden" name="gnum" value="${gvo.gnum }"> <input
				type="hidden" name="pageNum" value="${param.pageNum }"> <input
				type="hidden" name="searchType" value="${param.searchType }">
			<input type="hidden" name="keyword" value="${param.keyword }">
			<input type="submit" value="수정하기">
		</form>

		<form action="/gameInfo/gameremove" method="post" id="deleteForm">
			<input type="hidden" name="gnum" value="${gvo.gnum }"> <input
				type="button" value="삭제하기" onclick="confirm_delete();">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
		</sec:authorize>
		<!--  end 관리자 권한  -->
		
		
		<c:if test="${cid ne null }">
			<c:if test="${lvo eq null && basket eq null }">
				<form action="/gamepayment/basketAdd" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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
				<div align="right">
				<%-- <a href="/gameInfo/totallistbytag?pageNum=${param.pageNum }&searchType=${param.searchType}&keyword=${param.keyword}&tagname=${tvo.tagname}">
			<input type="button" value="전체보기"></a> --%>
			
			<form action="/gameInfo/gamelist?searchType=t&keyword=${tvo.tagname }" method="get">
          <select name="searchType" style="display:none">
          	<option  value="t"
				<c:out value="${btnMaker.cri.searchType eq 't' ? 'selected' : '' }"/>>
				</option>
            </select>
            <input type="hidden" name="keyword" value="${tvo.tagname }"/>
            <!-- origin처럼 버튼 숨겼음, enter 치면 검색됨 -->
            <input type="submit" value="더보기" />
          </form>
			</div>
				<hr>
				
				<!-- carousel를 구성할 영역 설정 -->
			  <div style="width: 900px; height: 250px; " >
			    <div id="carousel-example-generic" class="carousel slide" >
			      <ol class="carousel-indicators">
			        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
			        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
			        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
			        <li data-target="#carousel-example-generic" data-slide-to="4"></li>
			      </ol>
			      <div class="carousel-inner" role="listbox">	
			      	<c:forEach var="listByTag" items="${listByTag }" varStatus="status">
				    	<c:if test="${listByTag.gname != gvo.gname }"> 
				      		<c:if test="${status.count eq 1 }">
				      			<div class="item active">
				        			<a href="/gameInfo/get?gnum=${listByTag.gnum }">
				          				<img src="${listByTag.gpicture }" style="width:100%; height: 250px;">
				          			</a>
				        	  	<div class="carousel-caption" style="color:white;">
			          				${listByTag.gname }
			          			</div>
				        		</div>
				      		</c:if>
				      	</c:if>
				      	
				        <c:if test="${listByTag.gname != gvo.gname }">
				        	<c:if test="${status.count ne 1 }">
				        		<div class="item">
				        			<a href="/gameInfo/get?gnum=${listByTag.gnum }">
				          				<img src="${listByTag.gpicture }" style="width:100%; height: 250px;">
				          			</a>
				          		<div class="carousel-caption" style="color:white;">
			          			${listByTag.gname }
			          			</div>
				        		</div>
				        	</c:if>
				         </c:if> 
				      </c:forEach>				        
			       
			      </div>
			      <!-- 왼쪽 화살표 버튼 -->
			      <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			        <!-- 왼쪽 화살표 -->
			        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			      </a>
			      <!-- 오른쪽 화살표 버튼 -->
			      <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			        <!-- 오른쪽 화살표 -->
			        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			      </a>
			    </div>
			  </div>
			  <script>
			    $(function(){
			      $('#carousel-example-generic').carousel({
			        interval: 2000,	// 슬리아드 자동 순환 지연 시간 false는 자동순환x
			        
			        pause: "hover",	// hover 설정시 마우스를 가져대면 자동 순환 정지
			        wrap: true,
			        keyboard : true	// 키보드로 조작가능 tab
				  });
				});
			  </script>

			</div>
			
			<div class="bottom3">
				<c:if test="${cid ne null && lvo ne null}">
                     <c:choose>
                         <c:when test="${getReview ne null}">
							<div id="reviewInfo">
							<h2>내가 쓴 리뷰</h2><br>
						<div class="reviewNickname">
							${getReview.cid}
						</div>
						<div class="reviewGrlike">
							<c:choose>
								<c:when test="${getReview.grlike == 1}"><i class="fas fa-thumbs-up fa-2x"></i> 추천</c:when>
								<c:when test="${getReview.grlike == 0}"><i class="fas fa-thumbs-down fa-2x"></i> 비추천</c:when>
							</c:choose>
						</div>
						<div class="reviewGrdate">
							게시 일시 : ${getReview.grdate}
						</div>
						<div class="reviewGrcontent">
							${getReview.grcontent}
						</div>
						<div class="reviewGrrecommend">
							좋아요 : ${getReview.grrecommend}
						</div>
					</div>	
                         </c:when>
                         <c:when test="${getReview eq null}">
							<form action="/review/reviewWrite" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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
			<th>추천</th>
			<th>글쓴이</th>
			<th>리뷰내용</th>
			<th>등록일</th>
		</tr>
		<c:forEach var="reviewList" items="${reviewList }" end="4">
		
		<tr>
			<th><c:choose>
				<c:when test="${reviewList.grlike == 1}"><i class="fas fa-thumbs-up fa-2x"></i> 추천</c:when>
				<c:when test="${reviewList.grlike == 0}"><i class="fas fa-thumbs-down fa-2x"></i> 비추천</c:when>
			</c:choose>
			</th>
			<th>${reviewList.cid }</th>
			<th>${reviewList.grcontent }</th>
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