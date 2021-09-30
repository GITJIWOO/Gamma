package org.game.user.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.game.user.domain.ConsumerVO;
import org.game.user.service.UserService;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {
	 
	@Inject
	UserService service;
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(ConsumerVO vo) throws Exception {
		int result = service.idChk(vo);
		return result;
	}

	// 비밀번호 중복 체크
	@ResponseBody
	@RequestMapping(value = "/passChk", method = RequestMethod.POST)
	public boolean passChk(ConsumerVO userVO) throws Exception {

		ConsumerVO login=service.userLogin(userVO);
		boolean pwdChk = pwdEncoder.matches(userVO.getPassword(), login.getPassword());
		return pwdChk;
	}

	// 회원가입 get방식으로 접근여부 가능
	@GetMapping("/userJoin")
	public void getuserJoin() throws Exception {
		log.info("get방식회원가입접속");

	}

	// 회원가입
	@PostMapping("/userJoin")
	public String userJoin(ConsumerVO userVO) throws Exception {
		log.info("poset회원가입실행");
		int result = service.idChk(userVO);
		try {
			if (result == 1) {
				return "/user/userLogin";
			} else if (result == 0) {
				String inputPass=userVO.getPassword();
				String pwd=pwdEncoder.encode(inputPass);
				userVO.setPassword(pwd);
				service.userJoin(userVO);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/user/userLogin";
	}
	@GetMapping("/userLogin")
	public String userLogin() throws Exception {
		log.info("get방식로그인접속");
		return "/user/userLogin";
	}
	
	// 로그인
	@PostMapping("/userLogin")
	public String userLogin(ConsumerVO userVO,HttpSession session, RedirectAttributes rttr) throws Exception {
		log.info("로그인컨트롤실행");
		
		session.getAttribute("member");
		ConsumerVO login = service.userLogin(userVO);
		boolean pwdMatch = pwdEncoder.matches(userVO.getPassword(),login.getPassword());
		if (login == null && pwdMatch == true) {
			session.setAttribute("member", login);
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}

		return "redirect:/user/userLogin";
	}

	// 로그아웃 과 세션 초기화
	@GetMapping("/userLogout")
	public String userLogout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/user/userLogin";
	}

	// 겟으로 접근하는 수정창
	@GetMapping("/usermodify")
	public String userModify() throws Exception {
		return "user/userModify";
	}
	// post 회원정보 수정
	@PostMapping("/userModify")
	public String userModify(ConsumerVO userVO, HttpSession session) throws Exception {
		service.userModify(userVO);
		session.invalidate();
		return "redirect:userLogin";
	}

	// 회원 탈퇴 get
	@GetMapping("/userDelete")
	public String userDelete() throws Exception {
		return "user/userDelete";
	}

	// 회원 탈퇴 post
	@PostMapping("/userDelete")
	public String memberDelete(ConsumerVO uservo, HttpSession session, RedirectAttributes rttr) throws Exception {

		// 세션에 있는 member를 가져와 member변수에 넣어줍니다.
		ConsumerVO userVO = (ConsumerVO) session.getAttribute("useVO");
		// 세션에있는 비밀번호
		String sessionPass = userVO.getPassword();
		// vo로 들어오는 비밀번호
		String voPass = userVO.getPassword();

		if (!(sessionPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:user/userDelete";
		}
		service.userDelete(userVO);
		session.invalidate();
		return "redirect:userLogin";
	}

}