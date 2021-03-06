package org.game.gamelibrary.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.game.gamelibrary.domain.ResultLibraryVO;
import org.game.gamelibrary.service.GameLibraryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@PreAuthorize("hasAnyRole('ROLE_MEMBER')")
	@GetMapping("/conLibrary")
	public String consumerLibraryList(Principal principal, Model model) {
		
		String cid = principal.getName();
		
		List<ResultLibraryVO> library = libraryService.getAllConsumerLibrary(cid);
		
		model.addAttribute("cid", cid);
		model.addAttribute("library", library);
		
		return "/library/conLibrary";
	}
}
