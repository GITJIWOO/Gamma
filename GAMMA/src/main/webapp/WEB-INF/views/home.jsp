<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="<c:url value="/resources/js/sockjs-0.3.4.js"/>"></script>
<script>
/*
	window.onload = function(){
		const sendBtn = document.getElementById("sendBtn");
		sendBtn.addEventListener("click", function(){
			sendMessage();
		});
		
		let sock;
		// socket을 지정한 url로 연결 
		sock = new SockJS("<c:url value='/echo'/>");
		
		// 데이터가 나에게 전달되면 자동으로 실행되는 function 
		sock.onmessage = onMessage;
		
		// 데이터를 끊고 싶을 때 실행하는 메서드
		sock.onclose = onClose;
		
		// socket으로 보냄
		function sendMessage(){
			const message = document.getElementById("message");
			sock.send(message).value;
		}
		
		// evt 파라미터는 websocket 을 보내준 데이터
		function onMessage(evt){
			let data = document.getElementById("data");
			console.log("data 확인: " + data);
			let evtdata = evt.data;
			console.log("evtdata 확인: " + evtdata);
			data.append(evtdata);
			data.append("<br>");
		}
		
		function onClose(evt){
			let data = document.getElementById("data");
			data.append("연결 끊김");
		}
	}
*/
		$(document).ready(function(){
			$("#sendBtn").click(function(){
				sendMessage();
			});
		});
		
		var sock;
		// socket을 지정한 url로 연결 
		sock = new SockJS("<c:url value='/echo'/>");
		
		// 데이터가 나에게 전달되면 자동으로 실행되는 function 
		sock.onmessage = onMessage;
		
		// 데이터를 끊고 싶을 때 실행하는 메서드
		sock.onclose = onClose;
		
		// socket으로 보냄
		function sendMessage(){
			sock.send($("#message").val());
		}
		
		// evt 파라미터는 websocket 을 보내준 데이터
		function onMessage(evt){
			var data = evt.data;
			$("#data").append(data + "<br>");
		}
		
		function onClose(evt){
			$("#data").append("연결 끊김")
		}
</script>
</head>
<body>
	<input type="text" id="message" />
	<input type="button" id="sendBtn" value="전송" />
	<div id="data"></div>
</body>
</html>