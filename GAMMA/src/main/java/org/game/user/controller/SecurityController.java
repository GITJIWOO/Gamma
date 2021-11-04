package org.game.user.controller;
// 회원가입과 로그인 로직은 여기서
import java.util.ArrayList;

import org.game.user.domain.AuthVO;
import org.game.user.domain.ConsumerVO;
import org.game.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/user")
public class SecurityController {
	
	@Autowired
	private UserService service;
	
	@Autowired
	private PasswordEncoder pwen;
	
	//@PreAuthorize("permitAll")
	@GetMapping("/join")
	public void joinForm() {
		System.out.println("회원가입창으로 접속");
	}
	
	@PreAuthorize("permitAll")
	@PostMapping("/join")
	public String join(ConsumerVO vo, String role) {
		// 어떤 데이터가 들어오는지 확인
		//System.out.println("vo: " + vo);
		//System.out.println("role: " + role);
		// 비밀번호 암호화
		String beforeCrPw = vo.getPassword();
		vo.setPassword(pwen.encode(beforeCrPw));
		
		vo.setAuthList(new ArrayList<AuthVO>());
		vo.getAuthList().add(new AuthVO());
		vo.getAuthList().get(0).setCid(vo.getCid());
		vo.getAuthList().get(0).setAuth(role);
		//System.out.println("autolist: " + vo.getAuthList());
		
		service.insertConsumer(vo);
		return "/user/customLogin";
	}
	
	@GetMapping("/all")
	public void doAll() {
		log.info("모든 사용자 접속 가능 - all");
	}
	
	// security-context에서 인터셉트 사용안하고 어노테이션으로 처리
	//@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
	@GetMapping("/member")
	public void doMember() {
		log.info("회원 접속 가능 - member");
	}
	
	//@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@GetMapping("/admin")
	public void doAdmijn() {
		log.info("운영자만 접속 가능 - admin");
	}


}
