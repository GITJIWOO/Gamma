package org.game.friends.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
		return "/friends/friendsmain";
	}
	
	// 현재 팔로우하는 친구 목록 가져오기
	@GetMapping("/followerlist")
	public String followerList(HttpSession session, FriendsSearchCriteria criteria, Model model) {
		log.info("로그인 계정이 팔로우하는 친구 목록 조회");
		// 로그인 세션 확인 
		String cid = String.valueOf(session.getAttribute("session_cid"));
		log.info("cid session: " + cid);
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
	public String followerRemove(String following, String follower, RedirectAttributes rttr) {
		service.removeFriend(follower, following);
		rttr.addAttribute("cid", following);
		rttr.addFlashAttribute("unfollow", "unfollow");
		rttr.addFlashAttribute("follower", follower);
		return "redirect:/friends/followerlist";
	}
	
	// 나를 팔로잉하는 친구 목록 가져오기
	@GetMapping("/followinglist")
	public String followingList(HttpSession session, FriendsSearchCriteria criteria, Model model) {
		log.info("로그인 계정을 팔로우하는 친구 목록 조회");
		// 로그인 세션 확인 
		String cid = String.valueOf(session.getAttribute("session_cid"));
		//String cadmin = String.valueOf(session.getAttribute("session_cadmin"));
		if(criteria.getKeyword() == null) {
			criteria.setKeyword("");			
		}
		List<FriendsVO> followingList = service.followingList(cid, criteria);
		FriendsPageDTO page = new FriendsPageDTO(criteria, service.countFollowing(criteria, cid), 10);
		model.addAttribute("cid", cid);
		model.addAttribute("followingList", followingList);
		model.addAttribute("page", page);
		return "/friends/followinglist";
	}
	
	// 언팔로우
	@PostMapping("/followingremove")
	public String followingRemove(String follower, String following, RedirectAttributes rttr) {
		System.out.println("로그인 계정 : " + follower);
		System.out.println("상대방 : " + following);
		service.removeFriend(follower, following);
		rttr.addAttribute("cid", follower);
		rttr.addFlashAttribute("unfollow", "unfollow");
		rttr.addFlashAttribute("following", following);
		return "redirect:/friends/followinglist";
	}

	// 전체 회원중에서 친구 추가할 회원 검색 
	@GetMapping("/searchfriends")
	public String searchFriends(HttpSession session, FriendsSearchCriteria criteria, Model model) {
		log.info("전체 회원중에서 친구 찾는 로직 실행");
		String cid = String.valueOf(session.getAttribute("session_cid"));
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
	
	// 채팅
	@GetMapping("/chat")
	public String chatroom(HttpSession session, Model model) {
		String cid = String.valueOf(session.getAttribute("session_cid"));
		model.addAttribute("cid", cid);
		log.info("cid 확인: " + cid);
		return "/friends/chat";
	}
}