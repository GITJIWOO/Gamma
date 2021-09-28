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
	public int idChk(ConsumerVO vo) throws Exception {
		int result = service.idChk(vo);
		return result;
	}
	// 비밀번호 중복 체크
	@ResponseBody
	@RequestMapping(value = "/passChk", method = RequestMethod.POST)
	public int passChk(ConsumerVO vo) throws Exception {
		int result = service.passChk(vo);
		return result;
	}

	// 회원가입 get방식으로 접근여부 가능
	@GetMapping("/userJoin")
	public void getuserJoin() throws Exception {
		log.info("get방식회원가입접속");
		
	}

	// 회원가입
	@PostMapping("/userJoin")
	public String userJoin(ConsumerVO userVO) throws Exception {
		int result = service.idChk(userVO);
		try {
			if(result == 1) {
				return "/user/userJoin";
			}else if(result == 0) {
				service.userJoin(userVO);
			}
			} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:user/userLogin";
	}
	// 로그인
	@PostMapping("/userLogin")
    public String userLogin(ConsumerVO userVO, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
        
        HttpSession session = req.getSession();
        ConsumerVO uservo = service.userLogin(userVO);
        
        if(userVO == null|| !BCrypt.checkpw(userVO.getPassword(), null)) {
            session.setAttribute("userVO", null);
            rttr.addFlashAttribute("msg", false);
        } else {
            session.setAttribute("userVO", userVO);
        }
        
        return "redirect:/main";
    }
	@GetMapping("/usermodify")
    public String userModify(HttpServletRequest req, Model model, ConsumerVO memverVO){
        
        HttpSession session = req.getSession();
        
        ConsumerVO userVO = (ConsumerVO) session.getAttribute("userVO");
       // ConsumerVO userModify = service.userModify(userVO.getCid());
        
		/*
		 * model.addAttribute("modifyId", userModify.getCid());
		 * model.addAttribute("modifyEmail", userModify.getEmail());
		 * model.addAttribute("modifyNick", userModify.getNickname());
		 * model.addAttribute("modifyPass", userModify.getPassword());
		 */
        return "userModify";    
    }




}