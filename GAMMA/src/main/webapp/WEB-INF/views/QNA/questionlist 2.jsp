<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>No</th>
				<th>제목</th>
				<th>유형</th>
				<th>본문</th>
				<th>작성자</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${vo }" var="vo">
				<tr>
					<td>${vo.qnum }</td>
					<td>${vo.qtitle }</td>
					<td>${vo.qtype }</td>
					<td>${vo.qcontent }</td>
					<td>${vo.qwriter }</td>
					<td>${vo.qdate  }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<form action="/qna/modifyquestion" method="post">
		<input type="hidden" name="qnum" value="${vo.qnum }"/>
		<input type="submit" value="질문글 수정"/>
	</form>
	<form action="/qna/removequestion" method="post">
		<input type="hidden" name="qnum" value="${vo.qnum }"/>
		<input type="submit" value="질문글 삭제"/>
	</form>
</body>
</html>