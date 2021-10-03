<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	const ws;
	const userid = '${param.cid}';	// 본인 아이디
	function connect(){
		// websocket 객체 생성, 핸들러 등록(연결 생성, 메시지 수신, 연결 종료)
		ws = new WebSocket('ws://localhost:8181/friends/chat');
		ws.onopen = function(){
			console.log('연결 생성');
			registerChat();
		};
		ws.onmessage = function(e){
			console.log('메시지 수신');
			const data = e.data;
			addChat(data);
		};
		ws.onclose = function(){
			console.log('연결 종료');
		};
	}
	
	// 채팅
	function addChat(msg){
		let chat = $('#chatbox').val();
		chat = chat + '\n상대방: ' + msg;
		$('#chatbox').val(chat);
	}
	
	function registerChat(){
		const msg = {
			type: "registerChat",
			userid: '${param.id}'
		};
		ws.send(JSON.stringify(msg));
	}
	
	function sendChat(){
		const msg = {
			type: "sendChat",
			target: $("chatuser").val(),
			message: $('#chattext').val()
		};
		ws.send(JSON.stringify(msg));
	}
	
	$(function(){
		connect();
		$('#chatbtn').on("click", function(){
			let chat = $("#chatbox").val();
			chat = chat + "\n나: " + $("#chattext").val();
			$("#chatbox").val(chat);
			sendChat();
			$("#chattext").val("");
		})
	});
</script>
</head>
<body>
	<!-- 채팅창 -->
	<textarea rows="10" cols="50" id="chatbox"></textarea>
	<!-- 메시지 입력창 -->
	<input type="text" id="chattext" />
	<!-- 상대방 아이디 작성(삭제할 수도 있음) -->
	<input type="text" id="chatuser" />
	<input type="submit" value="send" id="chatbtn"/>
</body>
</html>