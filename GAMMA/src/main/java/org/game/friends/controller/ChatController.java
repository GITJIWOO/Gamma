package org.game.friends.controller;
/*
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
*/
import org.springframework.stereotype.Controller;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ChatController {
	/*
	 * extends TextWebSocketHandler{
}
	
	private List<WebSocketSession> users;
	private Map<String, Object> userMap;
	
	public ChattingController() {
		users = new ArrayList<WebSocketSession>();
		userMap = new HashMap<String, Object>();
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		log.info("TextWebSocketHandler: 연결 생성");
		users.add(session);
	}
			
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		log.info("TextWebSocketHandler: 메시지 수신 완료");
		log.info("메시지: " + message.getPayload());
	}
	*/
	
}
