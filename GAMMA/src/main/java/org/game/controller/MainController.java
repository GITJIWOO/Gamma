package org.game.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.game.gameinfo.domain.GameInfoVO;
import org.game.gameinfo.service.GameInfoService;
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
	
	@Autowired
	private GameInfoService gameInfoService;
	
	@GetMapping("/main")
	public String gammaMain(Principal principal, Model model) {
		
		String cid = principal.getName(); 
		
		List<GameInfoVO> latestGame = gameInfoService.latestGame();
		List<GameInfoVO> randomList = gameInfoService.randomList();
		List<GameInfoVO> actionList = gameInfoService.actionList();
		
		if(cid != null) {
			ConsumerVO consumer = userMapper.userGet(cid);
			model.addAttribute("consumer", consumer);
		}
		
		model.addAttribute("cid", cid);
		model.addAttribute("latestGame", latestGame);
		model.addAttribute("randomList", randomList);
		model.addAttribute("actionList", actionList);
		
		return "/main/main";
	}
}
