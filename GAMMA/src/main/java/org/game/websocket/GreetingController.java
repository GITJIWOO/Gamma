package org.game.websocket;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.HtmlUtils;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class GreetingController {

	// 해당 주소로 메시지가 전송되는 경우 인사말 greeting()메서드가 호출됨
	@MessageMapping("/hello")
	@SendTo("/topic/greetings")
	public Greeting greeting(HelloMessage message) throws Exception{
		Thread.sleep(1000); // 1초 딜레이
		// Greeting 객체를 반환 - @SendTo 의 모든 사람에게 브로드 캐스트
		return new Greeting("Hello, " + HtmlUtils.htmlEscape(message.getName()) + "!");
	}
}
