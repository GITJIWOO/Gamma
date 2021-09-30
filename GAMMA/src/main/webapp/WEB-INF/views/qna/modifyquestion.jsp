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
	<h2>질문 수정</h2>
	질문 번호: ${param.qnum }
	로그인 계정: ${param.qwriter }
	질문 페이지번호: ${param.pageNum }
	<form action="/qna/modifyclear" method="post">
		<select name="qtype" required>
			<option value="" disabled>--유형을 선택하세요--</option>
			<option value="account"<c:if test="${vo.qtype eq '계정 및 내정보' }">selected</c:if>>계정 및 내정보</option>
			<option value="softngame"<c:if test="${vo.qtype eq '소프트웨어 및 게임' }">selected</c:if>>소프트웨어 및 게임</option>
			<option value="library"<c:if test="${vo.qtype eq '라이브러리' }">selected</c:if>>라이브러리</option>
			<option value="purchase"<c:if test="${vo.qtype eq '구매' }">selected</c:if>>구매</option>
			<option value="friends"<c:if test="${vo.qtype eq '친구' }">selected</c:if>>친구</option>
			<option value="chatting"<c:if test="${vo.qtype eq '채팅' }">selected</c:if>>채팅</option>
			<option value="app"<c:if test="${vo.qtype eq '어플리케이션' }">selected</c:if>>어플리케이션</option>
			<option value="etc"<c:if test="${vo.qtype eq '기타' }">selected</c:if>>기타</option>		
		</select><br>
		<input type="text" name="qtitle" value="${vo.qtitle }"/><br>
		<textarea rows="10" cols="50" name="qcontent">${vo.qcontent }</textarea><br>
		<input type="hidden" name="qnum" value="${vo.qnum }"/>
		<input type="hidden" name="qwriter" value="${param.qwriter }"/>
		<input type="hidden" name="pageNum" value="${param.pageNum }"/>
		<input type="submit" value="질문 수정"/><br>
	</form>	
</body>
</html>