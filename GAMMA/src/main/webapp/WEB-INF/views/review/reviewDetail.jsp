<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>${review.grtitle}</title>
<style>
	#reviewModify {
		display: none;
	}
</style>
</head>
<body>
	<div id="body">
		<div id="content">
			<div id="review">
				<div id="reviewContent">
					<form action="/review/reviewList/${review.gnum}">
						<input type="submit" value="돌아가기">
					</form>
					
					<div id="review">
						아이디 : ${review.cid}
						작성일 : ${review.grdate}
						<c:choose>
							<c:when test="${review.grlike == 1}">추천</c:when>
							<c:when test="${review.grlike == 0}">비추천</c:when>
						</c:choose>
						제목 : ${review.grtitle}
						내용 : ${review.grcontent}
						좋아요 : ${review.grrecommend}
					</div>
					
					<!-- 리뷰 수정 폼(아이디 검사) -->
					<div id="reviewModify">
						<c:if test="${review.cid == review.cid}">
							<form action="/review/reviewModify" method="post">
								<input type="hidden" name="cid" value="${cid}">
								<input type="text" class="form-control form-control-lg" name="grtitle" placeholder="제목" value="${review.grtitle }" required><br/>
								<textarea class="form-control" id="exampleFormControlTextarea1" name="grcontent" rows="10" cols="15" placeholder="내용" required>${review.grcontent}</textarea><br/>
								<button type="button" id="reviewLike" name="grlike" value="1" class="btn btn-primary" >추천</button>
								<button type="button" id="reviewLike" name="grlike" value="0" class="btn btn-danger">비추천</button>
								<button type="button" id="modifyCancel" class="btn btn-secondary">취소</button>
								<input type="submit" class="btn btn-success" id="reviewUpdate" value="작성">
							</form>
						</c:if>
					</div>
					
					<!-- 리뷰 좋아요 버튼(로그인 검사) -->
					<c:choose>
						<c:when test="${rlvo == null && cid != null}">
							<form action="/review/reviewLike" method="post" id="reviewLike">
								<input type="hidden" name="grnum" value="${review.grnum}">
								<input type="submit" value="좋아요">
							</form>
						</c:when>
						<c:when test="${rlvo != null}">
							<form action="/review/reviewLikeCancel" method="post" id="reviewLike">
								<input type="hidden" name="grnum" value="${review.grnum}">
								<input type="submit" value="좋아요 취소">
							</form>
						</c:when>
					</c:choose>
					
					<!-- 리뷰 수정 버튼(아이디 검사) -->
					<c:if test="${cid == review.cid}">
						<button id="modifyBtn">수정하기</button>
					</c:if>
					
					<!-- 리뷰 삭제 버튼(아이디 검사) -->
					<c:if test="${cid == review.cid}">
						<form action="/review/reviewRemove" method="post">
							<input type="hidden" name="grnum" value="${review.grnum}">
							<input type="submit" value="삭제">
						</form>
					</c:if>
					<hr/>
				</div>
				<div id="reviewComment">
				
					<!-- 리뷰 댓글 작성(로그인 여부) -->
					<c:if test="${cid != null}">
						<form action="/review/reviewCommentWrite" method="post">
							<input type="hidden" name="grnum" value="${review.grnum}">
							<textarea rows="3" cols="10" required></textarea>
							<input type="submit" value="작성">
						</form>
						<hr/>
					</c:if>
					
					<!-- 리뷰 댓글 삭제는 hidden으로 grnum 과 rcnum을 보내야 한다. -->
					<c:forEach var="reviewComment" items="${reviewComment}">
						${reviewComment.cid}
						${reviewComment.rcdate}
						${reviewComment.rccontent}
						
						<!-- 리뷰 댓글 삭제 버튼(아이디 검사) -->
						<c:if test="${reviewComment.cid == cid}">
							<form action="/review/reviewCommentRemove" method="post">
								<input type="hidden" name="grnum" value="${reviewComment.grnum}">
								<input type="hidden" name="rcnum" value="${reviewComment.rcnum}">
								<input type="submit" value="삭제">
							</form>
						</c:if>
						<hr/>
					<!-- 리뷰 댓글 페이징 -->
					</c:forEach>
					<nav aria-label="Page navigation example">
					  <ul class="pagination">
					  	<c:if test="${pageBtn.prev}">
						    <li class="page-item">
						      <a class="page-link" href="/review/reviewDetail/${review.grnum}?pageNum=${pageBtn.startPage - 1}">	 
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
					    </c:if>
					    <c:forEach begin="${pageBtn.startPage}" end="${pageBtn.endPage}" var="pageNum">
					    	<li class="page-item ${pageBtn.rccri.pageNum == pageNum ? 'active' : ''}">
					    		<a class="page-link" href="/review/reviewDetail/${review.grnum}?pageNum=${pageNum}">${pageNum}</a>
					    	</li>
					    </c:forEach>
					    <c:if test="${pageBtn.next}">
						    <li class="page-item">
						      <a class="page-link" href="/review/reviewDetail/${review.grnum}?pageNum=${pageBtn.endPage + 1}">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
					    </c:if>
					  </ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$("#modifyBtn").click(function(){
		$("#review").hide();
		$("#modifyBtn").hide();
		$("#reviewModify").show();
	});
	
	$("#cancel").click(function(){
		$("#review").show();
		$("#modifyBtn").show();
		$("#reviewModify").hide();
	});
</script>
</html>