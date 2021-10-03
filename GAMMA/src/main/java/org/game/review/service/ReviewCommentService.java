package org.game.review.service;

import java.util.List;

import org.game.review.domain.ReviewCommentCriteria;
import org.game.review.domain.ReviewCommentVO;

public interface ReviewCommentService {

	// 평가 댓글 최신 순 조회
	public List<ReviewCommentVO> getReviewComment(long grnum, ReviewCommentCriteria rccri);
	
	// 평가 댓글 수 조회
	public int getAllReviewComment(long grnum);
	
	// 평가 댓글 모두 삭제
	public void removeAllReviewComment(long grnum);
	
	// 평가 댓글 작성
	public void writeReviewComment(ReviewCommentVO vo);
	
	// 평가 댓글 삭제
	public void removeReviewComment(ReviewCommentVO vo);
	
}
