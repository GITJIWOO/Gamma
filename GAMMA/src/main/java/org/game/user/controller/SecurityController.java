package org.game.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/user/*")
@Controller
public class SecurityController {
	@GetMapping("/all")
	public void doAll() {
		log.info("모든 사용자 접속 가능 - all");
	}
	@GetMapping("/member")
	public void doMember() {
		log.info("회원 접속 가능 - member");
	}
	@GetMapping("/admin")
	public void doAdmijn() {
		log.info("운영자만 접속 가능 - admin");
	}
	/* 시큐리티
	 * @GetMapping("/all") public void doAll() { log.info("모든사람이 접속가능한 all 로직"); }
	 * 
	 * @GetMapping("/member") public void doMember() {
	 * log.info("회원들이 접속가능한 member로직");
	 * 
	 * }
	 * 
	 * @GetMapping("/admin") public void doAdmin() {
	 * log.info("운영자만 접속 가능한 admin 로직"); }
	 */

}
