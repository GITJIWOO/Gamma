package org.game.review.service;

import java.util.List;

import org.game.review.domain.ReviewVO;
import org.game.review.mapper.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewMapper mapper;
	
	@Override
	public List<ReviewVO> getNewReview(long gnum) {
		List<ReviewVO> reviewList = mapper.reviewList(gnum);
		return reviewList;
	}

	@Override
	public List<ReviewVO> getFamousReview(long gnum) {
		List<ReviewVO> reviewFamousList = mapper.reviewRecommendList(gnum);
		return reviewFamousList;
	}

	@Override
	public ReviewVO getReviewDetail(long grnum) {
		ReviewVO ReviewDetail = mapper.reviewSelect(grnum);
		return ReviewDetail;
	}

	@Override
	public ReviewVO getUserReviewDetail(String cid, long gnum) {
		mapper.UserReviewSelect(cid, gnum);
		return null;
	}

	@Override
	public void writeReview(ReviewVO review) {
		mapper.reviewInsert(review);
	}

	@Override
	public void modifyReview(ReviewVO review) {
		mapper.reviewUpdate(review);
	}

	@Override
	public void removeReview(long grnum) {
		mapper.reviewDelete(grnum);
	}
	
	@Override
	public void likeReview(long grnum) {
		mapper.reviewLike(grnum);
	}

	@Override
	public void likeReviewCancel(long grnum) {
		mapper.reviewLikeDelete(grnum);
	}

}
