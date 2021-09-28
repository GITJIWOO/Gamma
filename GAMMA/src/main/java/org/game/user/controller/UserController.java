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
import org.springframework.ui.Model;
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
	@GetMapping("/userJoin")
	public String userJoin() {
		log.info("주소감지");
		log.info("주소감지");
		log.info("주소감지");
		log.info("주소감지");
		return "user/userjoin";
	}

	// 회원가입
	@PostMapping("/userjoin")
	public String userJoin(ConsumerVO userVO, RedirectAttributes rttr) {
		int result = service.idChk(userVO);

		if (result == 1) {
			return "user/userjoin";
		} else if (result == 0) {
			String hashedPw =BCrypt.hashpw(userVO.getPassword(),BCrypt.gensalt());
			userVO.setPassword(hashedPw);
			service.userJoin(userVO);
			log.info("userVO : " + userVO);
			rttr.addFlashAttribute("msg","REGISTERED");
			rttr.addFlashAttribute("cnum", userVO.getCnum());
			rttr.addFlashAttribute("success", "userJoin");
		}
		return "redirect:user/userlogin";
	}
	// 로그인
	@PostMapping("/userlogin")
    public String userLogin(ConsumerVO userVO, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
        
        HttpSession session = req.getSession();
        ConsumerVO uservo = service.userLogin(userVO);
        
        if(userVO == null|| !BCrypt.checkpw(userVO.getPassword(), null)) {
            session.setAttribute("userVO", null);
            rttr.addFlashAttribute("msg", false);
        } else {
            session.setAttribute("userVO", userVO);
        }
        
        return "redirect:main";
    }
	@GetMapping("/usermodify")
    public String userModify(HttpServletRequest req, Model model, ConsumerVO memverVO){
        
        HttpSession session = req.getSession();
        
        ConsumerVO userVO = (ConsumerVO) session.getAttribute("userVO");
        ConsumerVO userModify = service.userModify(userVO.getCid());
        
        model.addAttribute("modifyId", userModify.getCid());
        model.addAttribute("modifyEmail", userModify.getEmail());
        model.addAttribute("modifyNick", userModify.getNickname());
        model.addAttribute("modifyPass", userModify.getPassword());
        
        return "userModify";    
    }




}