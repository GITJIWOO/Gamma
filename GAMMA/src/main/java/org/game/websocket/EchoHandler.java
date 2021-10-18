package org.game.websocket;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;



public class EchoHandler extends TextWebSocketHandler {
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	/*

	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {		
		sessionList.add(session);
		logger.info("{} 연결됨", session.getId());	
	}	
	
	// client가 웹소켓 서버로 메시지 전송 시 실행되는 메서드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		for(WebSocketSession sess: sessionList) {
			sess.sendMessage(new TextMessage(session.getId()+": "+message.getPayload()));
		}
	}
		
	// client가 연결을 끊었을 때 실행되는 메서드 
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		logger.info("{} 연결 끊김", session.getId());
	}
*/
	
	// 로그인중인 개별유저
	Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	
	// client 연결 후에 실행되는 메서드 
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		// 접속한 유저의 http 세션 조회 
		String senderId = getMemberId(session);
		// 로그인중인 개별유저 저장
		users.put(senderId, session);
		sessionList.add(session);
		logger.info("{} 연결됨", "고유 식별자: " + session.getId() + " // cid: " + senderId);
	}
	
	// 클라이언트가 Data 전송
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("{}로부터 {} 받음", session.getId(), message.getPayload());
		String senderId = getMemberId(session);
		JsonParser parser = new JsonParser();
		
		String jsonString = message.getPayload();
		JsonElement element = parser.parse(jsonString);
		
		JsonObject latestMessage = element.getAsJsonObject().get("latestMessge").getAsJsonObject();
		latestMessage.addProperty("cid", senderId);
		String sendData = latestMessage.toString();
		System.out.println("=============>" + sendData);
		TextMessage result = new TextMessage(sendData);
		
		JsonArray targetList = element.getAsJsonObject().get("userList").getAsJsonArray();
		
		for(int i = 0; i < targetList.size(); i++) {
			String target = targetList.get(i).getAsString();
			System.out.println("=============>" + target);
			WebSocketSession targetSession = users.get(target);
			if(targetSession != null) {
				targetSession.sendMessage(result);
				System.out.println("=============>" + target + "에게 데이터 보냄");
			}
		}
	}
	
	// 추가) 연결 해제
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		String senderId = getMemberId(session);
		users.remove(senderId);
		sessionList.remove(session);
		logger.info("{} 연결 끊김", session.getId());
	}
	
	private String getMemberId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		String cid = (String) httpSession.get("cid");
		return cid == null? null: cid;
	}
}
