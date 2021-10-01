package org.game.review.service;

import org.game.review.domain.ReviewLikeVO;

public interface ReviewLikeService {
	
	// 평가 좋아요 조회
	public ReviewLikeVO getReviewLike(long grnum, String cid);
	
	// 평가 좋아요
	public void reviewLike(ReviewLikeVO vo);
	
	// 평가 좋아요 취소
	public void reviewLikeCancel(long grnum, String cid);
}
