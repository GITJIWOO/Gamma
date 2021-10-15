<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<style type="text/css">
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
	height: 600px;
}

.bottom1 {
	height: 300px;
}

.bottom2 {
	height: 300px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<!--top-->
		<div class="top">
			<span>${gvo.gname }</span>
		</div>

		<!--middle-->
		<div class="mid">

			<div class="midLeft">${gvo.gsite }</div>

			<div class="midRight">

				<div class="mid1">사진</div>
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
						<br>
						<div class="row">
							<div class="col-md">이 제품의 태그</div>

						</div>
						<div class="col-md">${tvo.tagname}</div>
					</div>
				</div>
			</div>
		</div>
		
		<form action="/gameInfo/modifyform" method="post">
		<input type="hidden" name="gnum" value="${gvo.gnum }"> 
		<input type="hidden" name="pageNum" value="${param.pageNum }"> 
		<input type="hidden" name="searchType" value="${param.searchType }">
		<input type="hidden" name="keyword" value="${param.keyword }">
		<input type="submit" value="수정하기">
	</form>
	
	<form action="/gameInfo/gameremove" method="post" id="deleteForm">
		<input type="hidden" name="gnum" value="${gvo.gnum }"> <input
			type="button" value="삭제하기" onclick="confirm_delete();">
	</form>
	
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
						<div class="col-md-10">>${rvo.gprocessor }</div>
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
				비슷한 제품 더보기
				<hr>

			</div>
		</div>
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
</body>
</html>