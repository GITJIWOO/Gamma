package org.game.review.controller;

import org.game.review.service.ReviewCommentService;
import org.game.review.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	// 평가 최신 순 조회
	
	
	
	// 평가 좋아요 순 조회
	
	
	
	// 평가 상세 조회
	
	
	
	// 평가 작성
	
	
	
	// 평가 수정
	
	
	
	// 평가 삭제
	
	
	
	// 평가 댓글 작성
	
	
	
	// 평가 댓글 삭제
	
	
	
}
