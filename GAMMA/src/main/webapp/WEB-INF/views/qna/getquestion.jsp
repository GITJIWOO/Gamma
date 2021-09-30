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
	<h2>질문 상세</h2>
	질문 번호: ${param.qnum }
	로그인 계정: ${param.qwriter }
	질문 페이지번호: ${param.pageNum }
	<table class="table">
		<tr>
			<th>번호</th>
			<td>${vo.qnum }</td>
		</tr>
		<tr>
			<th>유형</th>
			<td>${vo.qtype }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${vo.qtitle }</td>
		</tr>
		<tr>
			<th>본문</th>
			<td>${vo.qcontent }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.qwriter }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${vo.qdate }</td>
		</tr>
	</table>
	<c:if test="${admin == 1 }">
		<form action="/qna/registeranswer" method="post">
			<input type="hidden" name="qnum" value="${vo.qnum }"/>
			<input type="hidden" name="qwriter" value="${param.qwriter }"/>
			<input type="hidden" name="pageNum" value="${param.pageNum }"/>
			<input type="submit" value="답변작성"/>
		</form>
	</c:if>
	<a href="/qna/questionlist?qwriter=${param.qwriter }&pageNum=${param.pageNum }"><button>질문 목록</button></a>
	<form action="/qna/modifyquestion" method="post">
		<input type="hidden" name="qnum" value="${vo.qnum }"/>
		<input type="hidden" name="qwriter" value="${param.qwriter }"/>
		<input type="hidden" name="pageNum" value="${param.pageNum }"/>
		<input type="submit" value="질문 수정"/>
	</form>
	<c:if test="${admin == 0 }">
		<form action="/qna/removequestion" method="post">
			<input type="hidden" name="qnum" value="${vo.qnum }"/>
			<input type="hidden" name="qwriter" value="${param.qwriter }"/>
			<input type="submit" value="질문 삭제"/>
		</form>
	</c:if>
</body>
</html>