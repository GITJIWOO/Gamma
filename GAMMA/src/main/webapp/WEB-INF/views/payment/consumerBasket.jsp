<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<link rel="stylesheet" href="/resources/css/styles.css" />
<title>라이브러리</title>
</head>
<body>
	<c:forEach items="${basket}" var="basket">
		${basket.gname}
		${basket.gprice}
		<form action="/gamepayment/basketRemove" method="post">
			<input type="hidden" name="gnum" value="${basket.gnum}">
			<input type="submit" value="삭제">
		</form>
		<div class="paymentScreenBtn">
			<form action="/gamepayment/paymentscreen" method="get" class="payment">
				<input type="hidden" name="gnum" value="${basket.gnum}">
				<input type="hidden" name="gname" value="${basket.gname}">
				<input type="hidden" name="gprice" value="${basket.gprice}">
				<input type="hidden" name="merchant_uid" value="" id="merchant_uid">
				<input type="submit" value="결제하기" id="paymentSubmit"/>
			</form>
		</div>
	</c:forEach>
</body>
<script>
	
	let merchant = "";
	
	$(".paymentScreenBtn").on("click", "#paymentSubmit", function(){
		let time = new Date();
		merchant = String("order" + time.getTime());
		console.log(merchant);
		$(this).siblings("#merchant_uid").val(merchant);
	});
</script>
</html>