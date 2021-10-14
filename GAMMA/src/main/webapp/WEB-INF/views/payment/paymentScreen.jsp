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
	if(${merchant_uid ne null}){
		requestPay();
	}
	
	function requestPay() {
		IMP.init('imp54386294');
	    IMP.request_pay({ // param
	        pg: "html5_inicis",
	        pay_method: "card",
	        merchant_uid: "${merchant_uid}",
	        name: "${basket.gname}",
	        amount: ${basket.gprice},
	        buyer_email: "gildong@gmail.com",
	        buyer_name: "홍길동",
	        buyer_tel: "010-4242-4242",
	        buyer_addr: "서울특별시 강남구 신사동",
	        buyer_postcode: "01181"
	    }, function (rsp) { // callback
	        if (rsp.success) { // 성공시 실행문
	        	$.ajax({
	        		url: "/gamepayment/paymentsuccess",
	        		type: "POST",
		        	headers: {
		        		"Content-Type":"application/json",
		        		"X-HTTP-Method-Override":"POST"
		        	},
	        		data: JSON.stringify ({
	        			gname : ${basket.gname},
	        			gprice : ${basket.gprice},
	        			merchant_uid : ${merchant_uid}
	        		}),
	        		dataType: "text",
	        		success: function(){
			        	alert("결제가 완료되었습니다.");
	        		}
	        	});
	        } else { // 실패시 실행문
	        	alert("결제가 취소되었습니다.");
	    		location.href = "/main/main";
	        }
	    });
	}
</script>
</body>
</html>