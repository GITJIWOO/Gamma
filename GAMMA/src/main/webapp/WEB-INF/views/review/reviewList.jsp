<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>${gameTitle} 리뷰</title>
</head>
<body>
	<div class="body">
		<form action="/gameinfo/" method="get">
			<input type="submit" value="돌아가기">
		</form>
		<form action="/review/reviewList/${gameNum}" method="get">
			<select name="listKind">
				<option value="" selected>정렬 기준</option>
				<option value="famous">인기 순</option>
				<option value="new">최신 순</option>
			</select>
			<input type="submit" value="적용">
		</form>
		<div id="review">
			<c:forEach var="review" items="${review}">
				<tr>
					<td>${review.cid}</td>
					<td>
						<c:choose>
							<c:when test="${review.grlike == 1}">추천</c:when>
							<c:when test="${review.grlike == 0}">비추천</c:when>
						</c:choose>
					</td>
					<td>
						<a href="/review/reviewDetail/${review.grnum}">${review.grtitle}</a>
					</td>
					<td>${review.grcontent}</td>
					<td>${review.grrecommend}</td>
					<td>${review.grdate}</td>
				</tr>
				<hr/>
			</c:forEach>
		</div>
	</div>
</body>
</html>