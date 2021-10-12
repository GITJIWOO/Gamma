<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>${game.gname} 리뷰</title>
<style>
	.card {
		background-color: gainsboro;
		border: 1px solid white;
		margin: 15px;
		padding: 1px;
		width: 732px;
		height: 430px;
	}
</style>
</head>
<body>
	<div class="body">
		<form action="/gameinfo/" method="get">
			<input type="submit" value="돌아가기">
		</form>
		<form action="/review/reviewList/${game.gnum}" method="get">
			<select name="listKind">
				<option value="" selected>정렬 기준</option>
				<option value="famous">인기 순</option>
				<option value="new">최신 순</option>
			</select>
			<input type="submit" value="적용">
		</form>
		<div id="review">
			<c:forEach var="review" items="${review}">
				<div class="card">
					<div class="card-header">
						${review.cid}
					</div>
					<div class="card-body">
						<h5 class="card-title">
							<c:choose>
								<c:when test="${review.grlike == 1}">추천</c:when>
								<c:when test="${review.grlike == 0}">비추천</c:when>
							</c:choose></h5>
					    <p class="card-text">
					    	${review.grdate}<br/>
					    	<strong>${review.grcontent}</strong><br/>
					    	${review.grrecommend}
					    </p>
					</div>
					<script>
						$(".card").click(function(){
							location.href = "/review/reviewDetail/" + ${review.grnum};
						});
					</script>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
<script>
	$(".card").mouseover(function(){
		$(".card").css("border", "1px solid blue");
	});
	$(".card").mouseout(function(){
		$(".card").css("border", "1px solid white");
	});
</script>
</html>