package org.game.review.service;

import org.game.review.domain.ReviewCommentVO;

public interface ReviewCommentService {

	// 평가 댓글 최신 순 조회
	public ReviewCommentVO getReviewComment(long grnum);
	
	// 평가 댓글 작성
	public void writeReviewComment(ReviewCommentVO vo);
	
	// 평가 댓글 삭제
	public void removeReviewComment(long rcnum);
	
}
