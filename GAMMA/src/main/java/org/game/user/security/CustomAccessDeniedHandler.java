package org.game.user.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.log4j.Log4j;
// 재인 추가
@Log4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler{
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		log.error("접근 거부 에러페이지 커스텀");
		log.error("/user/accessError 로 리다이렉트됨" );
		response.sendRedirect("/user/accessError");
	}
	
}



//implements AccessDeniedHandler {
	/*
	 * @Override public void handle(HttpServletRequest request, HttpServletResponse
	 * response, AccessDeniedException accessDeniedException) throws
	 * IOException,ServletException{
	 * 
	 * log.error("커스텀 접근 거부 핸들러 실행"); log.error("/accessError 페이지로 리다이렉트");
	 * response.sendRedirect("/accessError"); }
	 */

