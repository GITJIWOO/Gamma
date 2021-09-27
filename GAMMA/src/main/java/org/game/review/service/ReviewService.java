package org.game.review.service;

import java.util.List;

import org.game.review.domain.ReviewVO;

public interface ReviewService {
	
	// 평가 최신 순 조회
	public List<ReviewVO> getNewReview(long gnum);
	
	// 평가 좋아요 순 조회
	public List<ReviewVO> getFamousReview(long gnum);
	
	// 평가 상세 조회
	public ReviewVO getReviewDetail(long grnum);
	
	// 평가 작성
	public void writeReview(ReviewVO review);
	
	// 평가 수정
	public void modifyReview(ReviewVO review);
	
	// 평가 삭제
	public void removeReview(long grnum);
	
	// 평가 좋아요
	public void likeReview(long grnum);
	
}
