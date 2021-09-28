<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<!-- 검색창 - 관리자만 볼 수 있음 -->
	<form>
		<select name="searchType">
			<option value="" disabled selected>--작성자 아이디 혹은 닉네임--</option>
		</select>
		<input type="text" name="keyword" value="${vo.qwriter }" placeholder="작성자 아이디 혹은 닉네임"/>
		<input type="submit" value="검색"/>
	</form>
	<table>
		<thead>
			<tr>
				<th>No</th>
				<th>유형</th>
				<th>제목</th>
				<th>본문</th>
				<th>작성자</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${vo }" var="vo">
				<tr>
					<td>${vo.qnum }</td>
					<td>${vo.qtype }</td>
					<td><a href="/board">${vo.qtitle }</a></td>
					<td>${vo.qcontent }</td>
					<td>${vo.qwriter }</td>
					<td>${vo.qdate  }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 페이징 처리 -->
	<nav aria-label="...">
	  <ul class="pagination">
	    <li class="page-item">
	      <a class="page-link">Previous</a>
	    </li>
	    <li class="page-item">
	    	<a class="page-link" href="#">1</a>
	    </li>
	    <li class="page-item active" aria-current="page">
	      <a class="page-link" href="#">2</a>
	    </li>
	    <li class="page-item">
	      <a class="page-link" href="#">Next</a>
	    </li>
	  </ul>
	</nav>	
	<form action="/qna/modifyquestion" method="post">
		<input type="hidden" name="qnum" value="${vo.qnum }"/>
		<input type="submit" value="질문글 수정"/>
	</form>
	<form action="/qna/removequestion" method="post">
		<input type="hidden" name="qnum" value="${vo.qnum }"/>
		<input type="submit" value="질문글 삭제"/>
	</form>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>