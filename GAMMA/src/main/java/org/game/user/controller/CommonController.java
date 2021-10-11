package org.game.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CommonController {
	
	/*
	 * @GetMapping("/accessError") public void accessDenied(Authentication
	 * auth,Model model) {
	 * 
	 * log.info("접근거부 : "+ auth); model.addAttribute("errorMessage","접근 거부"); }
	 */
	
	/*
	 * @GetMapping("/customLogin") public void loginInput(String error,String
	 * logout,Model model) { log.info("error 여부 : "+error); log.info("logout 여부 : "
	 * + logout);
	 * 
	 * if(error !=null) {
	 * model.addAttribute("error","로그인 관련 에러 입니다. 계정 확인을 다시해주세요"); } if(logout !=
	 * null) { model.addAllAttribute("logout","로그아웃했습니다"); } }
	 */
		

}
