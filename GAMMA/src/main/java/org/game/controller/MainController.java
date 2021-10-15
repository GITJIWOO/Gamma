package org.game.controller;

import javax.servlet.http.HttpSession;

import org.game.user.domain.ConsumerVO;
import org.game.user.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/main/*")
@AllArgsConstructor
public class MainController {
	
	@Autowired
	private UserMapper userMapper;
	
	@GetMapping("/main")
	public String gammaMain(HttpSession session, Model model) {
		
		String cid = (String)session.getAttribute("session_cid");
		
		if(cid != null) {
			ConsumerVO consumer = userMapper.userGet(cid);
			model.addAttribute("consumer", consumer);
		}
		
		model.addAttribute("cid", cid);
		
		return "/main/main";
	}
}
