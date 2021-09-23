package org.game.review.mapper;

import org.game.review.domain.ReviewCommentVO;

public interface ReviewCommentMapper {
	
	// 평가 댓글 조회
	public ReviewCommentVO reviewCommentSelect(long grnum);
	
	// 평가 댓글 작성
	public void reviewCommentInsert(ReviewCommentVO vo);
	
	// 평가 댓글 삭제
	public void reviewCommentDelete(long rcnum);
}
