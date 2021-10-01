package org.game.review.mapper;

import org.apache.ibatis.annotations.Param;
import org.game.review.domain.ReviewLikeVO;

public interface ReviewLikeMapper {
	
	// 평가 좋아요 조회
	public ReviewLikeVO reviewLikeSelect(@Param("grnum") long grnum, @Param("cid") String cid);
	
	// 평가 좋아요 아이디 저장
	public void reviewLikeInsert(ReviewLikeVO rlvo);
	
	// 평가 좋아요 취소
	public void reviewLikeDelete(@Param("grnum") long grnum, @Param("cid") String cid);
}
