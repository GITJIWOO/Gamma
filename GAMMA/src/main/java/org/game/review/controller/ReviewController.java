package org.game.review.controller;

import java.security.Principal;
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
import org.springframework.security.access.prepost.PreAuthorize;
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
	@PreAuthorize("permitAll")
	@GetMapping("/reviewList/{gnum}")
	public String getReviewList(@PathVariable("gnum") long gnum, String listKind, Principal principal, Model model) {
		
		if(principal != null) {
			String cid = principal.getName();
			model.addAttribute("cid", cid);
		}
		
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
	@PreAuthorize("permitAll")
	@GetMapping("/reviewDetail/{grnum}")
	public String getReviewDetail(@PathVariable("grnum") long grnum, ReviewCommentCriteria rccri, Principal principal, Model model) {
		
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
		if(principal != null) {
			String cid = principal.getName();
			model.addAttribute("cid", cid);
			// 좋아요 여부
			if(cid != null) {
				ReviewLikeVO rlvo = reviewLikeService.getReviewLike(grnum, cid);
				model.addAttribute("rlvo", rlvo);
			}
		}
		
		model.addAttribute("game", game);
		model.addAttribute("review", review);
		model.addAttribute("pageBtn", pageBtn);
		model.addAttribute("reviewWriter", reviewWriter);
		model.addAttribute("reviewComment", reviewComment);
		
		return "/review/reviewDetail";
	}
	
	// 평가 작성
	@PreAuthorize("hasAnyRole('ROLE_MEMBER')")
	@PostMapping("/reviewWrite")
	public String writeReview(ReviewVO review, Principal principal, Model model) {
		
		long gnum = review.getGnum();
		
		reviewService.writeReview(review);
		
		model.addAttribute("reviewNumber", review.getGrnum());
		
		return "redirect:/review/reviewList/" + gnum;
	}
	
	// 평가 수정
	@PreAuthorize("hasAnyRole('ROLE_MEMBER')")
	@PostMapping("/reviewModify")
	public String modifyReview(ReviewVO review, Principal principal, Model model) {
		
		long grnum = review.getGrnum();
		
		String cid = principal.getName();
		
		reviewService.modifyReview(review);
		
		model.addAttribute("cid", cid);
		model.addAttribute("reviewNumber", review.getGrnum());
		
		return "redirect:/review/reviewDetail/" + grnum;
	}
	
	// 평가 삭제
	@PreAuthorize("hasAnyRole('ROLE_MEMBER')")
	@PostMapping("/reviewRemove")
	public String removeReview(long grnum, Principal principal, Model model) {
		
		ReviewVO grvo = reviewService.getReviewDetail(grnum);
		
		long gnum = grvo.getGnum();
		String cid = principal.getName();
		
		commentService.removeAllReviewComment(grnum);
		reviewService.removeReview(grnum);

		model.addAttribute("cid", cid);
		model.addAttribute("reviewNumber", grnum);
		
		return "redirect:/review/reviewList/" + gnum;
	}
	
	// 평가 좋아요
	@PreAuthorize("hasAnyRole('ROLE_MEMBER')")
	@PostMapping("/reviewLike")
	public String likeReview(ReviewLikeVO vo, Principal principal, Model model) {
		
		long grnum = vo.getGrnum();
		String cid = principal.getName();
		
		reviewLikeService.reviewLike(vo);
		reviewService.likeReview(vo.getGrnum());

		model.addAttribute("cid", cid);
		model.addAttribute("grnum", vo.getGrnum());
		
		return "redirect:/review/reviewDetail/" + grnum;
	}
	
	// 평가 좋아요 취소
	@PreAuthorize("hasAnyRole('ROLE_MEMBER')")
	@PostMapping("/reviewLikeCancel")
	public String likeCancelReview(long grnum, Principal principal, Model model) {

		String cid = principal.getName();
		
		reviewLikeService.reviewLikeCancel(grnum, cid);
		reviewService.likeReviewCancel(grnum);
		
		model.addAttribute("cid", cid);
		model.addAttribute("grnum", grnum);
		
		return "redirect:/review/reviewDetail/" + grnum;
	}
	
	// 평가 댓글 작성
	@PreAuthorize("hasAnyRole('ROLE_MEMBER')")
	@PostMapping("/reviewCommentWrite")
	public String writeReviewComment(ReviewCommentVO rc, Principal principal, Model model) {
		
		long grnum = rc.getGrnum();
		String cid = principal.getName();
		
		commentService.writeReviewComment(rc);
		
		model.addAttribute("cid", cid);
		
		return "redirect:/review/reviewDetail/" + grnum;
	}
	
	// 평가 댓글 삭제
	@PreAuthorize("hasAnyRole('ROLE_MEMBER')")
	@PostMapping("/reviewCommentRemove")
	public String removeReviewComment(ReviewCommentVO rc, Principal principal, Model model) {
		
		long grnum = rc.getGrnum();
		String cid = principal.getName();
		
		commentService.removeReviewComment(rc);

		model.addAttribute("cid", cid);
		
		return "redirect:/review/reviewDetail/" + grnum;
	}
	
}
