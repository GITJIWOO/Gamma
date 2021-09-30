<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 상세 페이지</title>
<script>
	$(document).ready(function() {
		$("#btnUpdate").click(function() {
			// 확인 대화상자
			if (confirm("수정하시겠습니까?")) {
				document.form1.action = "localhost:8181/user/userModify";
				document.form1.submit();
			}
		});
	});
	$(document).ready(function() {
		$("#btnDelete").click(function() {
			//확인 대화 상자
			if (confirm("삭제하시겠습니까?")) {
				document.form1.action = "localhost:8181/user/userDelete"
				document.form1.submit();
			}
		});
	});
</script>
</head>
<body>
	<h2>회원 정보 상세</h2>
	<form name="form1" method="post">
		<table border="1" width="400px">
			<c:if test="${member eq 'kjw011231' }">
			<tr>
				<td>유저고유번호</td>
				<td><input  id="cnum" name="cnum" value="${dto.cnum}" readonly="readonly" ></td>
			</tr>
			</c:if>
			<tr>
				<td>아이디</td>
				<td><input id="cid" name="cid" value="${dto.cid} readonly="readonly"></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input id="nickname" name="nickname" value="${dto.nickname} readonly="readonly"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input id="email" name="email" value="${dto.email} readonly="readonly"></td>
			</tr>
			<tr>
				<td>회원가입일자</td>
				<td><fmt:formatDate value="${dto.userregdate} pattern="yyy-MM-dd" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>회원정보 수정일자</td>
				<td><fmt:formatDate value="${dto.userupdatedate} pattern="yyy-MM-dd" readonly="readonly"/></td>
			</tr>
		</table>
	</form>

</body>
</html>