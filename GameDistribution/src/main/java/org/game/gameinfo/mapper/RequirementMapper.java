package org.game.gameinfo.mapper;

import org.game.gameinfo.domain.RequirementVO;

public interface RequirementMapper {

	// 게임 요구사양 조회
	public RequirementVO selectRequirement(Long grNum);
	
	// 요구사양 추가
	public void insertrequirement(RequirementVO vo);
	
	// 요구사양 삭제
	public void deleteRequirement(Long grNum);
	
	// 요구사양 수정
	public void updateRequirement(RequirementVO vo);
}
