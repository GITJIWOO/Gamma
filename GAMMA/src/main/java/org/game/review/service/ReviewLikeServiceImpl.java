package org.game.review.service;

import org.game.review.domain.ReviewLikeVO;
import org.game.review.mapper.ReviewLikeMapper;
import org.game.review.mapper.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReviewLikeServiceImpl implements ReviewLikeService{
	
	@Autowired
	private ReviewLikeMapper mapper;

	@Override
	public ReviewLikeVO getReviewLike(long grnum, String cid) {
		ReviewLikeVO reviewLike = mapper.reviewLikeSelect(grnum, cid);
		return reviewLike;
	}
	
	@Override
	public void reviewLike(ReviewLikeVO vo) {
		mapper.reviewLikeInsert(vo);
	}

	@Override
	public void reviewLikeCancel(long grnum, String cid) {
		mapper.reviewLikeDelete(grnum, cid);
	}

}
