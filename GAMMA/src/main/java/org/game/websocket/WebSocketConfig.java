package org.game.websocket;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
// 메시지 처리 활성화 
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
	
	@Override
	// 메시지 브로커 구성 
	public void configureMessageBroker(MessageBrokerRegistry config) {
		// 메시지를 받는 쪽의 주소 
		config.enableSimpleBroker("/topic");
		/* @MessageMapping에 작성된 모든 메시지 매핑 정의 
		 * /app/hello는 GreetingController.greeting() 메서드가 처리되도록 매핑된 endpoint
		 */
		config.setApplicationDestinationPrefixes("/app");
	}
	
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		/* socket 에 연결할 수 있는 주소 
		 * /gs-guide-websocket 를 endpoint로 등록해 웹소켓을 사용할 수 없는 경우
		 * 대체 전송을 사용할 수 있도록 SockJS 예비옵션을 활성화
		 */
		registry.addEndpoint("/gs-guide-websocket").withSockJS();
	}
}
