package org.game.friends.controller;

import java.util.List;

import org.game.friends.domain.FriendsVO;
import org.game.friends.service.FriendsService;
import org.game.user.domain.ConsumerVO;
import org.game.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/friends/*")
@AllArgsConstructor
public class FriendsController {
	@Autowired
	private FriendsService service;
	
	@Autowired
	private UserService uservice;
	
	// 메인화면 
	@GetMapping("/friendsmain")
	public String friendsMain(Model model) {
		// 해당 로그인계정 정보 가져와야 함 - user service에서 세션확인
		//model.addAttribute("userId", cid);
		return "/friends/friendsmain";
	}
	
	// 현재 팔로우하는 친구 목록 가져오기
	@PostMapping("/followerlist")
	public String followerList(String keyword, Model model) {
		// 해당 로그인계정 정보 가져와야 함
//		model.addAttribute("userId", cid);
//		List<FriendsVO> followerList = service.followerList(cid, keyword);
//		model.addAttribute("followerList", followerList);
		return "/friends/followerlist";
	}
	
	// 언팔로우 
	@PostMapping("/followerremove")
	public String followerRemove(String cid, String follower, RedirectAttributes rttr) {
		service.removeFriend(follower, cid);
		rttr.addFlashAttribute("userId", cid);
		return "redirect:/friends/followerlist";
	}
	
	// 나를 팔로잉하는 친구 목록 가져오기
	@PostMapping("/followinglist")
	public String followingList(String keyword, Model model) {
		// 해당 로그인계정 정보 가져와야 함
//		model.addAttribute("userId", cid);
//		List<FriendsVO> followingList = service.followerList(cid, keyword);
//		model.addAttribute("followingList", followingList);
		return "/friends/followinglist";
	}
	
	// 언팔로우
	@PostMapping("/followingremove")
	public String followingRemove(String cid, String following, RedirectAttributes rttr) {
		service.removeFriend(following, cid);
		rttr.addFlashAttribute("userId", cid);
		return "redirect:/friends/followinglist";
	}
	
	// 전체 회원중에서 친구 추가할 회원 검색 
	@GetMapping("/searchfriends")
	public String searchFriends(String keyword, Model model) {
		log.info("전체 회원중에서 친구 찾는 로직 실행");
		if(keyword == null) {
			keyword = "";
		}
		List<ConsumerVO> userList = service.UserList(keyword);
		model.addAttribute("userList", userList);
		model.addAttribute("keyword", keyword);
		return "/friends/searchfriends";
	}
}
