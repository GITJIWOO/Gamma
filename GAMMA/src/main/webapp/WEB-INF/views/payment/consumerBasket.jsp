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
	${basket}
	<form action="/gamepayment/paymentsuccess" method="post">
		<select name="boardVoList[0].boardType" >
				<c:forEach items="${basket}" var="list">
					<option value="${list.codeId}">${list.codeName}</option>
				</c:forEach>
		</select>
		<input type="hidden" name="basket" value="${basket}"/>
		<input type="submit" value="결제하기"/>
	</form>
</body>
</html>