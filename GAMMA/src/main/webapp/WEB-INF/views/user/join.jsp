<!-- 재인 추가, 여기에 기존에 있는 회원가입 ui 붙여넣으면 될듯.. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/user/join" method="post">
		<input type="text" name="cid" placeholder="아이디를 입력해주세요." /><br>
		<input type="password" name="password" placeholder="비밀번호를 입력해주세요." /><br>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		<input type="email" name="email" placeholder="이메일을 입력해주세요." /><br>
		<input type="text" name="nickname" placeholder="닉네임을 입력해주세요." /><br>
		<input type="hidden" name="role" value="ROLE_MEMBER" />
		<input type="submit" value="JOIN" />
	</form>
</body>
</html>