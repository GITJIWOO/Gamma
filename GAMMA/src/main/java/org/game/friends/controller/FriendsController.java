package org.game.friends.controller;

import java.util.List;

import org.game.friends.domain.FriendsPageDTO;
import org.game.friends.domain.FriendsSearchCriteria;
import org.game.friends.domain.FriendsVO;
import org.game.friends.service.FriendsService;
import org.game.user.domain.ConsumerVO;
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
	
	
	// 메인화면 
	@GetMapping("/friendsmain")	// 이거 메인화면으로 바꾸기 
	public String friendsMain(Model model) {
		// 해당 로그인계정 정보 가져와야 함 - user service에서 세션확인
		//model.addAttribute("userId", cid);
		return "/friends/friendsmain";
	}
	
	// 현재 팔로우하는 친구 목록 가져오기
	@GetMapping("/followerlist")
	public String followerList(String cid, FriendsSearchCriteria criteria, Model model) {
		log.info("로그인 계정이 팔로우하는 친구 목록 조회");
		if(criteria.getKeyword() == null) {
			criteria.setKeyword("");			
		}
		List<FriendsVO> followerList = service.followerList(cid, criteria);
		FriendsPageDTO page = new FriendsPageDTO(criteria, service.countFollower(criteria, cid), 10);
		model.addAttribute("followerList", followerList);
		model.addAttribute("page", page);
		return "/friends/followerlist";
	}
	
	// 언팔로우 
	@PostMapping("/followerremove")
	public String followerRemove(String cid, String follower, RedirectAttributes rttr) {
		service.removeFriend(follower, cid);
		rttr.addAttribute("cid", cid);
		rttr.addFlashAttribute("unfollow", "unfollow");
		rttr.addFlashAttribute("follower", follower);
		return "redirect:/friends/followerlist";
	}
	
	// 나를 팔로잉하는 친구 목록 가져오기
	@GetMapping("/followinglist")
	public String followingList(String cid, FriendsSearchCriteria criteria, Model model) {
		log.info("로그인 계정을 팔로우하는 친구 목록 조회");
		if(criteria.getKeyword() == null) {
			criteria.setKeyword("");			
		}
		List<FriendsVO> followingList = service.followingList(cid, criteria);
		FriendsPageDTO page = new FriendsPageDTO(criteria, service.countFollowing(criteria, cid), 10);
		model.addAttribute("followingList", followingList);
		model.addAttribute("page", page);
		return "/friends/followinglist";
	}
	
	// 언팔로우
	@PostMapping("/followingremove")
	public String followingRemove(String cid, String following, RedirectAttributes rttr) {
		service.removeFriend(following, cid);
		rttr.addAttribute("cid", cid);
		rttr.addFlashAttribute("unfollow", "unfollow");
		rttr.addFlashAttribute("following", following);
		return "redirect:/friends/followinglist";
	}
	
	// 전체 회원중에서 친구 추가할 회원 검색 
	@GetMapping("/searchfriends")
	public String searchFriends(String cid, FriendsSearchCriteria criteria, Model model) {
		log.info("전체 회원중에서 친구 찾는 로직 실행");
		if(criteria.getKeyword() == null) {
			criteria.setKeyword("");			
		}
		List<ConsumerVO> userList = service.UserList(criteria, cid);
		FriendsPageDTO page = new FriendsPageDTO(criteria, service.countUser(criteria, cid), 10);
		model.addAttribute("userList", userList);
		model.addAttribute("page", page);
		return "/friends/searchfriends";
	}
	
	// 전체 회원중에서 친구 추가 - userPro와 연결 
	@PostMapping("/addfriends")
	public String addFriends(FriendsVO vo, RedirectAttributes rttr) {
		log.info("vo 들어오는지 확인: " + vo);
		service.addFriend(vo);
		/*
		 * friends 말고 user 로 리다이렉트
		rttr.addAttribute("pageNum", criteria.getPageNum());
		rttr.addAttribute("keyword", criteria.getKeyword());
		*/
		return "redirect:/user/userPro";
	}
	
	// 전체 회원중에서 친구 삭제 - userPro와 연결 
	@PostMapping("/removefriends")
	public String removeFriends(String follower, String following, RedirectAttributes rttr) {
		log.info("follower, 로그인계정이 언팔로우할 상대: " + follower);
		log.info("following, 로그인계정: " + following);
		service.removeFriend(follower, following);
		return "redirect:/user/userPro";
	}
}