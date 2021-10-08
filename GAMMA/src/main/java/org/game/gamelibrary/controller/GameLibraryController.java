package org.game.gamelibrary.controller;

import java.util.List;

import org.game.gamelibrary.domain.ResultLibraryVO;
import org.game.gamelibrary.service.GameLibraryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/library/*")
@AllArgsConstructor
public class GameLibraryController {
	
	@Autowired
	private GameLibraryService libraryService;
	
	@GetMapping("/conLibrary/{cid}")
	public String consumerLibraryList(@PathVariable String cid, Model model) {
		
		List<ResultLibraryVO> library = libraryService.getAllConsumerLibrary(cid);
		
		model.addAttribute("library", library);
		
		return "/library/conLibrary";
	}
}
