package org.game.gameinfo.service;

import org.game.gameinfo.domain.RequirementVO;

public interface RequirementService {

	// 사양 등록
	public void registerRequirement(RequirementVO vo);
	
	// 사양 조회
	public RequirementVO getRequirement(Long grnum);
	
	// 사양수정
	public void modifyRequirement(RequirementVO vo);
	
	// 사양 삭제
	public void removeRequirement(Long grnum);
}
