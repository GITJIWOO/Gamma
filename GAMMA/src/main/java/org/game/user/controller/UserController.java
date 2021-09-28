package org.game.user.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.game.user.domain.ConsumerVO;
import org.game.user.service.UserService;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {
	@Autowired
	private UserService service;

	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(ConsumerVO vo) {
		int result = service.idChk(vo);
		return result;
	}

	// 회원가입 get방식으로 접근여부 가능
	@GetMapping("/userjoin")
	public String userJoin() {
		return "/user/userjoin";
	}

	// 회원가입
	@PostMapping("/userjoin")
	public String userJoin(ConsumerVO userVO, RedirectAttributes rttr) {
		int result = service.idChk(userVO);

		if (result == 1) {
			return "/user/userjoin";
		} else if (result == 0) {
			String hashedPw =BCrypt.hashpw(userVO.getPassword(),BCrypt.gensalt());
			userVO.setPassword(hashedPw);
			service.userJoin(userVO);
			log.info("userVO : " + userVO);
			rttr.addFlashAttribute("msg","REGISTERED");
			rttr.addFlashAttribute("cnum", userVO.getCnum());
			rttr.addFlashAttribute("success", "userJoin");
		}
		return "redirect:/user/userlogin";
	}

	// 로그인 처리
	@PostMapping("/userlogin")
	public ModelAndView userLogin(HttpServletResponse response, @ModelAttribute ConsumerVO userVO)
			throws IOException {// input 창에 입력 받은 것을 memberVO에 저장.
		ModelAndView mav = new ModelAndView(); // 객체 생성후
		mav = service.userLogin(userVO, response); // service에 있는 메소드를 호출한 결과를 저장.
		return mav;
	}

}