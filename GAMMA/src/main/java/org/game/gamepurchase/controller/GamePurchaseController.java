package org.game.gamepurchase.controller;

import org.game.user.domain.ConsumerBasketVO;
import org.springframework.stereotype.Controller;
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
	
	@GetMapping("/paymentscreen")
	public String paymentScreen() {
		
		return "/payment/paymentScreen";
	}
	
	@PostMapping("/paymentsuccess")
	public String paymentSuccess(ConsumerBasketVO basvo) {
		
		log.info("들어온 장바구니 : " + basvo);
		
		return "/payment/patmentSuccess";
	}
	
}
