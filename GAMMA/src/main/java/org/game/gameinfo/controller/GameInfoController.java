package org.game.gameinfo.controller;

import org.game.gameinfo.service.GameInfoService;
import org.game.gameinfo.service.GameTagService;
import org.game.gameinfo.service.RequirementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/gameInfo/*")
@AllArgsConstructor
public class GameInfoController {
	
//	@Autowired
//	private GameInfoService gameInfoService;
//	
//	@Autowired
//	private GameTagService gameTagService;
//	
//	@Autowired
//	private RequirementService requirementService;
//	
//	@GetMapping("/gameList")
//	public String gameList() {
//		return null;
//		
//	}
}
