package org.game.friends.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ChatController extends TextWebSocketHandler{
	private List<WebSocketSession> users;
	private Map<String, Object> userMap;
}
