<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원정보 상세 페이지</title>
</head>
<body>
	<h2>회원 정보 상세</h2>
	<form name="form1" method="post">
		<table border="1" width="400px">
			<c:if test="${member eq 'kjw011231' }">
			<tr>
				<td>유저고유번호</td>
				<td><input  id="cnum" name="cnum" value="${member.cnum}" readonly="readonly" ></td>
			</tr>
			</c:if>
			<tr>
				<td>아이디</td>
				<td><input id="cid" name="cid" value="${member.cid}" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input id="nickname" name="nickname" value="${member.nickname}" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input id="email" name="email" value="${member.email}" readonly/></td>
			</tr>
			<tr>
				<td>회원가입일자</td>
				<td><fmt:formatDate value="${member.userregdate}" pattern="yyy-MM-dd"  /></td>
			</tr>
			<tr>
				<td>회원정보 수정일자</td>
				<td><fmt:formatDate value="${member.userupdatedate}" pattern="yyy-MM-dd" /></td>
			</tr>
		</table>
	</form>
	
<c:if test="${member != null}"><a href="/user/userLogout">로그아웃</a></c:if>
		<c:if test="${member == null}"><a href="/user/userLogin">로그인</a></c:if>
		<c:if test="${member != null}"><a href="/user/userModify">유저수정</a></c:if>
		<c:if test="${member != null}"><a href="/user/userDelete">탈퇴</a></c:if>
		<c:if test="${member != null}"><a href="/user/userGet">상세창</a></c:if>
		
		<hr>
	
</body>
</html>