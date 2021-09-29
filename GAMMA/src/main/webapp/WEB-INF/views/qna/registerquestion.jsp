 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 아직 테스트 못함 -->
	<h1>질문 입력창</h1>
	<form action="/qna/registerquestion" method="post">
		<!-- 유형: 계정 및 내정보, 소프트웨어 및 게임, 라이브러리, 구매, 친구, 채팅, 어플리케이션, 기타 -->
		<select name="qtype" required>
			<option value="" disabled selected>--유형을 선택하세요--</option>
			<option value="account">계정 및 내정보</option>
			<option value="softngame">소프트웨어 및 게임</option>
			<option value="library">라이브러리</option>
			<option value="purchase">구매</option>
			<option value="friends">친구</option>
			<option value="chatting">채팅</option>
			<option value="app">어플리케이션</option>
			<option value="etc">기타</option>		
		</select><br>
		<input type="hidden" name="qwriter" value="${vo.qwriter }" />
		<input type="text" name="qtitle" placeholder="제목을 입력해주세요"/><br>
		<textarea rows="10" cols="50" name="qcontent" placeholder="질문 할 내용을 입력해주세요"></textarea><br>
		<input type="submit" value="질문 등록"/><br>
	</form>
</body>
</html>