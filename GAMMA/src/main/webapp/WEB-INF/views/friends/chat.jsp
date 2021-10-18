<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	#chatArea{
		width: 200px;
		height: 100px;
		overflow-y: auto;
		border: 1px solid black;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="<c:url value="/resources/js/sockjs-0.3.4.js"/>"></script>
<script>
/*
 이전 내용 - 돌아감  
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
*/
var wsocket;

function connect(){
	wsocket = new WebSocket("ws://localhost:8181/echo");
	wsocket.onopen = onOpen;
	wsocket.onmessage = onMessage;
	wsocket.onclose = onClose;
}

function disconnect() {
	wsocket.close();
}

function onOpen(evt) {
	appendMessage("연결되었습니다.");
}

function onMessage(evt) {
	var data = evt.data;
	if (data.substring(0, 4) == "msg: ") {
		appendMessage(data.substring(4));
	}
}

function onClose(evt) {
	appendMessage("연결을 끊었습니다.");
}

function send() {
	var cid = $("#cid").val();
	var msg = $("#message").val();
	wsocket.send("msg:" + cid + ": " + msg);
	$("#message").val("");
}

function appendMessage(msg){
	$("#chatMessageArea").append(msg+"<br>");
	var chatAreaHeight = $("#chatArea").height();
	var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
	console.log('chatMessageArea.length: ' + $("#chatMessageArea").height());
	console.log('chatArea.length: ' + chatAreaHeight);
	$("#chatArea").scrollTop(maxScroll);
}

$(document).ready(function() {
	$('#message').keypress(function(event){
		var keycode = (event.keyCode ? event.keyCode : event.which);
		if(keycode == '13'){
			send();	
		}
		event.stopPropagation();
	});
	$("#sendBtn").click(function(){
		send();
	});
	$("#enterBtn").click(function(){
		connect();
	});
	$("#exitBtn").click(function(){
		disconnect();
	});
})
</script>
</head>
<body>
<!-- 
	<input type="text" id="message" />
	<input type="button" id="sendBtn" value="전송" />
	<div id="data"></div>
 -->
 cid: ${cid }
<input type="text" id="cid" value="${cid }"/>
<input type="button" id="enterBtn" value="채팅방 입장" />
<input type="button" id="exitBtn" value="채팅방 나가기" />

<h1>채팅창</h1>
<div id="chatArea"><div id="chatMessageArea"></div></div>
<input type="text" id="message">
<input type="button" id="sendBtn" value="전송"/>
</body>
</html>