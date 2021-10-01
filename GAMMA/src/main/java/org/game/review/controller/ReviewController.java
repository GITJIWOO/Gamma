package org.game.review.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.game.review.domain.ReviewCommentCriteria;
import org.game.review.domain.ReviewCommentDTO;
import org.game.review.domain.ReviewCommentVO;
import org.game.review.domain.ReviewLikeVO;
import org.game.review.domain.ReviewVO;
import org.game.review.service.ReviewCommentService;
import org.game.review.service.ReviewLikeService;
import org.game.review.service.ReviewService;
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
	
	// 모든 평가 조회
	@GetMapping("/reviewList/{gnum}")
	public String getReviewList(@PathVariable long gnum, String listKind, Model model) {
		if(listKind == null || listKind.equals("") || listKind.equals("famous")) {
			List<ReviewVO> famousReview = reviewService.getFamousReview(gnum);
			model.addAttribute("review", famousReview);
			model.addAttribute("gameNum", gnum);
		} else if(listKind.equals("new")) {
			List<ReviewVO> newReview = reviewService.getNewReview(gnum);
			model.addAttribute("review", newReview);
			model.addAttribute("gameNum", gnum);
		}
		return "/review/reviewList";
	}
	
	// 평가 상세 조회
	@GetMapping("/reviewDetail/{grnum}")
	public String getReviewDetail(@PathVariable long grnum, ReviewCommentCriteria rccri, HttpSession session, Model model) {
		
		// 리뷰 디테일
		ReviewVO review = reviewService.getReviewDetail(grnum);
		
		// 리뷰 댓글
		List<ReviewCommentVO> reviewComment = commentService.getReviewComment(grnum, rccri);

		// 리뷰 댓글 페이징
		int total = commentService.getAllReviewComment(grnum);
		ReviewCommentDTO pageBtn = new ReviewCommentDTO(rccri, total, 10);
		
		// 세션 아이디
		String cid = (String)session.getAttribute("member");
		
		// 좋아요 여부
		ReviewLikeVO rlvo = reviewLikeService.getReviewLike(grnum, cid);
		
		model.addAttribute("cid", cid);
		model.addAttribute("rlvo", rlvo);
		model.addAttribute("review", review);
		model.addAttribute("reviewComment", reviewComment);
		model.addAttribute("pageBtn", pageBtn);
		
		return "/review/reviewDetail";
	}
	
	// 평가 작성
	@PostMapping("/reviewWrite")
	public String writeReview(ReviewVO review, RedirectAttributes rttr) {
		
		reviewService.writeReview(review);
		
		rttr.addFlashAttribute("reviewNumber", review.getGrnum());
		
		return "redirect:/review/reviewList";
	}
	
	// 평가 수정
	@GetMapping("/reviewModify")
	public String modifyReview() {
		return "/review/reviewModify";
	}
	
	@PostMapping("/reviewModify")
	public String modifyReview(ReviewVO review, RedirectAttributes rttr) {
		
		reviewService.modifyReview(review);
		
		rttr.addFlashAttribute("reviewNumber", review.getGrnum());
		
		return "redirect:/review/reviewList";
	}
	
	// 평가 삭제
	@PostMapping("/reviewRemove")
	public String removeReview(long grnum, RedirectAttributes rttr) {
		
		reviewService.removeReview(grnum);

		rttr.addFlashAttribute("reviewNumber", grnum);
		
		return "redirect:/review/reviewList";
	}
	
	// 평가 좋아요
	@PostMapping("/reviewLike")
	public String likeReview(ReviewLikeVO vo, HttpSession session, RedirectAttributes rttr) {
		
		reviewLikeService.reviewLike(vo);
		reviewService.likeReview(vo.getGrnum());

		rttr.addFlashAttribute("grnum", vo.getGrnum());
		rttr.addFlashAttribute("cid", session.getAttribute("member"));
		
		return "redirect:/review/reviewDetail/" + vo.getGrnum();
	}
	
	// 평가 좋아요 취소
	@PostMapping("/reviewLikeCancel")
	public String likeCancelReview(long grnum, HttpSession session, RedirectAttributes rttr) {
		
		String cid = (String)session.getAttribute("member");
		
		reviewLikeService.reviewLikeCancel(grnum, cid);
		reviewService.likeReviewCancel(grnum);
		
		rttr.addFlashAttribute("grnum", grnum);
		rttr.addFlashAttribute("cid", cid);
		
		return "redirect:/review/reviewDetail/" + grnum;
	}
	
	// 평가 댓글 작성
	@PostMapping("/reviewCommmentWrite")
	public String writeReviewComment(ReviewCommentVO rc) {
		
		commentService.writeReviewComment(rc);
		
		return "redirect:/review/reviewDetail/" + rc.getGrnum();
	}
	
	// 평가 댓글 삭제
	@PostMapping("/reviewCommentRemove")
	public String removeReviewComment(ReviewCommentVO rc) {
		
		commentService.removeReviewComment(rc);
		
		return "redirect:/review/reviewDetail/" + rc.getGrnum();
	}
	
}
