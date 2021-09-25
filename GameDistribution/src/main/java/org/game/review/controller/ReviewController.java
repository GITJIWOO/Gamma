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
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String getReviewList(String listKind, Model model) {
		if(listKind == null || listKind == "new") {
			List<ReviewVO> newReview = reviewService.getNewReview();
			model.addAttribute("review", newReview);
		} else if(listKind == "famous") {
			List<ReviewVO> famousReview = reviewService.getFamousReview();
			model.addAttribute("review", famousReview);
		}
		return "/review/reviewList";
	}
	
	// 평가 상세 조회
	
	
	
	// 평가 작성
	
	
	
	// 평가 수정
	
	
	
	// 평가 삭제
	
	
	
	// 평가 댓글 작성
	
	
	
	// 평가 댓글 삭제
	
	
	
}
