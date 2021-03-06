package org.game.user.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;
//재인 추가
@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		log.warn("로그인 성공");
		// admin의 권한이 2개이기 때문에 list 생성
		List<String> roleList = new ArrayList<>();
		for(GrantedAuthority role : authentication.getAuthorities()) {
			roleList.add(role.getAuthority());
		}
		
		log.warn("부여받은 권한들: " + roleList);
		if(roleList.contains("ROLE_ADMIN")) {
			response.sendRedirect("/main/main");
			return;
		}
		if(roleList.contains("ROLE_MEMBER")) {
			response.sendRedirect("/main/main");
			return;
		}
		response.sendRedirect("/");
	}
	
}