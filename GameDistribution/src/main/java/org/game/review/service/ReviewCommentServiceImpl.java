package org.game.review.service;

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
	
	@Override
	public ReviewCommentVO getReviewComment(long grnum) {
		ReviewCommentVO reviewComment = mapper.reviewCommentSelect(grnum);
		return reviewComment;
	}

	@Override
	public void writeReviewComment(ReviewCommentVO vo) {
		mapper.reviewCommentInsert(vo);
	}

	@Override
	public void removeReviewComment(long rcnum) {
		mapper.reviewCommentDelete(rcnum);
	}
}
