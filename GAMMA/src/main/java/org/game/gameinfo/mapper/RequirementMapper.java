package org.game.gameinfo.mapper;

import org.game.gameinfo.domain.GameInfoVO;
import org.game.gameinfo.domain.RequirementVO;

public interface RequirementMapper {

	// 게임 요구사양 조회
	public GameInfoVO selectRequirement(Long gnum);
	
	// 요구사양 추가
	public void insertRequirement(GameInfoVO vo);
	
	// 요구사양 삭제
	public void deleteRequirement(Long gnum);
	
	// 요구사양 수정
	public void updateRequirement(GameInfoVO vo);
}
