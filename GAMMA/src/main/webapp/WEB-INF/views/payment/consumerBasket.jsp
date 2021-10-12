<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${basket}" var="basket">
		${basket.gname}
		${basket.gprice }
		<form action="/gamepayment/basketRemove" method="post">
			<input type="hidden" name="gnum" value="${basket.gnum}">
			<input type="submit" value="삭제">
		</form>
		<form action="/gamepayment/paymentsuccess" method="post">
			<input type="hidden" name="basket" value="${basket}"/>
			<input type="submit" value="결제하기"/>
		</form>
	</c:forEach>
</body>
</html>