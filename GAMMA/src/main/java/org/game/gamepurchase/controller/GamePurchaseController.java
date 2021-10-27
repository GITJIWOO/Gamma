package org.game.gamepurchase.controller;

import javax.servlet.http.HttpSession;

import org.game.gamelibrary.service.GameLibraryService;
import org.game.gamepurchase.domain.GamePurchaseVO;
import org.game.gamepurchase.service.GamePurchaseService;
import org.game.user.domain.ConsumerBasketVO;
import org.game.user.service.ConsumerBasketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/gamepayment/*")
@AllArgsConstructor
public class GamePurchaseController {
	
	@Autowired
	private GameLibraryService libraryService;
	
	@Autowired
	private ConsumerBasketService basketService;
	
	@Autowired
	private GamePurchaseService gamePurchaseService;
	
	@GetMapping("/paymentscreen")
	public String paymentScreen(ConsumerBasketVO basket, String merchant_uid, String cid, HttpSession session, Model model) {
		
		cid = (String)session.getAttribute("session_cid");
		
		if(cid == null) {
			return "redirect:/user/userLogin";
		}
		
		model.addAttribute("basket", basket);
		model.addAttribute("merchant_uid", merchant_uid);
		
		return "/payment/paymentScreen";
	}
	
	@PostMapping("/paymentsuccess")
	@ResponseBody
	public String paymentSuccess(GamePurchaseVO gpVO, @RequestParam("gnum") long gnum, HttpSession session) throws Exception {
		
		String cid = (String)session.getAttribute("session_cid");
		
		gpVO.setCid(cid);
		
		if(cid == null) {
			return "redirect:/user/userLogin";
		}
		gamePurchaseService.paymentInputInfo(gpVO);
		libraryService.additionalLibrary(cid, gnum);
		basketService.removeConsumerBasket(cid, gnum);
		
		return "";
	}
	
	@GetMapping("/consumerBreakdown")
	public String consumerBreakdown(String cid, HttpSession session, Model model) {

		cid = (String)session.getAttribute("session_cid");

		if(cid == null) {
			return "redirect:/user/userLogin";
		}
		
		
		return "/payment/paymentBreakdown";
	}
	
	@GetMapping("/successjsp")
	public String successJsp() {
		return "/payment/paymentSuccess";
	}
	
}
