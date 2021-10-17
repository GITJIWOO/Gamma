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
			<textarea class="form-control" id="exampleFormControlTextarea1" name="grcontent" rows="7" cols="70" placeholder="내용" required></textarea><br/>
			<div id="isLike" class="btn btn-secondary">
				<input type="radio" class="isLike" name="grlike" value="1"><i class="far fa-thumbs-up fa-lg"> 추천</i>
			</div>
			<div id="notLike" class="btn btn-secondary">
				<input type="radio" class="notLike" name="grlike" value="0"><i class="far fa-thumbs-down fa-lg"> 비추천</i>
			</div>
			<input type="submit" class="btn btn-success" id="reviewWrite" value="작성">
		</form>
	</c:if>
</body>
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
</html>