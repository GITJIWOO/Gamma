package org.game.gameinfo.controller;

import java.lang.reflect.Field;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.game.gameinfo.domain.GameInfoPageDTO;
import org.game.gameinfo.domain.GameInfoVO;
import org.game.gameinfo.domain.GameSearchCriteria;
import org.game.gameinfo.domain.GameTagVO;
import org.game.gameinfo.domain.RequirementVO;
import org.game.gameinfo.service.GameInfoService;
import org.game.gameinfo.service.GameTagService;
import org.game.gameinfo.service.RequirementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/gameInfo/*")
@AllArgsConstructor
public class GameInfoController {

	@Autowired
	private GameInfoService gameInfoService;

	@Autowired
	private GameTagService gameTagService;

	@Autowired
	private RequirementService requirementService;

	// 게임 목록
	@GetMapping("/gamelist")
	public String gameList(GameSearchCriteria cri, Model model) {
		List<GameInfoVO> gameList = gameInfoService.getGameListPaging(cri);
		
		int total = gameInfoService.getTotalGame(cri);
		GameInfoPageDTO btnMaker = new GameInfoPageDTO(cri, total, 10);

		model.addAttribute("btnMaker", btnMaker);
		model.addAttribute("gameList", gameList);
		return "gameinfo/gamelist";
	}

	// 게임 등록 폼
	@PostMapping("/gameregister")
	public String register(GameInfoVO gvo, RedirectAttributes rttr) {
		// 배열, 리스트 만들고


//		System.out.println("게임 vo:" + gvo);
//		System.out.println("selectkey 전 : " + vo);
		gameInfoService.registerGame(gvo);
//		System.out.println("selectkey 후 : " + vo);
		gameTagService.registerTag(gvo);
		log.info("vo: " + gvo);
		System.out.println("vo: " + gvo);
		requirementService.registerRequirement(gvo);
//		System.out.println("vo: " + vo);

		rttr.addFlashAttribute("gname", gvo.getGname());
		rttr.addFlashAttribute("success", "register");

		return "redirect:/gameInfo/gamelist";
	}

	// get 방식 접속 /gameinfo/gameRegister
	@GetMapping("/gameregister")
	public String register() {
		return "/gameinfo/gameregister";
	}

	// 게임정보 조회
	@GetMapping("/get")
	public String get(@RequestParam("gnum") Long gnum, Model model, GameSearchCriteria cri){
		if (gnum == null) {
			return "redirect:/gameinfo/gamelist";
		}
		System.out.println("컨트롤러 조회로직 진입");
		GameInfoVO gvo = gameInfoService.getGame(gnum);
		GameInfoVO tvo = gameTagService.getTag(gnum);
//		Field[] str = tvoList.getClass().getDeclaredFields();
//		tvoList.addAll(19, gameTagService.getTag(gnum));
//		GameInfoVO str = tvoList.get(19);
		GameInfoVO rvo = requirementService.getRequirement(gnum);
		System.out.println("tvo: " + tvo);

		model.addAttribute("gvo", gvo);
		model.addAttribute("tvo", tvo);
		model.addAttribute("rvo", rvo);
//		model.addAttribute("str", str);

		return "/gameinfo/gameinfo";
	}

	// 게임삭제
	@PostMapping("/gameremove")
	public String remove(Long gnum, String gname,
			RedirectAttributes rttr) {
//		System.out.println("게임 삭제로직: " + gnum + "번");
		System.out.println("게임 삭제로직 진입");
		gameInfoService.removeGame(gnum);

		rttr.addFlashAttribute("success", "success");

		rttr.addFlashAttribute("gnum", gname);
		System.out.println("삭제 막줄");

		return "redirect:/gameInfo/gamelist";

	}

	// 게임수정 로직
	@PostMapping("/modify")
	public String modify(GameInfoVO gvo, RedirectAttributes rttr,
			GameSearchCriteria cri) {
//		log.info("게임수정 로직: " + vo);

		
			gameTagService.modifyTag(gvo);
		

		requirementService.modifyRequirement(gvo);
		gameInfoService.modifyGame(gvo);

		rttr.addAttribute("gnum", gvo.getGnum());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

//		return "redirect:/gameinfo/gameinfo";
		return "redirect:/gameInfo/get?" + gvo.getGnum();
	}

	// 수정폼
	@PostMapping("/modifyform")
	public String modifyForm(@RequestParam("gnum") Long gnum, Model model) {

		GameInfoVO tvo = gameTagService.getTag(gnum);
		GameInfoVO rvo = requirementService.getRequirement(gnum);
		GameInfoVO vo = gameInfoService.getGame(gnum);
		log.info(vo);

		model.addAttribute("tvo", tvo);
		model.addAttribute("rvo", rvo);
		model.addAttribute("gvo", vo);
//		model.addAttribute("tagname", tagname);

		return "/gameinfo/gamemodify";
	}

}// end class
