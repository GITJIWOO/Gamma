<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<meta charset="UTF-8">
<style>
	.card {
		width: 200px;
		height: 310px;
	}
</style>
<title>라이브러리</title>
</head>
<body>
	<c:forEach var="library" items="${library}">
		<div class="card" style="width: 200px;">
			<img src="..." class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title">${library.gname}</h5>
				<p class="card-text">${library.gcontent}</p>
				<a href="/gameInfo/get?gnum=${library.gnum}" class="btn btn-primary">상점 페이지</a>
			</div>
		</div>
	</c:forEach>
</body>
</html>