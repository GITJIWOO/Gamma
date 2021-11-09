package org.game.user.controller;

import java.security.Principal;

import org.springframework.lang.Nullable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/user/*")
@Controller
public class CommonController {
	// 재인 추가 
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("접근 거부: " + auth);
		model.addAttribute("errorMessage", "접근 거부");
	}
	
	@GetMapping("/customLogin")
	public String loginInput() {
		return "/user/customLogin";
	}
	
	@PreAuthorize("permitAll")
	@PostMapping("/customLogin")
	public String loginInput(String error, String logout, Model model) {
		log.info("error 여부: " + error);
		log.info("logout 여부: " + logout);
		if(error != null) {
			model.addAttribute("error", "로그인 관련 에러입니다. 계정 확인 후 다시 로그인해주세요.");
		}
		if(logout != null) {
			model.addAttribute("logout", "로그아웃 되었습니다.");
		}
		return "redirect:/main/main";
	}
	
	@GetMapping("/userLogout")
	public void logoutGet() {
		log.info("로그아웃 폼으로 이동");
	}
	
	@PostMapping("/userLogout")
	public void logOutPost() {
		log.info("로그아웃 요청 처리");
	}
}
