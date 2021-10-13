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
	body {
		padding: 30px;
	}
	.card {
		background-color: gainsboro;
		border: 1px solid white;
		margin: 15px;
		padding: 1px;
		height: auto;
		float: left;
	}
	
	a:hover {
		color: dimgray;
	}
	.link {
		margin-bottom: 10px;
	}
	.gameTitle {
		font-size: 180%;
		color: black;
	}
	.reviewLink {
		font-size: 120%;
		color: black;
	}
	.option {
		background-color: darkgray;
	}
</style>
</head>
<body>
	<div class="body">
		<div class="link">
			<a href="/gameInfo/get/${game.gnum}" class="gameTitle">${game.gname}</a>
			> <a href="/review/reviewList/${game.gnum}" class="reviewLink">리뷰</a>
		</div>
		<div class="option">
			<form action="/review/reviewList/${game.gnum}" method="get">
				<select name="listKind">
					<option value="" selected>정렬 기준</option>
					<option value="famous">인기 순</option>
					<option value="new">최신 순</option>
				</select>
				<input type="submit" value="적용">
			</form>
		</div>
		<div id="review row">
			<c:forEach var="review" items="${review}">
				<div class="reviewCard col-md-5">
					<div class="card" data-grnum="${review.grnum}">
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
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
<script>
	$(".reviewCard").on("click", ".card", function(e){
		let reviewCard = $(this);
		let grnum = parseInt(reviewCard.attr("data-grnum"));
		location.href = "/review/reviewDetail/" + grnum;
	});
	
	$(".reviewCard").on("mouseover", ".card", function(){
		$(this).css("border", "1px solid dodgerblue");
	});
	$(".reviewCard").on("mouseout", ".card", function(){
		$(this).css("border", "1px solid white");
	});
</script>
</html>