<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


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