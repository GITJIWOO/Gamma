package org.game.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.game.user.domain.ConsumerVO;
import org.game.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {
	@Autowired
	private UserService service;
	
	@GetMapping("/userjoin")
	public 
	
	/*
	 * @PostMapping("/userlogin") public String login(ConsumerVO userVO,
	 * HttpServletRequest request) {
	 * 
	 * ConsumerVO userVO = service.userSearch(userVO); HttpSession session =
	 * request.getSession(); session.setAttribute("userVO", userVO);
	 * 
	 * return "userlogin"; }
	 * 
	 * @PostMapping("/userlogout") public String
	 * userLogout(@ModelAttribute("userVO") ConsumerVO userVO, HttpServletRequest
	 * request) {
	 * 
	 * service.userlogout(userVO); HttpSession session = request.getSession();
	 * session.invalidate();
	 * 
	 * return "redirect:/user/userlogin"; }
	 * 
	 */
}
