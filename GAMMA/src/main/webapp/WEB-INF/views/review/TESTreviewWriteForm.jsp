<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>리뷰 남기기 폼 테스트</title>
</head>
<body>
	<c:if test="${라이브러리에 게임 보유 여부 확인}">
		<form action="/review/reviewWrite" method="post">
			<input type="hidden" name="cid" value="${cid}">
			<input type="text" name="grtitle" placeholder="제목" required><br/>
			<textarea name="grcontent" rows="10" cols="15" placeholder="내용" required></textarea><br/>
			<button type="button" id="reviewLike" name="grlike" value="1" class="btn btn-primary">추천</button>
			<button type="button" id="reviewLike" name="grlike" value="0" class="btn btn-danger">비추천</button>
			<input type="submit" class="btn btn-secondary" id="reviewWrite" value="작성">
		</form>
	</c:if>
</body>
<script>
	$("#reviewWrite").click(function(){
		if($("#reviewLike") === null) {
			alert("평가를 선택하십시오");
			return false;
		}
	});
</script>
</html>