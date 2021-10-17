package org.game.review.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.game.gameinfo.domain.GameInfoVO;
import org.game.gameinfo.service.GameInfoService;
import org.game.review.domain.ReviewCommentCriteria;
import org.game.review.domain.ReviewCommentDTO;
import org.game.review.domain.ReviewCommentVO;
import org.game.review.domain.ReviewLikeVO;
import org.game.review.domain.ReviewVO;
import org.game.review.service.ReviewCommentService;
import org.game.review.service.ReviewLikeService;
import org.game.review.service.ReviewService;
import org.game.user.domain.ConsumerVO;
import org.game.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/review/*")
@AllArgsConstructor
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ReviewCommentService commentService;
	
	@Autowired
	private ReviewLikeService reviewLikeService;

	@Autowired
	private GameInfoService gameService;
	
	@Autowired
	private UserService userService;
	
	// 모든 평가 조회
	@GetMapping("/reviewList/{gnum}")
	public String getReviewList(@PathVariable("gnum") long gnum, String listKind, Model model) {
		GameInfoVO game = gameService.getGame(gnum);
		if(listKind == null || listKind.equals("") || listKind.equals("famous")) {
			List<ReviewVO> famousReview = reviewService.getFamousReview(gnum);
			model.addAttribute("review", famousReview);
			model.addAttribute("game", game);
		} else if(listKind.equals("new")) {
			List<ReviewVO> newReview = reviewService.getNewReview(gnum);
			model.addAttribute("review", newReview);
			model.addAttribute("game", game);
		}
		return "/review/reviewList";
	}
	
	// 평가 상세 조회
	@GetMapping("/reviewDetail/{grnum}")
	public String getReviewDetail(@PathVariable("grnum") long grnum, ReviewCommentCriteria rccri, HttpSession session, Model model) {
		
		// 리뷰 디테일 정보
		ReviewVO review = reviewService.getReviewDetail(grnum);
		
		// 게임 디테일 정보
		GameInfoVO game = gameService.getGame(review.getGnum());
		
		// 리뷰 작성 유저
		ConsumerVO reviewWriter = userService.userGet(review.getCid());
		
		// 리뷰 댓글
		List<ReviewCommentVO> reviewComment = commentService.getReviewComment(grnum, rccri);

		// 리뷰 댓글 페이징
		int total = commentService.getAllReviewComment(grnum);
		ReviewCommentDTO pageBtn = new ReviewCommentDTO(rccri, total, 10);
		
		// 세션 아이디, 어드민
		String cid = String.valueOf(session.getAttribute("session_cid"));
		String cadmin = String.valueOf(session.getAttribute("session_cadmin"));
		
		// 좋아요 여부
		ReviewLikeVO rlvo = reviewLikeService.getReviewLike(grnum, cid);
		
		model.addAttribute("cid", cid);
		model.addAttribute("rlvo", rlvo);
		model.addAttribute("game", game);
		model.addAttribute("cadmin", cadmin);
		model.addAttribute("review", review);
		model.addAttribute("pageBtn", pageBtn);
		model.addAttribute("reviewWriter", reviewWriter);
		model.addAttribute("reviewComment", reviewComment);
		
		return "/review/reviewDetail";
	}
	
	// 평가 작성
	@PostMapping("/reviewWrite")
	public String writeReview(ReviewVO review, HttpSession session, RedirectAttributes rttr) {
		
		long gnum = review.getGnum();
		String cid = String.valueOf(session.getAttribute("session_cid"));
		
		if(cid == null) {
			return "redirect:/review/reviewList/" + gnum;
		}
		
		reviewService.writeReview(review);
		
		rttr.addFlashAttribute("reviewNumber", review.getGrnum());
		
		return "redirect:/review/reviewList/" + gnum;
	}
	
	// 평가 수정
	@PostMapping("/reviewModify")
	public String modifyReview(ReviewVO review, HttpSession session, RedirectAttributes rttr) {
		
		long grnum = review.getGrnum();
		String cid = String.valueOf(session.getAttribute("session_cid"));
		
		if(cid == null) {
			return "redirect:/review/reviewDetail/" + grnum;
		}
		
		reviewService.modifyReview(review);
		
		rttr.addFlashAttribute("reviewNumber", review.getGrnum());
		
		return "redirect:/review/reviewDetail/" + grnum;
	}
	
	// 평가 삭제
	@PostMapping("/reviewRemove")
	public String removeReview(long grnum, HttpSession session, RedirectAttributes rttr) {
		
		ReviewVO grvo = reviewService.getReviewDetail(grnum);
		
		long gnum = grvo.getGnum();
		String cid = String.valueOf(session.getAttribute("session_cid"));
		
		if(cid == null) {
			return "redirect:/review/reviewDetail/" + grnum;
		}
		
		commentService.removeAllReviewComment(grnum);
		reviewService.removeReview(grnum);

		rttr.addFlashAttribute("reviewNumber", grnum);
		
		return "redirect:/review/reviewList/" + gnum;
	}
	
	// 평가 좋아요
	@PostMapping("/reviewLike")
	public String likeReview(ReviewLikeVO vo, HttpSession session, RedirectAttributes rttr) {
		
		long grnum = vo.getGrnum();
		String cid = String.valueOf(session.getAttribute("session_cid"));
		
		if(cid == null) {
			return "redirect:/review/reviewDetail/" + grnum;
		}
		
		reviewLikeService.reviewLike(vo);
		reviewService.likeReview(vo.getGrnum());

		rttr.addFlashAttribute("grnum", vo.getGrnum());
		rttr.addFlashAttribute("cid", cid);
		
		return "redirect:/review/reviewDetail/" + grnum;
	}
	
	// 평가 좋아요 취소
	@PostMapping("/reviewLikeCancel")
	public String likeCancelReview(long grnum, String cid, HttpSession session, RedirectAttributes rttr) {
		
		reviewLikeService.reviewLikeCancel(grnum, cid);
		reviewService.likeReviewCancel(grnum);
		
		rttr.addFlashAttribute("cid", cid);
		rttr.addFlashAttribute("grnum", grnum);
		
		return "redirect:/review/reviewDetail/" + grnum;
	}
	
	// 평가 댓글 작성
	@PostMapping("/reviewCommentWrite")
	public String writeReviewComment(ReviewCommentVO rc, HttpSession session) {
		
		long grnum = rc.getGrnum();
		String cid = String.valueOf(session.getAttribute("session_cid"));
		
		if(cid == null) {
			return "redirect:/review/reviewDetail/" + grnum;
		}
		
		commentService.writeReviewComment(rc);
		
		return "redirect:/review/reviewDetail/" + grnum;
	}
	
	// 평가 댓글 삭제
	@PostMapping("/reviewCommentRemove")
	public String removeReviewComment(ReviewCommentVO rc, HttpSession session) {
		
		long grnum = rc.getGrnum();
		String cid = String.valueOf(session.getAttribute("session_cid"));
		
		if(cid == null) {
			return "redirect:/review/reviewDetail/" + grnum;
		}
		
		commentService.removeReviewComment(rc);
		
		return "redirect:/review/reviewDetail/" + grnum;
	}
	
}
