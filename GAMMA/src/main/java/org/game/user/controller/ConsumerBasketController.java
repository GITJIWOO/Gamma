package org.game.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
public class ConsumerBasketController {
	
	@Autowired
	private ConsumerBasketService service;
	
	@GetMapping("/basketList")
	public String getBasketList(HttpSession session, Model model) {

		String cid = (String)session.getAttribute("session_cid");
		
		if(cid == null) {
			return "redirect:/main";
		}
		
		List<ConsumerBasketVO> BasketList = service.getConsumerBasketList(cid);
		
		model.addAttribute("basket", BasketList);
		
		return "/payment/consumerBasket";
	}
	
	@PostMapping("/basketAdd")
	public String additionConsumerBasket(long gnum, HttpSession session, Model model) {

		String cid = (String)session.getAttribute("session_cid");
		
		service.additionConsumerBasket(cid, gnum);
		
		return "redirect:/gameInfo/get/" + gnum;
	}
	
	@PostMapping("/basketRemove")
	public String removeConsumerBasket(long gnum, HttpSession session, Model model) {
		
		String cid = (String)session.getAttribute("session_cid");
		
		service.removeConsumerBasket(cid, gnum);
		
		return "redirect:/payment/consumerBasket";
	}
	
}
