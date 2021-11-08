package org.game.user.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.game.gameinfo.domain.GameInfoVO;
import org.game.user.domain.ConsumerBasketVO;
import org.game.user.service.ConsumerBasketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/gamepayment/*")
@AllArgsConstructor
public class ConsumerBasketController {
	
	@Autowired
	private ConsumerBasketService service;
	
	@GetMapping("/basketList")
	public String getBasketList(Principal principal, Model model) {
		
		String cid = principal.getName();
		
		if(cid == null) {
			return "redirect:/user/userLogin";
		}
		
		List<ConsumerBasketVO> BasketList = service.getConsumerBasketList(cid);
		
		model.addAttribute("basket", BasketList);
		model.addAttribute("cid", cid);
		
		return "/payment/consumerBasket";
	}
	
	@PostMapping("/basketAdd")
	public String additionConsumerBasket(long gnum, Principal principal, Model model) {

		String cid = principal.getName();

		if(cid == null) {
			return "redirect:/user/userLogin";
		}
		
		service.additionConsumerBasket(cid, gnum);
		
		return "redirect:/gamepayment/basketList";
	}
	
	@PostMapping("/basketRemove")
	public String removeConsumerBasket(long gnum, Principal principal, Model model) {
		
		String cid = principal.getName();

		if(cid == null) {
			return "redirect:/user/userLogin";
		}
		
		service.removeConsumerBasket(cid, gnum);
		
		return "redirect:/gamepayment/basketList?cid=" + cid;
	}
	
}
