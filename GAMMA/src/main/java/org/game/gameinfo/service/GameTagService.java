package org.game.gameinfo.service;

import org.game.gameinfo.domain.GameTagVO;

public interface GameTagService {

	public void registerTag(GameTagVO vo);	// 태그등록
	
	public GameTagVO getTag(Long gtnum);	// 태그 조회
	
	public void modifyTag(GameTagVO vo);	// 태그 수정
	
	public void removeTag(Long gtnum);		// 태그 삭제
}
