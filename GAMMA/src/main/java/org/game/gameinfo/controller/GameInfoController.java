package org.game.gameinfo.controller;

import java.lang.reflect.Field;
import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.game.gameinfo.domain.GameInfoPageDTO;
import org.game.gameinfo.domain.GameInfoVO;
import org.game.gameinfo.domain.GameSearchCriteria;
import org.game.gameinfo.domain.GameTagVO;
import org.game.gameinfo.domain.RequirementVO;
import org.game.gameinfo.service.GameInfoService;
import org.game.gameinfo.service.GameTagService;
import org.game.gameinfo.service.RequirementService;
import org.game.gamelibrary.domain.GameLibraryVO;
import org.game.gamelibrary.service.GameLibraryService;
import org.game.review.domain.ReviewVO;
import org.game.review.service.ReviewService;
import org.game.user.domain.ConsumerBasketVO;
import org.game.user.domain.ConsumerVO;
import org.game.user.mapper.UserMapper;
import org.game.user.service.ConsumerBasketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
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

	@Autowired
	private GameLibraryService libraryService;

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private ConsumerBasketService basketService;
	
	@Autowired
	private UserMapper userMapper;

	// 게임 목록
	@GetMapping("/gamelist")
	public String gameList(GameSearchCriteria cri, Model model, Principal principal) {

		// 세션 아이디, 어드민
		if(principal != null) {
			String cid = principal.getName();
			model.addAttribute("cid", cid);
			if(cid != null) {
				ConsumerVO consumer = userMapper.userGet(cid);
				model.addAttribute("consumer", consumer);
			}
		}

		List<GameInfoVO> gameList = gameInfoService.getGameListPaging(cri);

		int total = gameInfoService.getTotalGame(cri);
		GameInfoPageDTO btnMaker = new GameInfoPageDTO(cri, total, 10);

		model.addAttribute("btnMaker", btnMaker);
		model.addAttribute("gameList", gameList);
//		model.addAttribute("cid", cid);
//		model.addAttribute("cadmin", cadmin);
		return "gameinfo/gamelist";
	}

	@GetMapping("/totallistbytag")
	public String listbytag(Model model, GameInfoVO vo, Principal principal) {
		// 세션 아이디, 어드민
		if(principal != null) {
			String cid = principal.getName();
			model.addAttribute("cid", cid);
			if(cid != null) {
				ConsumerVO consumer = userMapper.userGet(cid);
				model.addAttribute("consumer", consumer);
			}
		}
		
		List<GameInfoVO> tagList = gameInfoService.totalListByTag(vo.getTagname());

		model.addAttribute("tagList", tagList);
//		model.addAttribute("cid", cid);
//		model.addAttribute("cadmin", cadmin);

		return "gameinfo/taglist";
	}

	// 게임 등록 폼
	@PostMapping("/gameregister")
	public String register(Model model, GameInfoVO gvo, RedirectAttributes rttr, Principal principal) {
		// 세션 아이디, 어드민
		if(principal != null) {
			String cid = principal.getName();
			model.addAttribute("cid", cid);
			if(cid != null) {
				ConsumerVO consumer = userMapper.userGet(cid);
				model.addAttribute("consumer", consumer);
			}
		}

//		try {
//			gameInfoService.registerGame(gvo);
//			gameTagService.registerTag(gvo);
//			requirementService.registerRequirement(gvo);
//		} catch (Exception e) {
//			System.out.println("catch 진입");
//			e.printStackTrace();
//			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//		}
		gameInfoService.registerGame(gvo);

		log.info("vo: " + gvo);
		System.out.println("vo: " + gvo);

		rttr.addFlashAttribute("gname", gvo.getGname());
//		rttr.addFlashAttribute("success", "register");

		return "redirect:/gameInfo/gamelist";
	}

	// get 방식 접속 /gameinfo/gameRegister
	@GetMapping("/gameregister")
	public String register(Principal principal, Model model) {
		// 세션 아이디, 어드민
		if(principal != null) {
			String cid = principal.getName();
			model.addAttribute("cid", cid);
			if(cid != null) {
				ConsumerVO consumer = userMapper.userGet(cid);
				model.addAttribute("consumer", consumer);
			}
		}

//		model.addAttribute("cid", cid);
//		model.addAttribute("cadmin", cadmin);
		return "/gameinfo/gameregister";
	}

	// 게임정보 조회
	@GetMapping("/get")
	public String get(@RequestParam("gnum") Long gnum, Model model, GameSearchCriteria cri, Principal principal) {
		if (gnum == null) {
			return "redirect:/gameinfo/gamelist";
		}
		System.out.println("컨트롤러 조회로직 진입");

		// 세션 아이디, 어드민
		if(principal != null) {
			String cid = principal.getName();
			model.addAttribute("cid", cid);
			
			if(cid != null) {
				ConsumerVO consumer = userMapper.userGet(cid);
				model.addAttribute("consumer", consumer);
				
				ReviewVO getReview = reviewService.getUserReviewDetail(cid, gnum);
				GameLibraryVO lvo = libraryService.getOneConsumerLibrary(cid, gnum);
				List<ReviewVO> reviewList = reviewService.getFamousReview(gnum);
				System.out.println("reviewList: " + reviewList);
				ConsumerBasketVO basket = basketService.getOneConsumerBasket(cid, gnum);
				model.addAttribute("getReview", getReview);
				System.out.println("getreview: " + getReview);
				model.addAttribute("lvo", lvo);
				model.addAttribute("reviewList", reviewList);
				model.addAttribute("basket", basket);
			}
		}

		GameInfoVO gvo = gameInfoService.getGame(gnum);
		GameInfoVO tvo = gameTagService.getTag(gnum);
		GameInfoVO rvo = requirementService.getRequirement(gnum);

		System.out.println("gnum" + gnum);

//		if (cid != null) {
//			ReviewVO getReview = reviewService.getUserReviewDetail(cid, gnum);
//			GameLibraryVO lvo = libraryService.getOneConsumerLibrary(cid, gnum);
//			List<ReviewVO> reviewList = reviewService.getFamousReview(gnum);
//			System.out.println("reviewList: " + reviewList);
//			ConsumerBasketVO basket = basketService.getOneConsumerBasket(cid, gnum);
//			model.addAttribute("getReview", getReview);
//			System.out.println("getreview: " + getReview);
//			model.addAttribute("lvo", lvo);
//			model.addAttribute("reviewList", reviewList);
//			model.addAttribute("basket", basket);
//		}

		List<GameInfoVO> listByTag = gameInfoService.listByTag(tvo.getTagname());
		System.out.println("tvo: " + tvo);

		model.addAttribute("gvo", gvo);
		model.addAttribute("tvo", tvo);
		model.addAttribute("rvo", rvo);
		model.addAttribute("listByTag", listByTag);

		return "/gameinfo/gameinfo";
	}

	// 게임삭제
//	@Transactional
	@PostMapping("/gameremove")
	public String remove(Model model, Long gnum, String gname, RedirectAttributes rttr, Principal principal) {

		// 세션 아이디, 어드민
		if(principal != null) {
			String cid = principal.getName();
			String admin = principal.getName();
			model.addAttribute("cid", cid);
			if(cid != null) {
				ConsumerVO consumer = userMapper.userGet(cid);
				model.addAttribute("consumer", consumer);
			}else if (admin != null) {
				ConsumerVO cadmin = userMapper.userGet(admin);
				model.addAttribute("admin", admin);
			}
		}

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
	public String modify(Model model, GameInfoVO gvo, RedirectAttributes rttr, GameSearchCriteria cri, Principal principal) {
//		log.info("게임수정 로직: " + vo);

		// 세션 아이디, 어드민
		if(principal != null) {
			String cid = principal.getName();
			model.addAttribute("cid", cid);
			if(cid != null) {
				ConsumerVO consumer = userMapper.userGet(cid);
				model.addAttribute("consumer", consumer);
			}
		}

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
	public String modifyForm(@RequestParam("gnum") Long gnum, Model model, Principal principal) {

		// 세션 아이디, 어드민
		if(principal != null) {
			String cid = principal.getName();
			model.addAttribute("cid", cid);
			if(cid != null) {
				ConsumerVO consumer = userMapper.userGet(cid);
				model.addAttribute("consumer", consumer);
			}
		}

		GameInfoVO tvo = gameTagService.getTag(gnum);
		GameInfoVO rvo = requirementService.getRequirement(gnum);
		GameInfoVO vo = gameInfoService.getGame(gnum);
		log.info(vo);

		model.addAttribute("tvo", tvo);
		model.addAttribute("rvo", rvo);
		model.addAttribute("gvo", vo);
//		model.addAttribute("tagname", tagname);
//		model.addAttribute("cid", cid);
//		model.addAttribute("cadmin", cadmin);

		return "/gameinfo/gamemodify";
	}

}// end class
