package org.game.friends.controller;

import java.util.List;

import org.game.friends.domain.FriendsVO;
import org.game.friends.service.FriendsService;
import org.game.user.domain.ConsumerVO;
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
@RequestMapping("/friends/*")
@AllArgsConstructor
public class FriendsController {
	@Autowired
	private FriendsService service;
	
	// 메인화면 
	@GetMapping("/friendsmain")
	public String friendsMain(Model model) {
		// 해당 로그인계정 정보 가져와야 함
		//model.addAttribute("userId", cid);
		return "/friends/friendsmain";
	}
	
	// 현재 친구 목록 가져오기
	@PostMapping("/friendslist")
	public String friendsList(String keyword, Model model) {
		// 해당 로그인계정 정보 가져와야 함
//		model.addAttribute("userId", cid);
//		List<FriendsVO> followerList = service.FollowerList(cid, keyword);
//		List<FriendsVO> followingList = service.FollowerList(cid, keyword);
//		model.addAttribute("followerList", followerList);
//		model.addAttribute("followingList", followingList);
		return "friends/friendslist";
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
