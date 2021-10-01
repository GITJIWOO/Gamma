package org.game.user.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.game.user.domain.ConsumerVO;
import org.game.user.service.UserService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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

		ConsumerVO login = service.userLogin(userVO);
		boolean pwdChk = pwdEncoder.matches(userVO.getPassword(), login.getPassword());
		return pwdChk;
	}
	//유저 상제정보창
	@PostMapping("/user/user")
	public String userView(String cid,Model model) {
		model.addAttribute("dto",service.userGet(cid));
		log.info("클릭한유저번호"+cid);
		return "/user/user";
	}

	// 회원가입 get방식으로 접근여부 가능
	@GetMapping("/userJoin")
	public String userJoin() throws Exception {
		log.info("get방식회원가입접속");
		return "/user/userJoin";

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
				String inputPass = userVO.getPassword();
				String pwd = pwdEncoder.encode(inputPass);
				userVO.setPassword(pwd);
				service.userJoin(userVO);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "/user/userHome";
	}

	/*
	 * @GetMapping("/userLogin") public String userLogin() throws Exception {
	 * log.info("get방식로그인접속"); return "/user/userLogin"; }
	 */

	// get로그인
	@GetMapping("/userLogin")
	public String userLogin() throws Exception {
		return "/user/userLogin";
	}

	// 로그인
	@PostMapping("/userLogin")
	public String userLogin(ConsumerVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
		log.info("로그인컨트롤실행");
		 session.getAttribute("member");
		ConsumerVO login = service.userLogin(vo);
		 boolean pwdMatch =
		 pwdEncoder.matches(vo.getPassword(),login.getPassword());
		 
		if (login == null && pwdMatch == true) {
			session.setAttribute("member", login);
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}

		return "/user/userHome";
	}

	// 로그아웃 과 세션 초기화
	@GetMapping("/userLogout")
	public String userLogout(HttpSession session) throws Exception {

		session.invalidate();

		return "/user/userHome";
	}

	// 겟으로 접근하는 수정창
	@GetMapping("/usermodify")
	public String userModify() throws Exception {
		return "user/userModify";
	}

	// post 회원정보 수정
	@PostMapping("/userModify")
	public String registerUpdate(ConsumerVO vo, HttpSession session) throws Exception{
		service.userModify(vo);
		session.invalidate();
		return "redirect:/user/userHome";
	}
	// 회원 탈퇴 get
	@GetMapping("/userDelete")
	public String userDelete() throws Exception {
		return "/user/userDelete";
	}

	// 회원 탈퇴 post
	@PostMapping("/userDelete")
	public String memberDelete(ConsumerVO userVO, HttpSession session, RedirectAttributes rttr) throws Exception {

		service.userDelete(userVO);
		session.invalidate();
		return "/user/userHome";
	}

}