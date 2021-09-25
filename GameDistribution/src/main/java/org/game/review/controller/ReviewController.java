package org.game.review.controller;

import java.util.List;

import org.game.review.domain.ReviewCommentVO;
import org.game.review.domain.ReviewVO;
import org.game.review.service.ReviewCommentService;
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
	
	// 모든 평가 조회
	@GetMapping("/reviewList")
	public String getReviewList(long gnum, String listKind, Model model) {
		
		if(listKind == null || listKind == "new") {
			List<ReviewVO> newReview = reviewService.getNewReview(gnum);
			model.addAttribute("review", newReview);
		} else if(listKind == "famous") {
			List<ReviewVO> famousReview = reviewService.getFamousReview(gnum);
			model.addAttribute("review", famousReview);
		}
		return "/review/reviewList";
	}
	
	// 평가 상세 조회
	@GetMapping("/reviewDetail/{grnum}")
	public String getReviewDetail(@PathVariable long grnum, Model model) {
		
		ReviewVO review = reviewService.getReviewDetail(grnum);
		
		model.addAttribute("review", review);
		
		return "/review/reviewDetail";
	}
	
	// 평가 작성
	@GetMapping("/review/reviewWrite")
	public String writeReview(Model model) {
		return "/review/reviewWrite";
	}
	
	// 평가 수정
	@PostMapping("/review/reviewWrite")
	public String writeReview(RedirectAttributes rttr) {
		
		
		
		return "redirect:/review/reviewList";
	}
	
	// 평가 삭제
	
	
	
	// 평가 댓글 작성
	
	
	
	// 평가 댓글 삭제
	
	
	
}
