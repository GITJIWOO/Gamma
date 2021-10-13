package org.game.gamepurchase.controller;

import javax.servlet.http.HttpSession;

import org.game.gamelibrary.service.GameLibraryService;
import org.game.user.domain.ConsumerBasketVO;
import org.game.user.service.ConsumerBasketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@GetMapping("/paymentscreen")
	public String paymentScreen(ConsumerBasketVO basket, long gnum, int gprice, Model model) {
		
		model.addAttribute("gnum", gnum);
		model.addAttribute("basket", basket);
		model.addAttribute("gprice", gprice);
		
		return "/payment/paymentScreen";
	}
	
	@PostMapping("/paymentsuccess")
	public String paymentSuccess(String cid, long gnum, HttpSession session) {

		cid = (String)session.getAttribute("session_cid");
		
		if(cid == null) {
			return "redirect:/user/userLogin";
		}
		
		libraryService.additionalLibrary(cid, gnum);
		basketService.removeConsumerBasket(cid, gnum);
		
		return "/payment/patmentSuccess";
	}
	
}
