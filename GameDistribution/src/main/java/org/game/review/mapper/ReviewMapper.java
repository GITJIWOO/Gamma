package org.game.review.mapper;

import java.util.List;

import org.game.review.domain.ReviewVO;

public interface ReviewMapper {
	
	// 평가 조회
	public List<ReviewVO> ReviewList();
	
	// 평가 상세 조회
	public ReviewVO reviewSelect();
	
	// 평가 작성
	public void reviewInsert(ReviewVO vo); 
	
	// 평가 수정
	public void reviewUpdate(ReviewVO vo);
	
	// 평가 삭제
	public void reviewDelete(long gnum);
	
}
