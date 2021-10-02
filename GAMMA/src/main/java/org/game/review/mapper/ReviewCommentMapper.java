package org.game.review.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.game.review.domain.ReviewCommentCriteria;
import org.game.review.domain.ReviewCommentVO;

public interface ReviewCommentMapper {
	
	// 평가 댓글 최신 순 조회
	public List<ReviewCommentVO> reviewCommentSelect(@Param("grnum") long grnum, @Param("rccri") ReviewCommentCriteria rccri);
	
	// 평가 댓글 수
	public int reviewCommentCount(long grnum);
	
	// 평가의 모든 댓글 삭제
	public void reviewCommentAllDelete(long grnum);
	
	// 평가 댓글 작성
	public void reviewCommentInsert(ReviewCommentVO vo);
	
	// 평가 댓글 삭제
	public void reviewCommentDelete(ReviewCommentVO vo);
	
}
