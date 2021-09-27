package org.game.review.mapper;

import java.util.List;

import org.game.review.domain.ReviewVO;

public interface ReviewMapper {
	
	// 평가 최신 순 조회
	public List<ReviewVO> reviewList(long gnum);
	
	// 평가 좋아요 순 조회
	public List<ReviewVO> reviewRecommendList(long gnum);
	
	// 평가 상세 조회
	public ReviewVO reviewSelect(long grnum);
	
	// 평가 작성
	public void reviewInsert(ReviewVO vo); 
	
	// 평가 수정
	public void reviewUpdate(ReviewVO vo);
	
	// 평가 삭제
	public void reviewDelete(long grnum);
	
	// 평가 좋아요
	public void reviewLike(long grnum);
	
}
