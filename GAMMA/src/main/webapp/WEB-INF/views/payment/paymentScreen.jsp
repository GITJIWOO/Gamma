<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>결제 화면</title>
	<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
<script>

	function requestPay() {
	  IMP.request_pay(param, callback) // 결제창 호출
	  IMP.request_pay({ // param
	      pg: "html5_inicis",
	      pay_method: "card",
	      merchant_uid: "ORD20180131-0000011",
	      name: "노르웨이 회전 의자",
	      amount: 64900,
	      buyer_email: "gildong@gmail.com",
	      buyer_name: "홍길동",
	      buyer_tel: "010-4242-4242",
	      buyer_addr: "서울특별시 강남구 신사동",
	      buyer_postcode: "01181"
	  }, function (rsp) { // callback
	      if (rsp.success) {
	    	  
	      } else {
			  
	      }
	  });
	}

</script>
</body>
</html>