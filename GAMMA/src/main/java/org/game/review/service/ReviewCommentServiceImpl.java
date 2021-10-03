package org.game.review.service;

import java.util.List;

import org.game.review.domain.ReviewCommentCriteria;
import org.game.review.domain.ReviewCommentVO;
import org.game.review.mapper.ReviewCommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReviewCommentServiceImpl implements ReviewCommentService {
	
	@Autowired
	private ReviewCommentMapper mapper; 

	// 평가 댓글 최신 순 조회
	@Override
	public List<ReviewCommentVO> getReviewComment(long grnum, ReviewCommentCriteria rccri) {
		List<ReviewCommentVO> reviewComment = mapper.reviewCommentSelect(grnum, rccri);
		return reviewComment;
	}

	// 평가 댓글 수 조회
	@Override
	public int getAllReviewComment(long grnum) {
		int total = mapper.reviewCommentCount(grnum);
		return total;
	}

	// 평가 댓글 모두 삭제
	@Override
	public void removeAllReviewComment(long grnum) {
		mapper.reviewCommentAllDelete(grnum);
	}

	// 평가 댓글 작성
	@Override
	public void writeReviewComment(ReviewCommentVO vo) {
		mapper.reviewCommentInsert(vo);
	}

	// 평가 댓글 삭제
	@Override
	public void removeReviewComment(ReviewCommentVO vo) {
		mapper.reviewCommentDelete(vo);
	}

}
